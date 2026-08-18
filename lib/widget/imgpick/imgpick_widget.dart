import 'package:birdle/provider/imgPickProvider.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class ImgpickWidget extends StatefulWidget {
  const ImgpickWidget({super.key});

  @override
  State<ImgpickWidget> createState() => _ImgpickWidgetState();
}

class _ImgpickWidgetState extends State<ImgpickWidget> {
  @override
  Widget build(BuildContext context) {
    var loadPickImg = Provider.of<Imgpickprovider>(context);
    var getImage = loadPickImg.pickedImageFile;
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundColor: Colors.grey,
          foregroundImage: getImage != null ? FileImage(getImage) : null,
        ),
        TextButton.icon(
          onPressed: () {
            loadPickImg.pickImage();
          },
          icon: Icon(Icons.image),
          label: const Text("Upload Image"),
        ),
      ],
    );
  }
}
