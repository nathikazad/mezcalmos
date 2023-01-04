import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:mezcalmos/Shared/helpers/PrintHelper.dart';

extension DbRefExceptionCatcher on DatabaseReference {
  Future<Stream<DatabaseEvent>> onChildAddedWitchCatch() async {
    mezDbgPrint("onChildAddedWitchCatch ==> $path");
    await once().catchError((_) {
      mezDbgPrint("==> Catched Errors !");
    });
    return onChildAdded;
  }

  Future<Stream<DatabaseEvent>> onValueWitchCatch() async {
    mezDbgPrint("onValueWitchCatch ==> $path");
    await once().catchError((_) {
      mezDbgPrint("==> Catched Errors !");
    });
    return onValue;
  }

  Future<void> setWithCatch({required Object value}) async {
    try {
      // await once();
      await set(value);
    } catch (e, s) {
      mezDbgPrint(
          "[ 👺👺👺👺 ] Nasty Database permissions happend!\nTrying to set $value at database::$path");
      mezDbgPrint(e);
      mezDbgPrint(s);
      return null;
    }
  }
}

extension QueryExceptionCatcher on Query {
  Future<Stream<DatabaseEvent>> onChildAddedWitchCatch() async {
    mezDbgPrint("onChildAddedWitchCatch ==> $path");
    await once().catchError((_) {
      mezDbgPrint("==> Catched Errors !");
    });
    return onChildAdded;
  }

  Future<Stream<DatabaseEvent>> onChildRemovedWitchCatch() async {
    mezDbgPrint("onChildRemovedWitchCatch ==> $path");
    await once().catchError((_) {
      mezDbgPrint("==> Catched Errors !");
    });
    return onChildRemoved;
  }

  Future<Stream<DatabaseEvent>> onValueWitchCatch() async {
    mezDbgPrint("onValueWitchCatch ==> $path");
    await once().catchError((_) {
      mezDbgPrint("==> Catched Errors !");
    });
    return onValue;
  }
}

class FirebaseDb {
  final FirebaseDatabase firebaseDatabase;
  final FirebaseApp firebaseApp;
  final String dbUrl;

  FirebaseDb({
    required this.dbUrl,
    required this.firebaseDatabase,
    required this.firebaseApp,
  });
}
