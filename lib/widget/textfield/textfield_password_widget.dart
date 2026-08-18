import 'package:birdle/provider/authProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Tambahkan baris ini

class TextfieldPasswordWidget extends StatefulWidget {
  const TextfieldPasswordWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  State<TextfieldPasswordWidget> createState() =>
      _TextfieldPasswordWidgetState();
}

class _TextfieldPasswordWidgetState extends State<TextfieldPasswordWidget> {
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    var loadAuth = Provider.of<Authprovider>(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Password",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
        ),
        const SizedBox(height: 20),
        TextFormField(
          controller: widget.controller,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: obsecureText,
          validator: (value) {
            if (value!.trim().isEmpty || value == "") {
              return "Password gabole kosong woy";
            } else if (value.trim().length < 8) {
              return "Password harus lebih dari 8 karakter";
            }
            return null;
          },
          onSaved: (value) {
            loadAuth.enteredPassword = value!;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
            hintText: "Masukkan Password.. ",
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obsecureText = !obsecureText;
                });
              },
              icon: const Icon(Icons.remove_red_eye_rounded),
            ),
          ),
        ),
      ],
    );
  }
}
