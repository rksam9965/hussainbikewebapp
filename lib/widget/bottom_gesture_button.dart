import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';

class BottomGestureButton extends StatefulWidget {
  String? text;
  Color? color;
  Color? textColor;
  int? selectedIndexRow;
  bool? popup;
  Function()? addDatum;
  Function()? navigationFunction;
  bool? topbarbutton;
  BottomGestureButton(
      {super.key,
      this.text,
      this.color,
      this.textColor,
      this.selectedIndexRow,
      this.popup,
      this.navigationFunction,
      this.topbarbutton,
      this.addDatum});

  @override
  State<BottomGestureButton> createState() => _BottomGestureButtonState();
}

class _BottomGestureButtonState extends State<BottomGestureButton> {
  @override
  void initState() {
    debugPrint(widget.popup.toString() + "ksdjcb");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () => widget.navigationFunction!(),
      child: Container(
          height: 50,
          // width: widget.popup == true ? 100 : 0,
          width: widget.popup == true
              ? size.width / 1.45
              : widget.selectedIndexRow == 1 || widget.selectedIndexRow == 2
                  ? size.width / 1.45
                  : size.width / 3.045,
          decoration: BoxDecoration(
            border: Border.all(
              color: floatingButtonColor, // Set your desired border color here
              width: 1, // Set the width of the border
            ),
            color: widget.color,
            borderRadius: BorderRadius.circular(10),
          ),
          // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: Center(
              child: Text(
            widget.text.toString(),
            style: TextStyle(color: widget.textColor),
          ))),
    );
  }
}
