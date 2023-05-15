import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:na/pages/login_page.dart';
import 'package:na/pages/profile_page.dart';
import 'package:na/pages/registration_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:form_field_validator/form_field_validator.dart';

import 'home.dart';
import 'menu.dart';
import 'pages/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(LoginUiApp());
}

class LoginUiApp extends StatelessWidget {
  Color _primaryColor = HexColor('##F8861B');
  Color _accentColor = HexColor('##F8861B');

  // Design color
  // Color _primaryColor= HexColor('#FFC867');
  // Color _accentColor= HexColor('#FF3CBD');

  // Our Logo Color
  // Color _primaryColor= HexColor('#D44CF6');
  // Color _accentColor= HexColor('#5E18C8');

  // Our Logo Blue Color
  //Color _primaryColor= HexColor('#651BD2');
  //Color _accentColor= HexColor('#320181');

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // Get.lazyput(() => DataClass());
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "RegistrationPage": (context) => RegistrationPage(),
        "LoginPage": (context) => LoginPage(),
        "ProfilePage": (context) => MyMenu(),
        "MoviesInformation": (context) => MoviesInformation(),
        "Home": (context) => HomePage(),
      },
      title: 'Flutter Login UI',
      theme: ThemeData(
        primaryColor: _primaryColor,
        accentColor: _accentColor,
        scaffoldBackgroundColor: Colors.grey.shade100,
        primarySwatch: Colors.grey,
      ),
      home: SplashScreen(title: 'Flutter Login UI'),
    );
  }
}
