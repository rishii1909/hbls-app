import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:honey_bee_learning_station/providers/authentication_provider.dart';
import 'package:provider/provider.dart';
import 'app.dart';
import 'config/palette.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  if (kDebugMode) {
    try {
      FirebaseFirestore.instance.useFirestoreEmulator('localhost', 8080);
      await FirebaseAuth.instance.useAuthEmulator('localhost', 9099);
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AuthenticationProvider()),
        ],
        child: MaterialApp(
          title: 'HBLS',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            // colorScheme: ColorScheme.fromSwatch().copyWith(
            //     primary: AppColors.primaryColor,
            //     secondary: AppColors.textColor),
            // primarySwatch: AppColors.backgroundColor,
          ),
          home: const MyHomePage(title: 'HoneyBee Learning Station'),
        ));
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late StreamSubscription<User?> user;
  // unComment this to implement the persistant login
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.authStateChanges().listen((user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
        print("User's Id is :- " + user.uid);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return HBLS_App();
  }
}
