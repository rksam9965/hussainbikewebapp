import 'package:flutter/material.dart';
import 'package:hussainbikewebapp/home.dart';
import 'package:hussainbikewebapp/responsive.dart';
import 'package:hussainbikewebapp/signin/signin_page.dart';

import 'mobile.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DeviceType deviceType = getDeviceType(context);
    Widget _defaultHome;

    if (deviceType == DeviceType.desktop) {
      _defaultHome = const SignInPage(); // Desktop layout
    } else if (deviceType == DeviceType.tablet) {
      _defaultHome = const SignInPage(); // Desktop layout
    } else {
      _defaultHome = const MobileScreen();
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _defaultHome,
      routes: {
        '/homePage': (context) => HomePage(),
      },
    );
  }
}
