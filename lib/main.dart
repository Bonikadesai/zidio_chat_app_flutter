import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:zidio_real_time_chat_flutter_app/common/routs.dart';

import 'Screen/SplashScreen/splashScreen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      builder: FToastBuilder(),
      getPages: routes,
      themeMode: ThemeMode.dark,
      title: 'Chatterly',
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
