import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../utils/colors.dart';

class GestureButton extends StatefulWidget {
  String? imagePath;
  Function()? changeColor;
  Color? buttonColor;
  Function(BuildContext context, bool? text, int? index)? showPopup;
  bool? popup;
  String? selectCustomer;
  bool? logout;
  Function? popUp;

  GestureButton(
      {Key? key,
      this.imagePath,
      this.changeColor,
      this.buttonColor,
      this.showPopup,
      this.popup,
      this.selectCustomer,
      this.popUp,
      this.logout})
      : super(key: key);

  @override
  _GestureButtonState createState() => _GestureButtonState();
}

class _GestureButtonState extends State<GestureButton> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        widget.logout == true
            ? widget.popUp!()
            : widget.showPopup!(context, true, 0);
      },
      child: Container(
        height: 50,
        width: widget.popup == true ? size.width / 18 : size.width / 9,
        decoration: BoxDecoration(
          color: widget.popup == true ? Colors.transparent : redButtonColor,
          borderRadius: BorderRadius.circular(10),
          // boxShadow: [
          //   BoxShadow(
          //     color: Colors.black.withOpacity(0.2),
          //     spreadRadius: 2,
          //     blurRadius: 5,
          //     offset: Offset(0, 3),
          //   ),
          // ],
        ),
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: SvgPicture.asset(
          widget.imagePath.toString(), // Path to your SVG asset
          color: Colors.white, // Optional: to tint the image
          width: 24.0, // Adjust the width as needed
          height: 24.0, // Adjust the height as needed
        ),
      ),
    );
  }
}
