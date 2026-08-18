import 'package:flutter/material.dart';
import 'dart:io';

import 'package:image_picker/image_picker.dart';

class Imgpickprovider extends ChangeNotifier {
  File? pickedImageFile;

  void pickImage() async {
    final pickImageCam = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 150,
    );

    if (pickImageCam == null) {
      return;
    }

    pickedImageFile = File(pickImageCam.path);
    notifyListeners();
  }
}
