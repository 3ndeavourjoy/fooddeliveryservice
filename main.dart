import 'package:flutter/material.dart';
import 'package:fooddeliveryservice/services/auth/auth_gate.dart';
import 'package:fooddeliveryservice/models/restaurant.dart';
import 'package:fooddeliveryservice/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(
    MultiProvider(
        providers: [
          //ThemeProvider
          ChangeNotifierProvider(create: (context) => ThemeProvider()),

          //Resturant Provider
          ChangeNotifierProvider(create: (context) => Restaurant()),
        ],
        child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthGate(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
