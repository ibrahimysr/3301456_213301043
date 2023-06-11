import 'package:e_ticaret/pages/Beginning/Beginning.dart';
import 'package:e_ticaret/pages/Login/loginService/function.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: "AIzaSyCatSE-yXaEfnqIjCjd57PdzTGeEm-NRag",
          appId: "1:656865304004:android:c7f85145bba7d453845891",
          messagingSenderId: "656865304004",
          projectId: "kahve-da754"));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<FlutterFireAuthService>(
            create: (_) => FlutterFireAuthService(FirebaseAuth.instance)),
        StreamProvider(
            create: (context) =>
                context.read<FlutterFireAuthService>().authStateChanges,
            initialData: null)
      ],
      child: const MaterialApp(
          debugShowCheckedModeBanner: false, home: BeginningPage()),
    );
  }
}
