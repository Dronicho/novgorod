import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_map/src/domain/services/firebase.dart';

class ImageLoader extends InheritedWidget {
  final _storage = GetIt.I<FirebaseStorageService>();
  final _picker = ImagePicker();

  ImageLoader({Key? key, required this.child}) : super(key: key, child: child);

  final Widget child;

  Future<_ImagePayload> uploadImage() async {
    final res = await FilePicker.platform.pickFiles(type: FileType.image);
    if (res != null) {
      final file = res.files[0];
      final name = file.path!.split('/').last;
      final url = await _storage.uploadFile(
          File(file.path!), '/images' + file.path!.split('/').join(''));
      return _ImagePayload(File(file.path!), url, name);
    }
    return _ImagePayload(null, '', '');
  }

  Future<void> uploadFiles(void Function(String?, PlatformFile) cb) async {
    final res = await FilePicker.platform
        .pickFiles(type: FileType.any, allowMultiple: true);
    if (res != null) {
      print(res.files.length);
      res.files.forEach((e) async {
        print(e);
        cb(null, e);
        final name = e.path!.split('/').last;
        final url = await _storage.uploadFile(
            File(e.path!), '/images' + e.path!.split('/').join(''));
        print(url);
        cb(url, e);
      });
    }
  }

  static ImageLoader? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<ImageLoader>();
  }

  @override
  bool updateShouldNotify(ImageLoader oldWidget) {
    return true;
  }
}

class _ImagePayload {
  final File? file;
  final String url;
  final String name;

  _ImagePayload(this.file, this.url, this.name);
}
