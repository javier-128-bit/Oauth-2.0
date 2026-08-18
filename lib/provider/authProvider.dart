import 'package:flutter/material.dart';

class Authprovider extends ChangeNotifier {
  final form = GlobalKey<FormState>();

  var isLogin = true;
  var enteredEmail = '';
  var enteredPassword = '';

  voidSubmit() {
    final _isvalid = form.currentState!.validate();
    if (!_isvalid) {
      return;
    }
    form.currentState!.save();
  }
}
