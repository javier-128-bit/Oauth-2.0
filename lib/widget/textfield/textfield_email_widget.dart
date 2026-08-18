import 'package:birdle/provider/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Tambahkan baris ini

class TextfieldEmailWidget extends StatefulWidget {
  const TextfieldEmailWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<TextfieldEmailWidget> createState() => _TextfieldEmailWidgetState();
}

class _TextfieldEmailWidgetState extends State<TextfieldEmailWidget> {
  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<Authprovider>(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Email",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: widget.controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          validator: (value) {
            if (value!.isEmpty || value == "") {
              return "Email gabole kosong woy";
            } else if (!value.trim().contains("@")) {
              return "Email ga valid reks";
            }
            return null;
          },
          onSaved: (value) {
            loadAuth.enteredEmail = value!;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: "Masukkan Email.. ",
          ),
        ),
      ],
    );
  }
}
