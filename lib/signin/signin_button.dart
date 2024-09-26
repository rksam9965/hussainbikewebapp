import 'package:flutter/material.dart';
import 'package:hussainbikewebapp/home.dart';
import 'package:hussainbikewebapp/utils/colors.dart';

class SignInSubmitButton extends StatefulWidget {
  final Function? validateSignIn;
  Color? color;
  Color? borderColor;
  FontWeight? fontWeight;
  bool? tech;
  int? fontSize;
  String? text;
  Color? textColor;
  bool? newone;
  SignInSubmitButton(
      {Key? key,
      this.validateSignIn,
      this.color,
      this.text,
      this.textColor,
      this.fontSize,
      this.fontWeight,
      this.borderColor,
      this.tech,
      this.newone})
      : super(key: key);

  @override
  SignInSubmitButtonState createState() => SignInSubmitButtonState();
}

class SignInSubmitButtonState extends State<SignInSubmitButton> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () => {
                Navigator.pushNamed(context, '/homePage'),
              },
              child: Container(
                height: 50,
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border.all(color: widget.borderColor!),
                  color: floatingButtonColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  widget.text.toString(),
                  textScaleFactor: 1,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: widget.fontSize?.toDouble(),
                    fontWeight: FontWeight.w200,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  pushToHome() async {}
}
