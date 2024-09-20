import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../utils/colors.dart';

class DatePickerExample extends StatefulWidget {
  String? text;
  String? label;
  bool? disable;
  DatePickerExample({Key? key, this.text, this.label, this.disable})
      : super(key: key);

  @override
  DatePickerExampleState createState() => DatePickerExampleState();
}

class DatePickerExampleState extends State<DatePickerExample> {
  late DateTime _selectedDate;
  late String formattedDate;
  late bool? vall = true;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(1900), // Allow selection from 1900
      lastDate: DateTime(2100), // Allow selection up to the year 2100
    );
    if (pickedDate != null && pickedDate != _selectedDate) {
      setState(() {
        vall = false;
        _selectedDate = pickedDate;
        formattedDate = DateFormat('yyyy-MM-dd').format(_selectedDate);
      });
    }
  }

  @override
  void initState() {
    super.initState();

    _selectedDate = DateTime.now();
    formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => widget.disable == true ? {} : _selectDate(context),
      child: Container(
        height: screenHeight * 0.082,
        width: screenWidth / 3.045,
        decoration: BoxDecoration(
          border: Border.all(color: textBorderColor, width: 1), // Border color
          borderRadius: BorderRadius.circular(5), // Rounded corners
        ),
        child: Center(
          child: vall == false
              ? Text(
                  formattedDate,
                  style:
                      TextStyle(fontSize: 12, color: lightGrey), // Text color
                )
              : Text(
                  widget.disable == true
                      ? widget.text.toString()
                      : widget.label!,
                  style:
                      TextStyle(fontSize: 12, color: lightGrey), // Text color
                ),
        ),
      ),
    );
  }
}
