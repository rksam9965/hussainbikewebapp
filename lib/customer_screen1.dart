import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hussainbikewebapp/datamodule/dummyData.dart';
import 'package:hussainbikewebapp/utils/colors.dart';
import 'package:hussainbikewebapp/widget/bottom_gesture_button.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hussainbikewebapp/widget/date_picker.dart';
import 'package:hussainbikewebapp/workshopscreen.dart';

import 'Textfield.dart';

class CustomerScreen1 extends StatefulWidget {
  int? selectedIndex;
  int? passingIndex;
  String? salesman;
  Function(BuildContext context, bool? text,int? index)? showPopup;
  int? index;
  List<Item>? items;

  CustomerScreen1(
      {super.key,
      this.passingIndex,
      this.selectedIndex,
      required,
      this.showPopup,
      this.salesman,
      this.items,
      this.index});

  @override
  State<CustomerScreen1> createState() => _CustomerScreen1State();
}

class _CustomerScreen1State extends State<CustomerScreen1> {
  final TextEditingController salesman = TextEditingController();
  final TextEditingController phoneCode = TextEditingController();
  final TextEditingController customer = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController receiveDate = TextEditingController();
  final TextEditingController driverDetails = TextEditingController();
  final TextEditingController driverDate = TextEditingController();

  final TextEditingController bikeNumber = TextEditingController();
  final TextEditingController diagnosis = TextEditingController();
  final TextEditingController estimateCharges = TextEditingController();
  final TextEditingController outstanding = TextEditingController();
  final TextEditingController address = TextEditingController();
  final textFieldsDate1 = GlobalKey<DatePickerExampleState>();
  final textFieldsDate2 = GlobalKey<DatePickerExampleState>();

  bool? display = true;
  bool? disable = true;


  @override
  void initState() {
    salesman.text = widget.items![widget.index!].salesman.toString();
    phoneCode.text = widget.items![widget.index!].phoneCode.toString();
    customer.text = widget.items![widget.index!].customer.toString();
    mobileNumber.text = widget.items![widget.index!].mobileNumber.toString();
    receiveDate.text = widget.items![widget.index!].receiveDate.toString();
    driverDate.text = widget.items![widget.index!].deliverDate.toString();
    driverDetails.text = widget.items![widget.index!].driverDetails.toString();
    bikeNumber.text = widget.items![widget.index!].bikeNumber.toString();
    diagnosis.text = widget.items![widget.index!].diagnosis.toString();
    estimateCharges.text =
        widget.items![widget.index!].estimateCharges.toString();
    outstanding.text = widget.items![widget.index!].outstanding.toString();
    address.text = widget.items![widget.index!].address.toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return Container(
      height: size.height / 0.8125,
      color: homeScreenContainerColor,
      margin: const EdgeInsets.only(
        top: 30,
        // right: 24,
      ),
      padding: const EdgeInsets.only(
        left: 24,
        right: 24,
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(
                      top: 10,
                      left: screenWidth * 0.28,
                    ),
                    child: Text('JOB ORDER')),
                Visibility(
                    visible:
                        widget.selectedIndex == 1 || widget.selectedIndex == 2
                            ? false
                            : true,
                    child: GestureDetector(
                      onTap: () {
                        widget.showPopup!(context,false,widget.index);
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        width: 40, // Specify the width of the container
                        height:
                            40, // Specify the height of the container// Background color of the container
                        child: SvgPicture.asset(
                          'assets/Icons/edit_icon.svg', // Path to your SVG file
                          fit: BoxFit.contain, // Adjust the fit as needed
                        ),
                      ),
                    ))
              ],
            ),
            SizedBox(height: screenHeight * 0.05),
            const SizedBox(height: 16),
            TextFieldFunction("Salesman", salesman, display),
            SizedBox(height: screenHeight * 0.015),
            TextFieldFunction("Phone Code", phoneCode, display),
            SizedBox(height: screenHeight * 0.015),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              SizedBox(
                width: screenWidth / 3.045,
                child: DatePickerExample(
                  disable: disable,
                  key: textFieldsDate1,
                  label: "Receive Date",
                  text: receiveDate.text.toString(),
                ),
              ),
              SizedBox(
                width: screenWidth / 3.045,
                child: DatePickerExample(
                  disable: disable,
                  key: textFieldsDate2,
                  label: "Delivery Date",
                  text: driverDate.text.toString(),
                ),
              ),
            ]),
            SizedBox(height: screenHeight * 0.015),
            TextFieldFunction("Customer", customer, display),
            SizedBox(height: screenHeight * 0.015),
            TextFieldFunction("Mobile Number", mobileNumber, display),
            SizedBox(height: screenHeight * 0.015),
            TextFieldFunction("Driver Details", driverDetails, display),
            SizedBox(height: screenHeight * 0.015),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                width: screenWidth / 3.045,
                child: CustomTextField(
                  display: display,
                  filledColor: Colors.grey.shade300,
                  borderColor: Colors.grey,
                  lable: 'Bike Number',
                  controller: bikeNumber,
                ),
              ),
              SizedBox(
                width: screenWidth / 3.045,
                child: CustomTextField(
                  display: display,
                  filledColor: Colors.grey.shade300,
                  borderColor: Colors.grey,
                  lable: 'Address 1,Address, ...',
                  controller: address,
                ),
              ),
            ]),
            SizedBox(height: screenHeight * 0.015),
            CustomTextField(
              display: display,
              filledColor: Colors.grey.shade300,
              borderColor: Colors.grey,
              maxLines: 4,
              lable: 'Diagnosis',
              controller: diagnosis,
            ),
            SizedBox(height: screenHeight * 0.015),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
                width: screenWidth / 3.045,
                child: CustomTextField(
                  display: display,
                  filledColor: Colors.grey.shade300,
                  borderColor: Colors.grey,
                  lable: 'Estimate Charges',
                  controller: estimateCharges,
                ),
              ),
              Container(
                width: screenWidth / 3.045,
                child: CustomTextField(
                  display: display,
                  filledColor: Colors.grey.shade300,
                  borderColor: Colors.grey,
                  lable: 'Outstanding',
                  controller: outstanding,
                ),
              ),
            ]),
            SizedBox(height: screenHeight * 0.09),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Visibility(
                visible: widget.selectedIndex == 1 || widget.selectedIndex == 2
                    ? false
                    : true,
                child: BottomGestureButton(
                  text: "CANCEL",
                  // selectedIndexRow: widget.selectedIndexRow,
                  // textColor: Colors.white,
                  textColor: Colors.black,

                  color: Colors.transparent,
                ),
              ),
              BottomGestureButton(
                topbarbutton:
                    widget.selectedIndex == 1 || widget.selectedIndex == 2
                        ? true
                        : false,
                selectedIndexRow: widget.selectedIndex,
                textColor: Colors.white,
                text: "GO TO WORKSHOP",
                navigationFunction: navigationFunction,
                color: floatingButtonColor,
              ),
            ]),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  Widget TextFieldFunction(
      String label, TextEditingController controller, bool? display) {
    return SizedBox(
      child: CustomTextField(
        display: display,
        lable: label,
        controller: controller,
      ),
    );
  }

  navigationFunction() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Workshopscreen(
                topbarbutton:
                    widget.selectedIndex == 1 || widget.selectedIndex == 2
                        ? true
                        : false,
              )),
    );
  }
}
