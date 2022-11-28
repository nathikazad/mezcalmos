import 'dart:async';
import 'dart:io';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_auth/firebase_auth.dart' as fireAuth;
import 'package:firebase_core/firebase_core.dart' as firebase_core;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get/get.dart';
import 'package:mezcalmos/Shared/controllers/languageController.dart';
import 'package:mezcalmos/Shared/database/HasuraDb.dart';
import 'package:mezcalmos/Shared/graphql/user/hsUser.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';
import 'package:mezcalmos/Shared/helpers/SignInHelper.dart';
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

        fireAuth.IdTokenResult? tokenResult = await user.getIdTokenResult();
        mezDbgPrint(tokenResult);

        if (tokenResult.claims?['https://hasura.io/jwt/claims'] == null) {
          mezDbgPrint("No token, calling addHasuraClaims");
          await FirebaseFunctions.instance
              .httpsCallable('user-addHasuraClaim')
              .call();
          tokenResult = await user.getIdTokenResult();
        }
        _hasuraUserId.value = int.parse(tokenResult
            .claims!['https://hasura.io/jwt/claims']['x-hasura-user-id']);

        mezDbgPrint(_hasuraUserId.value);

        await hasuraDb.initializeHasura();
        await _onSignInCallback();
      }
      _authStateStreamController.add(user);
    });

    super.onInit();
  }

  Future<void> fetchUserInfoFromHasura() async {
    mezDbgPrint(
        "[777] fetchingUser Info from hasure using firebaseid : ${fireAuthUser?.uid}");

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

  /// only use this for test purposes
  ///
  /// set a default image just for test purposes
  Future<void> _setTestImage() async {}

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
  Future<String> uploadUserImgToFbStorage(
      {required File imageFile, bool isCompressed = false}) async {
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
    }
    if (compressedImageUrl != null && compressedImageUrl.isURL) {
      // TODO: set hasura compressed_image
      // await _databaseHelper.firebaseDatabase
      //     .ref()
      //     .child(userInfoNode(fireAuthUser!.uid))
      //     .child('image')
      //     .set(compressedImageUrl);
    }
  }

  void changeLanguage(LanguageType newLanguage) {
    if (isUserSignedIn) {
      // TODO: set hasura language
    }
  }

  @override
  void dispose() {
    super.dispose();
    mezDbgPrint("--------------------> AuthController Auto Disposed !");
  }
}
