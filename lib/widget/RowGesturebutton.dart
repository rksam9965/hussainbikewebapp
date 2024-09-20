import 'package:flutter/material.dart';
import 'package:hussainbikewebapp/utils/colors.dart';

typedef ButtonCallback = void Function();

class CustomButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final Color borderColor;
  final ButtonCallback onTap;
  double? Maxwidth;
  int? newchange;

  CustomButton({
    required this.text,
    required this.isSelected,
    required this.borderColor,
    required this.onTap,
    this.Maxwidth,
    this.newchange,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: Maxwidth,
        height: 50,
        decoration: BoxDecoration(
          color: isSelected ? redButtonColor : Colors.transparent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : Colors.black), // You can customize the text style here
          ),
        ),
      ),
    );
  }
}
