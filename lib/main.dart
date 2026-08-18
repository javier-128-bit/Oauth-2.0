import 'package:birdle/provider/authProvider.dart';
import 'package:birdle/provider/imgPickProvider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Authprovider()),
        ChangeNotifierProvider(create: (_) => Imgpickprovider()),
      ],
      child: const MaterialApp(
        home: Scaffold(body: Center(child: Text('Hello World!'))),
      ),
    );
  }
}
