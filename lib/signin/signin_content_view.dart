import 'package:flutter/material.dart';
import 'package:hussainbikewebapp/signin/signin_button.dart';
import 'package:hussainbikewebapp/signin/signin_text_field.dart';
import 'package:flutter_svg/svg.dart';
import '../../utils/colors.dart';

class SignInContentView extends StatefulWidget {
  final Function validateSignIn;
  final GlobalKey textFieldsKey;
  const SignInContentView(
      {Key? key, required this.validateSignIn, required this.textFieldsKey})
      : super(key: key);
  @override
  SignInContentViewState createState() => SignInContentViewState();
}

class SignInContentViewState extends State<SignInContentView> {
  String welcomeText = '';
  String welcomeText1 = '';

  double totalHeight = 0;
  @override
  void initState() {
    welcomeText = 'Sign In!';
    welcomeText1 = '';
    super.initState();
  }

  bool? tech = true;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      width: MediaQuery.of(context).size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(
                top: screenHeight * 0.15,
              ),
              width: 300, // Width of the Container
              height: 200, // Height of the Container
              child: SvgPicture.asset(
                'assets/logo.svg',
                width:
                    500, // Width of the SvgPicture should match the Container
                height:
                    500, // Height of the SvgPicture should match the Container
                fit: BoxFit.contain, // Ensure the SvgPicture scales correctly
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: Center(
                child: Column(
                  children: [
                    SignInTextField(
                        borderColor: borderColor,
                        key: widget.textFieldsKey,
                        top: totalHeight * 0,
                        text: ""),
                    const SizedBox(
                      height: 14,
                    ),
                    SignInSubmitButton(
                      newone: true,
                      borderColor: borderColor,
                      textColor: textHeadingColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      text: "LOGIN",
                      color: Colors.transparent,
                      validateSignIn: widget.validateSignIn,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
