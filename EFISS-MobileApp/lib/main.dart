import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:survillience_screens/models/user.dart';
import 'package:survillience_screens/screens/intro.dart';
import 'package:survillience_screens/screens/login.dart';
//import 'package:survillience_screens/screens/main_page.dart';
//import 'package:survillience_screens/screens/saved_page.dart';
//import 'package:survillience_screens/screens/wrapper.dart';
import 'package:survillience_screens/services/auth.dart';
import 'widgets/profile_view.dart';
import 'package:get/get.dart';
//import 'screens/trend_page.dart';
//import 'screens/saved_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{};
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Users>.value(
      value: AuthService().user,
      child: GetMaterialApp(
        title: "ISS",
        home: ImageCarousel(),
        routes: routes,
      ),
    );
  }
}
