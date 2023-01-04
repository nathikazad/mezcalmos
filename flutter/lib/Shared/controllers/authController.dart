// import 'dart:async';
// import 'dart:convert';
// import 'dart:io';
// import 'dart:math';

// import 'package:cloud_functions/cloud_functions.dart';
// import 'package:crypto/crypto.dart';
// import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
// import 'package:firebase_core/firebase_core.dart' as firebase_core;
// import 'package:firebase_database/firebase_database.dart';
// import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
// import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';
// import 'package:mezcalmos/Shared/constants/global.dart';
// import 'package:mezcalmos/Shared/controllers/firbaseAuthController.dart';
// import 'package:mezcalmos/Shared/controllers/languageController.dart';
// import 'package:mezcalmos/Shared/database/FirebaseDb.dart';
// import 'package:mezcalmos/Shared/firebaseNodes/rootNodes.dart';
// import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
// import 'package:mezcalmos/Shared/models/User.dart';
// import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
// import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';
// import 'package:mezcalmos/Shared/widgets/MezSnackbar.dart';
// // import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import 'dart:async';
import 'dart:io';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/user/hsUser.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/models/User.dart';
import 'package:mezcalmos/Shared/models/Utilities/Generic.dart';
import 'package:mezcalmos/Shared/models/Utilities/ServerResponse.dart';

dynamic _i18n() => Get.find<LanguageController>().strings['Shared']
    ['controllers']['authController'];

class AuthController extends GetxController {
  fireAuth.FirebaseAuth _auth = fireAuth.FirebaseAuth.instance;
  Function _onSignOutCallback;
  Function _onSignInCallback;

  RxnInt _hasuraUserId = RxnInt();
  int? get hasuraUserId => _hasuraUserId.value;

  UserInfo? _userInfo;
  UserInfo? get user => _userInfo;
  set user(UserInfo? _u) => _userInfo = _u;

  StreamController<fireAuth.User?> _authStateStreamController =
      StreamController<fireAuth.User?>.broadcast();

  Stream<fireAuth.User?> get authStateStream =>
      _authStateStreamController.stream;

  bool get isUserSignedIn => _auth.currentUser != null;
  fireAuth.User? get fireAuthUser => fireAuth.FirebaseAuth.instance.currentUser;
  final HasuraDb hasuraDb = Get.find<HasuraDb>();

  AuthController(this._onSignInCallback, this._onSignOutCallback);
  String? _previousUserValue = "init";
  bool preserveNavigationStackAfterSignIn = false;

  @override
  void onInit() {
    super.onInit();
    // _authStateStream.addStream(_auth.authStateChanges());

    mezDbgPrint('Auth controller init!');
    _auth.authStateChanges().listen((fireAuth.User? user) async {
      if (user?.toString() == _previousUserValue) {
        mezDbgPrint(
            'Authcontroller:: same sign in event fired again, skipping it');
        return;
      }
      _previousUserValue = user?.toString();

      mezDbgPrint('Authcontroller:: Auth state change!');
      mezDbgPrint(user?.hashCode);
      mezDbgPrint(user ?? "empty");

      if (user == null) {
        _hasuraUserId.value = null;
        await hasuraDb.initializeHasura();
        await _onSignOutCallback();
        mezDbgPrint('AuthController: User is currently signed out!');
      } else {
        mezDbgPrint('AuthController: User is currently signed in!');

        fireAuth.IdTokenResult? tokenResult = await user.getIdTokenResult(true);
        mezDbgPrint(tokenResult.claims);

        if (tokenResult.claims?['https://hasura.io/jwt/claims'] == null) {
          mezDbgPrint("No token, calling addHasuraClaims");

          await FirebaseFunctions.instance
              .httpsCallable('user-addHasuraClaim')
              .call();

          tokenResult = await user.getIdTokenResult(true);
        }
        _hasuraUserId.value = int.parse(tokenResult
            .claims!['https://hasura.io/jwt/claims']['x-hasura-user-id']);

        mezDbgPrint(_hasuraUserId.value);

        await hasuraDb.initializeHasura();
        await fetchUserInfoFromHasura();
        await _onSignInCallback();
      }

      _authStateStreamController.add(user);
    });

    super.onInit();
  }

  Future<void> fetchUserInfoFromHasura() async {
    mezDbgPrint(
        "[777] fetchingUser Info from hasure using firebaseid : ${fireAuthUser?.uid} \n hasura id : $hasuraUserId ");

    _userInfo = await get_user_by_hasura_id(hasuraId: _hasuraUserId.value!);
    mezDbgPrint(
        "[77] =====> fetchUserInfoFromHasura:: userInfo ===> ${_userInfo?.toFirebaseFormatJson()}");
  }

  bool isDisplayNameSet() {
    return user?.isNameSet ?? false;
  }

  bool isUserImgSet() {
    return user?.isImageSet ?? false;
  }

  DateTime? getUserCreationDate() {
    return fireAuth.FirebaseAuth.instance.currentUser!.metadata.creationTime;
  }

  Future<ServerResponse> deleteAccount() async {
    final HttpsCallable deleteUserFunction =
        FirebaseFunctions.instance.httpsCallable('user-deleteUserAccount');
    try {
      final HttpsCallableResult<Map<String, dynamic>> response =
          await deleteUserFunction.call({});
      mezDbgPrint("Responso ===> $response");
      final ServerResponse _resp = ServerResponse.fromJson(response.data);

      if (_resp.success) {
        await signOut();
      }
      return _resp;
    } catch (e, st) {
      mezDbgPrint("Error $e | StackTrace $st");
      return ServerResponse(ResponseStatus.Error,
          errorMessage: "Server Error", errorCode: "serverError");
    }
  }

  /// This Functions takes a File (Image) and an optional [isCompressed]
  ///
  /// And Upload it to firebaseStorage with at users/[uid]/avatar/[uid].[isCompressed ? 'cmpressed' : 'original'].[extension]
  Future<String> uploadUserImgToFbStorage({
    required File imageFile,
    bool isCompressed = false,
  }) async {
    String _uploadedImgUrl;
    final List<String> splitted = imageFile.path.split('.');
    final String imgPath =
        "users/$hasuraUserId/avatar/$hasuraUserId.${isCompressed ? 'compressed' : 'original'}.${splitted[splitted.length - 1]}";
    try {
      await firebase_storage.FirebaseStorage.instance
          .ref(imgPath)
          .putFile(imageFile);
    } on firebase_core.FirebaseException catch (e) {
      mezDbgPrint(e.message.toString());
    } finally {
      _uploadedImgUrl = await firebase_storage.FirebaseStorage.instance
          .ref(imgPath)
          .getDownloadURL();
    }

    return _uploadedImgUrl;
  }

  Future<String> uploadUserImgToFbStorageForWeb({
    required XFile pikedFile,
    required Uint8List uint8list,
    bool isCompressed = false,
  }) async {
    String? _uploadedImgUrl;

    mezDbgPrint("::::: log {{{{ ${pikedFile.path}  }}}}}");
    final List<String> splitted = pikedFile.path.split('.');
    final String imgPath =
        "users/$hasuraUserId/avatar/$hasuraUserId/${isCompressed ? 'compressed' : 'original'}.${splitted[splitted.length - 1]}";
    mezDbgPrint("::::: log {{{{ ${imgPath}  }}}}}");
    try {
      // await firebase_storage.FirebaseStorage.instance.ref(imgPath).putData(
      //     await pikedFile.readAsBytes(),
      //     SettableMetadata(
      //       cacheControl: "public,max-age=300",
      //       contentType: "image/jpeg",
      //     )
      //     // metadata: SettableMetadata()
      //     );
      String fileResult = await pikedFile.readAsString();
      mezDbgPrint("inside the uploade function ${fileResult}");
      await firebase_storage.FirebaseStorage.instance.ref(imgPath).putData(
            uint8list,
            // SettableMetadata(
            //   cacheControl: "public,max-age=300",
            //   contentType: "image/jpeg",
            // )
            // metadata: SettableMetadata()
          );

      _uploadedImgUrl = await firebase_storage.FirebaseStorage.instance
          .ref(imgPath)
          .getDownloadURL()
          .then((value) {
        mezDbgPrint("ℹ️ℹ️ℹ️ℹ️ℹ️ℹ️ℹ️ the url is value ${value}");
        return value;
      });
    } catch (e, s) {
      mezDbgPrint(
          "this an error happen in :::uploadUserImgToFbStorageForWeb:: function ${e.toString()}");
    }

    //       .catchError((e) {

    //   }).whenComplete(() async {

    // } on firebase_core.FirebaseException catch (e) {
    //   mezDbgPrint(e.message.toString());
    // }

    return _uploadedImgUrl!;
  }

  /// this is for setting the Original size of the image that was picked by the user,
  ///
  /// Made as a seprated function and not along with [editUserProfile]'s parameteres,
  ///
  /// because that was we won't need to wait for them both to get uploaded.
  Future<void> setOriginalUserImage(String? originalImageUrl) async {
    if (originalImageUrl != null) {
      // TODO: set hasura image
      // await _databaseHelper.firebaseDatabase
      //     .ref()
      //     .child(userInfoNode(fireAuthUser!.uid))
      //     .child('bigImage')
      //     .set(originalImageUrl);
      await change_user_img(
        userId: user!.hasuraId,
        img: originalImageUrl,
        isBigImg: true,
      );
    }
  }

  Future<void> editUserProfile(String? name, String? compressedImageUrl) async {
    if (name != null) {
      // TODO: set hasura name
      // await _databaseHelper.firebaseDatabase
      //     .ref()
      //     .child(userInfoNode(fireAuthUser!.uid))
      //     .child('name')
      //     .set(name);
      await change_username(userId: user!.hasuraId, name: name);
    }
    if (compressedImageUrl != null && compressedImageUrl.isURL) {
      // TODO: set hasura compressed_image
      // await _databaseHelper.firebaseDatabase
      //     .ref()
      //     .child(userInfoNode(fireAuthUser!.uid))
      //     .child('image')
      //     .set(compressedImageUrl);
      await change_user_img(userId: user!.hasuraId, img: compressedImageUrl);
    }
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  Future<void> changeLanguage(LanguageType newLanguage) async {
    if (isUserSignedIn) {
      await change_user_language(userId: user!.hasuraId, language: newLanguage);
    }
  }

  @override
  void dispose() {
    super.dispose();
    mezDbgPrint("--------------------> AuthController Auto Disposed !");
  }
}

/// change that to ha
