import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MobileScreen extends StatefulWidget {
  const MobileScreen({super.key});

  @override
  State<MobileScreen> createState() => _MobileScreenState();
}

class _MobileScreenState extends State<MobileScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.white,
        child: const Center(
          child: Text(
            "This web page only supports tablet and desktop",
            style: TextStyle(fontSize: 12, color: Colors.black),
          ),
        ),
      ),
    ));
  }
}
