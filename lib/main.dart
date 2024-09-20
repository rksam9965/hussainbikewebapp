import 'package:flutter/material.dart';
import 'package:hussainbikewebapp/home.dart';
import 'package:hussainbikewebapp/signin/signin_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Widget _defaultHome = SignInPage();
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: '',
    home: _defaultHome,
    routes: <String, WidgetBuilder>{
      '/homePage': (context) => HomePage(),
    },
  ));
}
