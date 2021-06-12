//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:screentwo/models/user.dart';
import 'package:screentwo/screen/Intro.dart';
import 'package:screentwo/services/auth.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user,
      child: GetMaterialApp(
        title: "Intelligent Surveillance System in smart cities",
        home: ImageCarousel(),
      ),
    );
  }
}
