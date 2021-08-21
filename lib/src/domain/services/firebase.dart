import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  FirebaseStorage storage = FirebaseStorage.instance;

  Future<FirebaseStorageService> init() async {
    return this;
  }

  Future<String> uploadBytes(
      Uint8List file, String path, Function(double) listener) async {
    var ref = storage.ref().child(path);

    final uploadTask = ref.putData(file);

    final streamSubscription = uploadTask.snapshotEvents.listen((event) {
      var persentage =
          event.bytesTransferred / event.totalBytes;
      listener(persentage);
    });

    // Cancel your subscription when done.
    await streamSubscription.cancel();

    return await ref.getDownloadURL();
  }

  Future<String> uploadFile(File file, String path) async {
    var ref = storage.ref().child(path);

    final uploadTask = ref.putFile(file);

    final streamSubscription = uploadTask.snapshotEvents.listen((event) {
      // You can use this to notify yourself or your user in any kind of way.
      // For example: you could use the uploadTask.events stream in a StreamBuilder instead
      // to show your user what the current status is. In that case, you would not need to cancel any
      // subscription as StreamBuilder handles this automatically.

      // Here, every StorageTaskEvent concerning the upload is printed to the logs.
      print('EVENT $event');
    });

    // Cancel your subscription when done.
    await uploadTask;
    await streamSubscription.cancel();

    return await ref.getDownloadURL();
  }
}
