import 'package:flutter/material.dart';

import '../../utils/colors.dart';

class SignInTextField extends StatefulWidget {
  final double top;
  String? text;
  Color? borderColor;

  SignInTextField({Key? key, required this.top, this.text, this.borderColor})
      : super(key: key);

  @override
  SignInTextFieldState createState() => SignInTextFieldState();
}

class SignInTextFieldState extends State<SignInTextField> {
  TextEditingController userName = TextEditingController();
  TextEditingController password = TextEditingController();

  bool _obscureText = true; // Initially, the text is hidden

  void togglePasswordVisibility() {
    setState(() {
      _obscureText = !_obscureText; // Toggle the visibility
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(height: 50, child: userNameTextEditor()),
        SizedBox(
          height: 10,
        ),
        Container(height: 50, child: userPassWordEditor()),
      ],
    );
  }

  bool colorChange = false;
  bool colorChange1 = false;

  Widget userNameTextEditor() {
    return TextFormField(
      cursorColor: floatingButtonColor,
      onChanged: (value) {},
      controller: userName,
      autocorrect: false,
      textInputAction: TextInputAction.done,
      style: TextStyle(
        color: black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        filled: true,
        fillColor: textFieldColorFilled,
        border: InputBorder.none,
        labelText: 'User Name',
        labelStyle: TextStyle(
            color: black,
            fontWeight: FontWeight.w300,
            fontSize: 14 // Color of the label text
            ), // Padding inside the text field
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
      ),
    );
  }

  Widget userPassWordEditor() {
    return TextFormField(
      cursorColor: floatingButtonColor,
      onChanged: (value) {},
      obscureText: _obscureText,
      controller: password,
      autocorrect: false,
      textInputAction: TextInputAction.done,
      style: TextStyle(
        color: black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            _obscureText
                ? Icons.visibility_off_outlined
                : Icons
                    .visibility_outlined, // Change icon based on visibility state
          ),
          onPressed: () {
            togglePasswordVisibility();
          },
        ),
        filled: true,
        fillColor: textFieldColorFilled,
        border: InputBorder.none,
        labelText: 'Password', // Padding inside the text field
        labelStyle: TextStyle(
            color: black,
            fontWeight: FontWeight.w300,
            fontSize: 14 // Color of the label text
            ), // Padding inside the text field
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
      ),
    );
  }
}
