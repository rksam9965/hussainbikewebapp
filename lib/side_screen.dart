import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hussainbikewebapp/responsive.dart';
import 'package:hussainbikewebapp/utils/colors.dart';
import 'package:hussainbikewebapp/utils/custom_alert.dart';
import 'package:hussainbikewebapp/widget/bottom_gesture_button.dart';
import 'package:hussainbikewebapp/widget/date_picker.dart';
import 'package:hussainbikewebapp/workshopscreen.dart';

import 'Textfield.dart';
import 'package:flutter_svg/svg.dart';

import 'api_services/api_repo.dart';
import 'datamodule/cancel.dart';
import 'datamodule/create_job.dart';
import 'datamodule/dummyData.dart';
import 'datamodule/get_status.dart';

class CustomerScreen1 extends StatefulWidget {
  int? selectedIndex;
  int? passingIndex;
  String? salesman;
  Function(BuildContext context, bool? text, int? index)? showPopup;
  int? index;
  Function? ontab;
  Function? ontab1;
  List<Job>? items;
  Future<void> Function()? getOngoings;

  CustomerScreen1(
      {super.key,
      this.passingIndex,
      this.selectedIndex,
      required,
      this.showPopup,
      this.salesman,
      this.index,
      this.ontab,
      this.ontab1,
      this.items,
      this.getOngoings});

  @override
  State<CustomerScreen1> createState() => CustomerScreen1State();
}

class CustomerScreen1State extends State<CustomerScreen1> {
  final TextEditingController salesman = TextEditingController();
  final TextEditingController phoneCode = TextEditingController();
  final TextEditingController customer = TextEditingController();
  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController receiveDate = TextEditingController();
  final TextEditingController deliveryDate = TextEditingController();

  final TextEditingController driverDetails = TextEditingController();
  final TextEditingController bikeNumber = TextEditingController();
  final TextEditingController diagnosis = TextEditingController();
  final TextEditingController estimateCharges = TextEditingController();
  final TextEditingController outstanding = TextEditingController();
  final TextEditingController address = TextEditingController();
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController vat = TextEditingController();
  final TextEditingController address1 = TextEditingController();
  final textFieldsDate1 = GlobalKey<DatePickerExampleState>();
  final textFieldsDate2 = GlobalKey<DatePickerExampleState>();
  bool? cancel = true;

  int selectedIndex = 0; // Track the selected screen index
  int selectedIndex1 = 0;
  int passingIndex = 0;

  List<DropdownMenuItem<String>> weekList = [];
  var selectWeek = 'week 1';

  List<DropdownMenuItem<String>> customerList = [];

  List<DropdownMenuItem<String>> bikeList = [];
  var selectBikeList = '5645';

  var selectCustomer = 'Customer 1';

  var receivedate = GlobalKey<DatePickerExampleState>();
  var deliverydate = GlobalKey<DatePickerExampleState>();

  bool? display = true;
  bool? disable = true;
  List setOngoingList = [];

  @override
  void initState() {
    // Future.delayed(Duration(milliseconds: 0), () {
    //   if (widget.selectedIndex == 0) {
    //     getOngoing();
    //   } else if (widget.selectedIndex == 1) {
    //     getOngoing();
    //   } else {}
    // });
    setEditValue();
    workerFilter();
    customerFilter();
    bikeNumberFilter();
    super.initState();
  }

  setEditValue() {
    // name.text = widget.items![widget.index!]..toString();
    // vat.text = widget.items![widget.index!].vat.toString();
    // phoneNumber.text = widget.items![widget.index!].phoneNumber.toString();
    // email.text = widget.items![widget.index!].email.toString();
    // address.text = widget.items![widget.index!].address.toString();
    salesman.text = widget.items![widget.index!].salesMan.toString();
    phoneCode.text = widget.items![widget.index!].phoneCode.toString();
    customer.text = widget.items![widget.index!].customer.toString();
    mobileNumber.text = widget.items![widget.index!].mobileNumber.toString();
    deliveryDate.text = widget.items![widget.index!].deliveryDate.toString();
    receiveDate.text = widget.items![widget.index!].receiveDate.toString();
    driverDetails.text = widget.items![widget.index!].driverDetails.toString();
    bikeNumber.text = widget.items![widget.index!].bikeNumber.toString();
    diagnosis.text = widget.items![widget.index!].diagnosis.toString();
    estimateCharges.text =
        widget.items![widget.index!].estimatedCharges.toString();
    outstanding.text = widget.items![widget.index!].outstanding.toString();
    // address.text = widget.items![widget.index!].ad.toString();
    // selectWeek = widget.items![widget.index!].week.toString();
    textFieldsDate2.currentState?.formattedDate =
        widget.items![widget.index!].receiveDate.toString();
    textFieldsDate1.currentState?.formattedDate =
        widget.items![widget.index!].deliveryDate.toString();
    // selectCustomer = widget.items![widget.index!].customer.toString();
    // selectBikeList = widget.items![widget.index!].bikeNumber.toString();
  }

  customerFilter() {
    customerList.add(
      DropdownMenuItem(
        value: "Customer 1",
        child: Center(
          child: Text(
            'Customer 1',
            style: TextStyle(
                color: lightGrey,
                fontWeight: FontWeight.w300,
                fontSize: 12 // Color of the label text
                ),
          ),
        ),
      ),
    );
    customerList.add(
      DropdownMenuItem(
        value: "Customer 2",
        child: Center(
          child: Text(
            'Customer 2',
            style: TextStyle(
                color: lightGrey,
                fontWeight: FontWeight.w300,
                fontSize: 12 // Color of the label text
                ),
          ),
        ),
      ),
    );
    customerList.add(
      DropdownMenuItem(
        value: "customer 3",
        child: Center(
          child: Text(
            "customer 3",
            style: TextStyle(
                color: lightGrey,
                fontWeight: FontWeight.w300,
                fontSize: 12 // Color of the label text
                ),
          ),
        ),
      ),
    );
  }

  bikeNumberFilter() {
    bikeList.add(
      DropdownMenuItem(
        value: "5645",
        child: Center(
          child: Text(
            '5645',
            style: TextStyle(
                color: lightGrey,
                fontWeight: FontWeight.w300,
                fontSize: 12 // Color of the label text
                ),
          ),
        ),
      ),
    );
    bikeList.add(
      DropdownMenuItem(
        value: "123",
        child: Center(
          child: Text(
            '123',
            style: TextStyle(
                color: lightGrey,
                fontWeight: FontWeight.w300,
                fontSize: 12 // Color of the label text
                ),
          ),
        ),
      ),
    );
    bikeList.add(
      DropdownMenuItem(
        value: "345",
        child: Container(
          // height: 30,
          child: Center(
            child: Text(
              "345",
              style: TextStyle(
                  color: lightGrey,
                  fontWeight: FontWeight.w300,
                  fontSize: 12 // Color of the label text
                  ),
            ),
          ),
        ),
      ),
    );
  }

  workerFilter() {
    weekList.add(
      DropdownMenuItem(
        value: "week 1",
        child: Center(
          child: Text(
            'week 1',
            style: TextStyle(
              color: lightGrey,
              fontSize: 12, // Set font size to 20
              fontWeight: FontWeight.normal, // Set font weight to bold
            ),
          ),
        ),
      ),
    );
    weekList.add(
      DropdownMenuItem(
        value: "week 2",
        child: Center(
          child: Text(
            'week 2',
            style: TextStyle(
              color: lightGrey,
              fontSize: 12, // Set font size to 20
              fontWeight: FontWeight.normal, // Set font weight to bold
            ),
          ),
        ),
      ),
    );
    weekList.add(
      DropdownMenuItem(
        value: "week 3",
        child: Center(
          child: Text(
            "week 3",
            style: TextStyle(
              color: lightGrey,
              fontSize: 12, // Set font size to 20
              fontWeight: FontWeight.normal, // Set font weight to bold
            ),
          ),
        ),
      ),
    );
  }

  updateJobEntry(String? id) async {
    var jsonData = postData1();
    displayProgress(context);
    updateJobEntries(jsonData, id!).then((CreateJobModule createJob) {
      hideProgress(context);
      if (createJob.message == "Job updated successfully") {
        debugPrint('SUCCESS...');
        Navigator.pop(context);
        widget.getOngoings!();
        // setState(() {
        //   widget.items?.clear();
        // });
      } else {
        displayAlert(context, GlobalKey(), createJob.message ?? '');
      }
    }).catchError((error, stackTrace) {
      hideProgress(context);
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
      displayAlert(context, GlobalKey(), error.toString());
    });
  }

  String postData1() {
    var pageDetails = {
      "salesMan": salesman.text,
      "phoneCode": phoneCode.text,
      "receiveDate": textFieldsDate2.currentState?.formattedDate.toString(),
      "deliveryDate": textFieldsDate1.currentState?.formattedDate.toString(),
      "customer": selectCustomer,
      "mobileNumber": mobileNumber.text,
      "driverDetails": driverDetails.text,
      "bikeNumber": selectBikeList.toString(),
      "diagnosis": diagnosis.text,
      "estimatedCharges": estimateCharges.text,
      "outstanding": outstanding.text.toString()
    };
    return json.encode(pageDetails);
  }

  cancelEntries(String? id) async {
    var jsonData = postCancelData(id);
    displayProgress(context);
    jobCancel(jsonData).then((JobResponseCancel jobResponseCancel) {
      hideProgress(context);
      if (jobResponseCancel.status == "success") {
        debugPrint('SUCCESS...');
        widget.ontab!();
        // widget.getOngoings!();
      } else {
        displayAlert(context, GlobalKey(), jobResponseCancel.message ?? '');
      }
    }).catchError((error, stackTrace) {
      hideProgress(context);
      debugPrint(error.toString());
      debugPrint(stackTrace.toString());
      displayAlert(context, GlobalKey(), error.toString());
    });
  }

  String postCancelData(String? id) {
    var pageDetails = {"id": id};
    return json.encode(pageDetails);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      height: Responsive.isTablet(context)
          ? size.height / 1.2
          : size.height / 0.8125,
      color: homeScreenContainerColor,
      margin: EdgeInsets.only(
        top: Responsive.isTablet(context) ? 18 : 30,
      ),
      padding: EdgeInsets.only(
        left: screenWidth * 0.02,
        right: screenWidth * 0.02,
      ),
      child: SingleChildScrollView(
        // physics: NeverScrollableScrollPhysics(),
        child: Responsive.isTablet(context)
            ? Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(
                            top: 20,
                            left: (screenWidth * 0.28 - screenWidth * 0.02),
                          ),
                          child: Center(child: Text('JOB ORDER'))),
                      Visibility(
                          visible: widget.selectedIndex == 1 ||
                                  widget.selectedIndex == 2
                              ? false
                              : true,
                          child: GestureDetector(
                            onTap: () {
                              showPopup(
                                  context, false, widget.index, widget.items);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 20,
                              ),
                              width: 40,
                              height: 40,
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
                  TextFieldFunction(
                    "Salesman",
                    salesman,
                    true,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  TextFieldFunction("Phone Code", phoneCode, true),
                  SizedBox(height: screenHeight * 0.015),
                  SizedBox(
                    height: 50,
                    child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            flex: 2,
                            // width: screenWidth / 3.045,
                            child: DatePickerExample(
                              disable: disable,
                              key: receivedate,
                              label: "Receive Date",
                              text: formatDate(receiveDate.text.toString()),
                            ),
                          ),
                          SizedBox(
                            width: screenWidth * 0.02,
                          ),
                          Expanded(
                            flex: 2,
                            // width: screenWidth / 3.045,
                            child: DatePickerExample(
                              disable: disable,
                              key: deliverydate,
                              label: "Delivery Date",
                              text: formatDate(deliveryDate.text.toString()),
                            ),
                          ),
                        ]),
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  TextFieldFunction("Customer", customer, true),
                  SizedBox(height: screenHeight * 0.015),
                  TextFieldFunction("Mobile Number", mobileNumber, true),
                  SizedBox(height: screenHeight * 0.015),
                  TextFieldFunction(
                    "Driver Details",
                    driverDetails,
                    true,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Row(children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        display: display,
                        filledColor: Colors.grey.shade300,
                        borderColor: Colors.grey,
                        lable: 'Bike Number',
                        controller: bikeNumber,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    Expanded(
                      flex: 2,
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
                  Row(children: [
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        display: display,
                        filledColor: Colors.grey.shade300,
                        borderColor: Colors.grey,
                        lable: 'Estimate Charges',
                        controller: estimateCharges,
                      ),
                    ),
                    SizedBox(
                      width: screenWidth * 0.02,
                    ),
                    Expanded(
                      flex: 2,
                      child: CustomTextField(
                        display: display,
                        filledColor: Colors.grey.shade300,
                        borderColor: Colors.grey,
                        lable: 'Outstanding',
                        controller: outstanding,
                      ),
                    ),
                  ]),
                  SizedBox(height: screenHeight * 0.015),
                  if (signature != null)
                    if (widget.selectedIndex == 1)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          color: homeScreenContainerColor,
                          child: Image.memory(
                              height: 50,
                              signature!), // Display the captured signature
                        ),
                      ),
                  SizedBox(height: screenHeight * 0.08),
                  Row(children: [
                    Visibility(
                      visible: widget.selectedIndex == 0 ? true : false,
                      child: Expanded(
                        flex: 2,
                        child: BottomGestureButton(
                          cancel: cancel,
                          navigationFunction1: cancelEntries(
                              widget.items![widget.index!].id.toString()),
                          text: "CANCEL",
                          textColor: Colors.black,
                          color: Colors.transparent,
                        ),
                      ),
                    ),
                    // GestureDetector(
                    //   onTap: () => navigationFunction!(),
                    //   child: Container(
                    //       height: 50,
                    //       decoration: BoxDecoration(
                    //         border: Border.all(
                    //           color:
                    //           floatingButtonColor, // Set your desired border color here
                    //           width: 1, // Set the width of the border
                    //         ),
                    //         color: floatingButtonColor,
                    //         borderRadius: BorderRadius.circular(10),
                    //       ),
                    //       // padding: cowidgetnst EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                    //       child: Center(
                    //           child: Text(
                    //             "GO TO WORKSHOP",
                    //             style: TextStyle(color: Colors.white),
                    //           ))),
                    // )
                    Visibility(
                      visible: widget.selectedIndex == 0 ? true : false,
                      child: SizedBox(
                        width: screenWidth * 0.02,
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: BottomGestureButton(
                        topbarbutton: widget.selectedIndex == 1 ||
                                widget.selectedIndex == 2
                            ? true
                            : false,
                        selectedIndexRow: widget.selectedIndex,
                        textColor: Colors.white,
                        text: "GO TO WORKSHOP",
                        navigationFunction: navigationFunction,
                        color: floatingButtonColor,
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 10,
                  )
                ],
              )
            : Column(
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
                          visible: widget.selectedIndex == 1 ||
                                  widget.selectedIndex == 2
                              ? false
                              : true,
                          child: GestureDetector(
                            onTap: () {
                              showPopup(
                                  context, false, widget.index!, widget.items);
                            },
                            child: Container(
                              margin: EdgeInsets.only(
                                top: 10,
                              ),
                              width: 40,
                              height: 40,
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
                  TextFieldFunction(
                    "Salesman",
                    salesman,
                    true,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  TextFieldFunction("Phone Code", phoneCode, true),
                  SizedBox(height: screenHeight * 0.015),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: screenWidth / 3.045,
                          child: DatePickerExample(
                            disable: disable,
                            key: receivedate,
                            label: "Receive Date",
                            text: formatDate(receiveDate.text.toString()),
                          ),
                        ),
                        SizedBox(
                          width: screenWidth / 3.045,
                          child: DatePickerExample(
                            disable: disable,
                            key: deliverydate,
                            label: "Delivery Date",
                            text: formatDate(deliveryDate.text.toString()),
                          ),
                        ),
                      ]),
                  SizedBox(height: screenHeight * 0.015),
                  TextFieldFunction("Customer", customer, true),
                  SizedBox(height: screenHeight * 0.015),
                  TextFieldFunction("Mobile Number", mobileNumber, true),
                  SizedBox(height: screenHeight * 0.015),
                  TextFieldFunction(
                    "Driver Details",
                    driverDetails,
                    true,
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
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
                  SizedBox(height: screenHeight * 0.015),
                  if (signature != null)
                    if (widget.selectedIndex == 1)
                      Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                          color: homeScreenContainerColor,
                          child: Image.memory(
                              height: 50,
                              signature!), // Display the captured signature
                        ),
                      ),
                  SizedBox(height: screenHeight * 0.08),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Visibility(
                          visible: widget.selectedIndex == 0 ? true : false,
                          child: BottomGestureButton(
                            cancel: cancel,
                            navigationFunction1: () => cancelEntries(widget
                                .items![widget.index!].id
                                .toString()), // Wrap in a function
                            text: "CANCEL",
                            textColor: Colors.black,
                            color: Colors.transparent,
                          ),
                        ),

                        // GestureDetector(
                        //   onTap: () => navigationFunction!(),
                        //   child: Container(
                        //       height: 50,
                        //       decoration: BoxDecoration(
                        //         border: Border.all(
                        //           color:
                        //           floatingButtonColor, // Set your desired border color here
                        //           width: 1, // Set the width of the border
                        //         ),
                        //         color: floatingButtonColor,
                        //         borderRadius: BorderRadius.circular(10),
                        //       ),
                        //       // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        //       child: Center(
                        //           child: Text(
                        //             "GO TO WORKSHOP",
                        //             style: TextStyle(color: Colors.white),
                        //           ))),
                        // )
                        BottomGestureButton(
                          topbarbutton: widget.selectedIndex == 1 ||
                                  widget.selectedIndex == 2
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
                    height: 10,
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

  showPopup(BuildContext context, bool? text, int? index, List<Job>? items) {
    // text == false ? editInitialSetupFunction(index) : clearAllControllers();
    final Size size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    bool? popup1 = true;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
          child: AlertDialog(
            iconPadding: EdgeInsets.only(top: 5, right: 5),
            icon: Align(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  child: Icon(
                    Icons.close,
                    size: 18,
                  ),
                  onTap: () {
                    Navigator.of(context).pop(); // Close the dialog
                  },
                )),
            backgroundColor: appBackGroundColor,
            surfaceTintColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(5.0)),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Center(
                    child: Text(
                      "EDIT JOB ORDER",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  SizedBox(
                      width: screenWidth / 2.5,
                      height: screenHeight / 18,
                      child: TextFieldFunction("Salesman", salesman, false)),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      width: screenWidth / 2.5,
                      height: screenHeight / 18,
                      child: TextFieldFunction("Phone Code", phoneCode, false)),
                  SizedBox(
                    height: 5,
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SizedBox(
                      height: screenHeight / 18,
                      width: (screenWidth / 2.5) / 2.05,
                      child: DatePickerExample(
                          // ddd: false,
                          text: textFieldsDate2.currentState?.formattedDate
                              .toString(),
                          label: formatDate(receiveDate.text.toString()),
                          key: textFieldsDate2),
                    ),
                    SizedBox(width: (screenWidth / 2.5) / 39),
                    SizedBox(
                      height: screenHeight / 18,
                      width: (screenWidth / 2.5) / 2.05,
                      child: DatePickerExample(
                          text: textFieldsDate1.currentState?.formattedDate
                              .toString(),
                          label: formatDate(deliveryDate.text.toString()),
                          key: textFieldsDate1),
                    ),
                  ]),
                  // Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  //   SizedBox(
                  //     height: screenHeight / 18,
                  //     width: (screenWidth / 2.5) / 2.05,
                  //     child: DatePickerExample(
                  //       key: deliverydate,
                  //       label: deliveryDate.text.toString(),
                  //      text: deliveryDate.text.toString(),
                  //     ),
                  //   ),
                  //   SizedBox(width: (screenWidth / 2.5) / 39),
                  //   SizedBox(
                  //     height: screenHeight / 18,
                  //     width: (screenWidth / 2.5) / 2.05,
                  //     child: DatePickerExample(
                  //       key: receivedate,
                  //       label: receiveDate.text.toString(),
                  //       text: receiveDate.text.toString(),
                  //     ),
                  //   ),
                  // ]),
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       SizedBox(
                  //         height: screenHeight / 18,
                  //         width: (screenWidth / 2.5) / 2.05,
                  //         child: DatePickerExample(
                  //           key: deliverydate,
                  //           label: deliveryDate.text.toString(),
                  //           text: deliveryDate.text.toString(),
                  //         ),
                  //       ),
                  //       SizedBox(
                  //         height: screenHeight / 18,
                  //         width: (screenWidth / 2.5) / 2.05,
                  //         child: DatePickerExample(
                  //           key: receivedate,
                  //           label: receiveDate.text.toString(),
                  //           text: receiveDate.text.toString(),
                  //         ),
                  //       ),
                  //     ]),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: screenHeight / 18,
                        width: Responsive.isTablet(context)
                            ? (screenWidth / 2.5) / 1.18
                            : (screenWidth / 2.5) / 1.11,
                        decoration: BoxDecoration(
                          color: Colors
                              .transparent, // Set your desired background color here
                          border: Border.all(
                              color: textBorderColor, width: 1), // Border color
                          borderRadius:
                              BorderRadius.circular(5), // Rounded corners
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Select",
                            contentPadding: EdgeInsets.only(
                                bottom: 16, left: 23, right: 10),
                          ),
                          focusColor: Colors.transparent,
                          value: selectCustomer,
                          dropdownColor: Colors.white,
                          items: customerList,
                          onSaved: (String? itemChosen) {
                            setState(() {
                              selectCustomer = itemChosen!;
                            });
                          },
                          onChanged: (String? value) {
                            setState(() {
                              selectCustomer = value!;
                            });
                          },
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          nextPopup(context);
                        },
                        child: Container(
                          height: screenHeight / 18,
                          width: Responsive.isTablet(context) ? 40 : 50,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: textBorderColor, width: 1),
                            color: Colors
                                .transparent, // Background color// Border color
                            borderRadius: BorderRadius.circular(
                                8), // Optional: Rounded corners
                          ),
                          child: Center(
                            child: Container(
                              width: 20.0, // Width of the square
                              height: 20.0,
                              child: SvgPicture.asset(
                                'assets/Icons/add_person.svg',
                                fit: BoxFit
                                    .contain, // Adjusts SVG size within the square
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      width: screenWidth / 2.5,
                      height: screenHeight / 18,
                      child: TextFieldFunction(
                          "Mobile Number", mobileNumber, false)),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                      width: screenWidth / 2.5,
                      height: screenHeight / 18,
                      child: TextFieldFunction(
                          "Driver Details", driverDetails, false)),
                  SizedBox(height: 5),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: screenHeight / 18,
                          width: (screenWidth / 2.5) / 2.05,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            // Set your desired background color here
                            border:
                                Border.all(color: textBorderColor, width: 1),
                            // Border color
                            borderRadius:
                                BorderRadius.circular(5), // Rounded corners
                          ),
                          child: DropdownButtonFormField<String>(
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: "Select",
                              contentPadding: EdgeInsets.only(
                                  bottom: 16, left: 23, right: 10),
                            ),
                            focusColor: Colors.transparent,
                            value: selectBikeList,
                            dropdownColor: Colors.white,
                            items: bikeList,
                            onSaved: (String? itemChosen) {
                              setState(() {
                                selectBikeList = itemChosen!;
                              });
                            },
                            onChanged: (String? value) {
                              setState(() {
                                selectBikeList = value!;
                              });
                            },
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: screenHeight / 18,
                            width: (screenWidth / 2.5) / 2.05,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: redBorder, // Set the border color
                                width: 1, // Set the border width
                              ),
                              color: redBorder.withOpacity(
                                  0.1), // Background color with 50% opacity
                              borderRadius: BorderRadius.circular(
                                  5), // Optional: Rounded corners
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 20),
                                  // color: Colors.,
                                  width: 18.0, // Width of the square
                                  height: 18.0,
                                  child: SvgPicture.asset(
                                    'assets/Icons/location.svg',
                                    // Replace with your SVG asset path
                                    fit: BoxFit
                                        .contain, // Adjusts SVG size within the square
                                  ),
                                ),
                                Center(
                                  child: Text(
                                    "Pickup Location", // Button text
                                    style: TextStyle(
                                      color: redBorder, // Text color
                                      fontSize: 14, // Text size
                                      fontWeight: FontWeight.bold, // Text style
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                  SizedBox(
                    height: 5,
                  ),
                  SizedBox(
                    width: screenWidth / 2.5,
                    child: CustomTextField(
                      filledColor: Colors.grey.shade300,
                      borderColor: Colors.grey,
                      maxLines: 3,
                      lable: 'Diagnosis',
                      controller: diagnosis,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: screenHeight / 18,
                          width: (screenWidth / 2.5) / 2.05,
                          child: CustomTextField(
                            filledColor: Colors.grey.shade300,
                            borderColor: Colors.grey,
                            lable: 'Estimate Charges',
                            controller: estimateCharges,
                          ),
                        ),
                        SizedBox(
                          height: screenHeight / 18,
                          width: (screenWidth / 2.5) / 2.05,
                          child: CustomTextField(
                            popup: popup1,
                            filledColor: Colors.grey.shade300,
                            borderColor: Colors.grey,
                            lable: 'Outstanding',
                            controller: outstanding,
                          ),
                        ),
                      ]),
                  SizedBox(height: 15),
                  SizedBox(
                    width: screenWidth / 2.5,
                    height: screenHeight / 18,
                    child: GestureDetector(
                      onTap: () {
                        updateJobEntry(items?[index!].id.toString());
                      },
                      child: Container(
                          height: 50,
                          // width: widget.popup == true ? 100 : 0,
                          width: size.width / 1.45,
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: floatingButtonColor,
                              // Set your desired border color here
                              width: 1, // Set the width of the border
                            ),
                            color: floatingButtonColor,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                          child: Center(
                              child: Text(
                            "UPDATE",
                            style: TextStyle(color: Colors.white),
                          ))),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  nextPopup(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
          child: Responsive.isTablet(context)
              ? Stack(
                  children: [
                    AlertDialog(
                      iconPadding: EdgeInsets.only(top: 5, right: 5),
                      icon: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            child: Icon(
                              Icons.close,
                              size: 18,
                            ),
                            onTap: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          )),
                      backgroundColor: appBackGroundColor,
                      surfaceTintColor: Colors.transparent,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      title: Text(
                        "ADD CUSTOMER",
                        style: TextStyle(
                            color: floatingButtonColor,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      content: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: screenWidth / 5,
                              height: 35,
                              child: CustomTextField(
                                filledColor: Colors.grey.shade300,
                                borderColor: Colors.grey,
                                lable: 'Name',
                                controller: name,
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              width: screenWidth / 5,
                              height: 35,
                              child: CustomTextField(
                                filledColor: Colors.grey.shade300,
                                borderColor: Colors.grey,
                                lable: 'Phone Number',
                                controller: phoneNumber,
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              width: screenWidth / 5,
                              height: 35,
                              child: CustomTextField(
                                filledColor: Colors.grey.shade300,
                                borderColor: Colors.grey,
                                lable: 'Email',
                                controller: email,
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              width: screenWidth / 5,
                              height: 35,
                              child: CustomTextField(
                                filledColor: Colors.grey.shade300,
                                borderColor: Colors.grey,
                                lable: 'Vat',
                                controller: vat,
                              ),
                            ),
                            SizedBox(height: 4),
                            Container(
                              width: screenWidth / 5,
                              height: 35,
                              child: CustomTextField(
                                filledColor: Colors.grey.shade300,
                                borderColor: Colors.grey,
                                lable: 'Address',
                                controller: address,
                              ),
                            ),
                            SizedBox(height: 10),
                            GestureDetector(
                              onTap: () => {Navigator.pop(context)},
                              child: Container(
                                  width: screenWidth / 5,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      color: floatingButtonColor,
                                      // Set your desired border color here
                                      width: 1, // Set the width of the border
                                    ),
                                    color: floatingButtonColor,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Center(
                                      child: Text(
                                    "SAVE",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 12),
                                  ))),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Container(
                        // color: appBackGroundColor,
                        // margin: EdgeInsets.only(
                        //     left: screenWidth / 1.5, top: screenHeight / 7.95),
                        child: IconButton(
                          icon: SvgPicture.asset(
                            'assets/Icons/cross.svg',
                            // Update this path to your SVG file
                            // width: 25,
                            // height: 25,
                            color: Colors
                                .black, // You can change the color if needed
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: [
                    AlertDialog(
                      iconPadding: EdgeInsets.only(top: 5, right: 5),
                      icon: Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            child: Icon(
                              Icons.close,
                              size: 18,
                            ),
                            onTap: () {
                              Navigator.of(context).pop(); // Close the dialog
                            },
                          )),
                      backgroundColor: appBackGroundColor,
                      surfaceTintColor: Colors.transparent,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      title: Center(
                        child: Text(
                          "ADD CUSTOMER",
                          style: TextStyle(
                              color: floatingButtonColor,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      content: SingleChildScrollView(
                        child: Container(
                          width: screenWidth / 5,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              SizedBox(
                                width: screenWidth / 5,
                                height: 35,
                                child: CustomTextField(
                                  filledColor: Colors.grey.shade300,
                                  borderColor: Colors.grey,
                                  lable: 'Name',
                                  controller: name,
                                ),
                              ),
                              SizedBox(height: 4),
                              Container(
                                width: screenWidth / 5,
                                height: 35,
                                child: CustomTextField(
                                  filledColor: Colors.grey.shade300,
                                  borderColor: Colors.grey,
                                  lable: 'Phone Number',
                                  controller: phoneNumber,
                                ),
                              ),
                              SizedBox(height: 4),
                              Container(
                                width: screenWidth / 5,
                                height: 35,
                                child: CustomTextField(
                                  filledColor: Colors.grey.shade300,
                                  borderColor: Colors.grey,
                                  lable: 'Email',
                                  controller: email,
                                ),
                              ),
                              SizedBox(height: 4),
                              Container(
                                width: screenWidth / 5,
                                height: 35,
                                child: CustomTextField(
                                  filledColor: Colors.grey.shade300,
                                  borderColor: Colors.grey,
                                  lable: 'Vat',
                                  controller: vat,
                                ),
                              ),
                              SizedBox(height: 4),
                              Container(
                                width: screenWidth / 5,
                                height: 35,
                                child: CustomTextField(
                                  filledColor: Colors.grey.shade300,
                                  borderColor: Colors.grey,
                                  lable: 'Address',
                                  controller: address,
                                ),
                              ),
                              SizedBox(height: 10),
                              GestureDetector(
                                onTap: () => {Navigator.pop(context)},
                                child: Container(
                                    width: screenWidth / 5,
                                    height: 35,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: floatingButtonColor,
                                        // Set your desired border color here
                                        width: 1, // Set the width of the border
                                      ),
                                      color: floatingButtonColor,
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: Center(
                                        child: Text(
                                      "SAVE",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ))),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      child: Container(
                        // color: appBackGroundColor,
                        // margin: EdgeInsets.only(
                        //     left: screenWidth / 1.5, top: screenHeight / 7.95),
                        child: IconButton(
                          icon: SvgPicture.asset(
                            'assets/Icons/cross.svg',
                            // Update this path to your SVG file
                            // width: 25,
                            // height: 25,
                            color: Colors
                                .black, // You can change the color if needed
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }

  String formatDate(String dateString) {
    DateTime dateTime = DateTime.parse(dateString);
    return "${dateTime.year.toString().padLeft(4, '0')}-"
        "${dateTime.month.toString().padLeft(2, '0')}-"
        "${dateTime.day.toString().padLeft(2, '0')}";
  }

  bool? signatureDisplay = false;
  Uint8List? signature;

  navigationFunction() async {
    final value = await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => Workshopscreen(
              topbarbutton:
                  widget.selectedIndex == 1 || widget.selectedIndex == 2
                      ? true
                      : false,
              ontab1: widget.ontab1)),
    );
    if (value != null) {
      setState(() {
        signature = value;
      });
    }
  }
}
