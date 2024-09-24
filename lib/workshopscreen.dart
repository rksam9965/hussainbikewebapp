import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:hussainbikewebapp/utils/colors.dart';
import 'package:hussainbikewebapp/widget/date_picker.dart';
import 'package:signature/signature.dart';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart' show kIsWeb;

import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

import 'Textfield.dart';
import 'package:flutter/foundation.dart'; // kIsWeb flag

import 'datamodule/dummyData.dart';

class Workshopscreen extends StatefulWidget {
  bool? topbarbutton;
  Function? ontab1;
  Workshopscreen({super.key, this.topbarbutton, this.ontab1});

  @override
  State<Workshopscreen> createState() => _WorkshopscreenState();
}

class _WorkshopscreenState extends State<Workshopscreen> {
  final TextEditingController workshopRemark = TextEditingController();
  final TextEditingController partUsedFrom = TextEditingController();

  final TextEditingController partUsed = TextEditingController();
  final TextEditingController repairCharge = TextEditingController();
  final TextEditingController total = TextEditingController();

  final textFieldsDate1 = GlobalKey<DatePickerExampleState>();

  List<DropdownMenuItem<String>> technicianList = [];
  var selectTechnician = '';

  List<DropdownMenuItem<String>> partsList = [];
  var selectParts = '';
  bool kk = false;
  late SignatureController _controller;

  File? _selectedFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickFile() async {
    try {
      final XFile? pickedFile =
          await _picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        setState(() {
          _selectedFile = File(pickedFile.path);
        });
      }
    } catch (e) {
      // Handle any errors that might occur
      print('Error picking file: $e');
    }
  }

  Uint8List? webImage; // For web

  // Future<void> _captureImage() async {
  //   try {
  //     if (kIsWeb) {
  //       // Create an HTML input element
  //       // Create an HTML input element
  //       final html.InputElement uploadInput = html.FileUploadInputElement()
  //         ..accept = 'image/*'
  //         ..setAttribute('capture',
  //             'environment'); // Use 'environment' for back camera, or 'user' for front camera
  //
  //       // Trigger the file picker
  //       uploadInput.click();
  //
  //       // Listen for changes
  //       uploadInput.onChange.listen((e) async {
  //         final files = uploadInput.files;
  //         if (files!.isEmpty) return;
  //
  //         final reader = html.FileReader();
  //         reader.readAsArrayBuffer(files[0]);
  //         reader.onLoadEnd.listen((e) {
  //           setState(() {
  //             webImage = reader.result as Uint8List; // Save image bytes
  //           });
  //         });
  //       });
  //     } else {
  //       // For mobile platforms (Android/iOS)
  //       final XFile? capturedFile =
  //           await _picker.pickImage(source: ImageSource.camera);
  //
  //       if (capturedFile != null) {
  //         setState(() {
  //           _selectedFile = File(capturedFile.path);
  //         });
  //       }
  //     }
  //   } catch (e) {
  //     print('Error capturing image: $e');
  //   }
  // }

  @override
  void initState() {
    technicianListFunction();
    partsListFunction();
    _controller = SignatureController(
      penStrokeWidth: 1,
      penColor: Colors.black,
      exportBackgroundColor: Colors.white,
    );
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  technicianListFunction() {
    technicianList.add(
      DropdownMenuItem(
        value: "",
        child: Center(
          child: Text(
            'Technician 1',
            style: TextStyle(
                color: lightGrey,
                fontWeight: FontWeight.w300,
                fontSize: 14 // Color of the label text
                ),
          ),
        ),
      ),
    );
    technicianList.add(
      DropdownMenuItem(
        value: "1",
        child: Center(
          child: Text(
            'Technician 2',
            style: TextStyle(
                color: lightGrey,
                fontWeight: FontWeight.w300,
                fontSize: 14 // Color of the label text
                ),
          ),
        ),
      ),
    );
    technicianList.add(
      DropdownMenuItem(
        value: "2",
        child: Center(
          child: Text(
            "Technician 3",
            style: TextStyle(
                color: lightGrey,
                fontWeight: FontWeight.w300,
                fontSize: 14 // Color of the label text
                ),
          ),
        ),
      ),
    );
  }

  partsListFunction() {
    partsList.add(
      DropdownMenuItem(
        value: "",
        child: Center(
          child: Text(
            'Parts 1',
            style: TextStyle(
                color: lightGrey,
                fontWeight: FontWeight.w300,
                fontSize: 14 // Color of the label text
                ),
          ),
        ),
      ),
    );
    partsList.add(
      DropdownMenuItem(
        value: "1",
        child: Center(
          child: Text(
            'Parts 2',
            style: TextStyle(
                color: lightGrey,
                fontWeight: FontWeight.w300,
                fontSize: 14 // Color of the label text
                ),
          ),
        ),
      ),
    );
    partsList.add(
      DropdownMenuItem(
        value: "2",
        child: Center(
          child: Text(
            "Parts 3",
            style: TextStyle(
                color: lightGrey,
                fontWeight: FontWeight.w300,
                fontSize: 14 // Color of the label text
                ),
          ),
        ),
      ),
    );
  }

  final TextEditingController printName = TextEditingController();

  final TextEditingController code = TextEditingController();
  final TextEditingController qty = TextEditingController();
  final TextEditingController price = TextEditingController();

  List<Item1> items = [
    Item1(code: "65", printName: "track", qty: "5", price: "6763")
  ];

  Future<Uint8List?> _captureSignature() async {
    if (_controller.isNotEmpty) {
      // Capture the signature as an image
      final ui.Image? signatureImage = await _controller.toImage();

      // Create a new image with a background color
      final ui.PictureRecorder recorder = ui.PictureRecorder();
      final Canvas canvas = Canvas(recorder);

      // Set the background color
      final backgroundColor =
          homeScreenContainerColor; // Change to your desired color
      canvas.drawPaint(Paint()..color = backgroundColor);

      // Draw the signature on top of the background
      canvas.drawImage(signatureImage!, Offset.zero, Paint());

      // End the recording and convert to an image
      final ui.Image newImage = await recorder
          .endRecording()
          .toImage(signatureImage.width, signatureImage.height);

      // Convert the new image to PNG format
      final ByteData? byteData =
          await newImage.toByteData(format: ui.ImageByteFormat.png);
      return byteData?.buffer.asUint8List(); // Convert to Uint8List
    }
    return null;
  }

  submitSignature() async {
    final signatureBytes = await _captureSignature();
    if (signatureBytes != null) {
      widget.ontab1!();
      Navigator.pop(context, signatureBytes);
      Navigator.pop(context, signatureBytes);
    }
  }

  signaturePopUp(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
          child: Stack(
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
                    "Please enter signature to complete",
                    style: TextStyle(
                        color: floatingButtonColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              icon: const Icon(
                                color: Colors.black,
                                Icons.clear,
                                size: 20,
                              ),
                              onPressed: () {
                                setState(() {
                                  _controller.clear();
                                });
                              },
                            ),
                          ),
                          Signature(
                            controller: _controller,
                            height: 200,
                            width: screenWidth / 4,
                            backgroundColor: Colors.white,
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                setState(() {
                                  _controller.clear(); // Clear the text field
                                });
                              },
                              child: Text(
                                'CLEAR',
                                style: TextStyle(
                                  color: Colors.black, // Change text color
                                  fontSize: 12, // Adjust text size if needed
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 8),
                      GestureDetector(
                        onTap: () => {submitSignature()},
                        child: Container(
                            height: screenHeight * 0.08,
                            width: screenWidth / 4,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color:
                                    floatingButtonColor, // Set your desired border color here
                                width: 1, // Set the width of the border
                              ),
                              color: floatingButtonColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                                child: Text(
                              "COMPLETE",
                              style: TextStyle(color: Colors.white),
                            ))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  addDataWorkshop() {
    setState(() {
      items.add(Item1(
        code: code.text,
        printName: printName.text,
        qty: qty.text,
        price: price.text,
      ));
    });
    // Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: workShopBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,

        backgroundColor: workShopBackgroundColor,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
                // Action when the button is pressed
              },
              icon: Icon(
                Icons.arrow_back, // Icon to use
                color: textRed, // Set the icon color
                size: 20, // Set the icon size
              ),
            ),
            SizedBox(width: 8), // Add spacing between icon and text
            Text(
              'BACK TO JOB ORDER',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: textRed, // Custom text color
              ),
            ),
          ],
        ),
        // Remove the default leading icon (back arrow) by not using the 'leading' property here
      ),
      body: Container(
        width: screenWidth,
        height: screenHeight,
        margin: EdgeInsets.only(left: 24, top: 0, bottom: 0, right: 24),
        color: workShopContainer,
        child: Container(
          padding: EdgeInsets.all(24),
          // color: Colors.red,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20, bottom: 20),
                  child: Text(
                    "WORKSHOP",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 0),
                        child: Text("Customer")),
                    Container(
                        margin: EdgeInsets.only(right: 0),
                        child: Text("Receive Date"))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        margin: EdgeInsets.only(left: 0),
                        child: const Text("Job Order Number")),
                    Column(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 0),
                            child: const Text("Delivery Date")),
                      ],
                    )
                  ],
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      margin: EdgeInsets.only(top: 10.0, right: 0),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(4.0),
                        border: Border.all(
                          color: textFieldTypeTextColor,
                          width: 1.0,
                        ),
                      ),
                      child: const Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'TOTAL CHARGES: ', // Normal text
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight:
                                    FontWeight.normal, // Normal font weight
                              ),
                            ),
                            TextSpan(
                              text: '558 KWD', // Bold text
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                                fontWeight: FontWeight.bold, // Bold font weight
                              ),
                            ),
                          ],
                        ),
                      )),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: screenHeight * 0.082,
                        width: screenWidth / 2.174,
                        margin: EdgeInsets.only(top: 6, left: 0),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          // Set your desired background color here
                          border: Border.all(color: textBorderColor, width: 1),
                          // Border color
                          borderRadius:
                              BorderRadius.circular(5), // Rounded corners
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: const InputDecoration(
                            border: InputBorder.none,
                            hintText: "Select",
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 25),
                          ),
                          focusColor: Colors.transparent,
                          value: selectTechnician,
                          dropdownColor: Colors.white,
                          items: technicianList,
                          // onSaved: (String? itemChosen) {
                          //   setState(() {
                          //     selectTechnician = itemChosen!;
                          //   });
                          // },
                          onChanged: (String? value) {
                            setState(() {
                              selectTechnician = value!;
                            });
                          },
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 6, left: 0),
                        height: screenHeight * 0.082,
                        width: screenWidth / 2.174,
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //   color:
                          //       textFieldTypeTextColor, // Set the border color
                          //   width: 1, // Set the border width
                          // ),
                          // color: redBorder.withOpacity(
                          //     0.1), // Background color with 50% opacity
                          borderRadius: BorderRadius.circular(
                              8), // Optional: Rounded corners
                        ),
                        child: DatePickerExample(
                          key: textFieldsDate1,
                          label: "Delivery Date",
                        ),
                      ),
                    ]),
                SizedBox(height: screenHeight * 0.010),
                CustomTextField(
                  filledColor: Colors.grey.shade300,
                  borderColor: Colors.grey,
                  maxLines: 2,
                  lable: 'WorkshopRemark',
                  controller: workshopRemark,
                ),
                Container(
                  height: screenHeight * 0.082,
                  width: screenWidth / 1,
                  margin: EdgeInsets.only(top: 6, left: 0),
                  decoration: BoxDecoration(
                    color: Colors
                        .transparent, // Set your desired background color here
                    border: Border.all(
                        color: textBorderColor, width: 1), // Border color
                    borderRadius: BorderRadius.circular(5), // Rounded corners
                  ),
                  child: DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Select",
                      contentPadding: EdgeInsets.symmetric(horizontal: 25),
                    ),
                    focusColor: Colors.transparent,
                    value: selectParts,
                    dropdownColor: Colors.white,
                    items: partsList,
                    // onSaved: (String? itemChosen) {
                    //   setState(() {
                    //     selectTechnician = itemChosen!;
                    //   });
                    // },
                    onChanged: (String? value) {
                      setState(() {
                        selectParts = value!;
                      });
                    },
                  ),
                ),
                Container(
                  height: screenHeight / 3,
                  padding: const EdgeInsets.all(20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        // Heading Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment
                              .spaceBetween, // To space the containers evenly
                          children: [
                            Container(
                              width: 100,
                              height: 40,
                              child: Center(
                                child: Text(
                                  "Code",
                                  style: TextStyle(
                                    fontSize: 14, // Increase font size
                                    fontWeight:
                                        FontWeight.w300, // Make the text bold
                                    color:
                                        lightGrey, // Change text color to blue
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 40,
                              child: Center(
                                child: Text(
                                  'PrintName',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: lightGrey,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 40,
                              child: Center(
                                child: Text(
                                  'Qty',
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: lightGrey,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 40,
                              child: Center(
                                child: Text(
                                  "Price",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: lightGrey,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 40,
                              child: Center(
                                child: Text(
                                  "Total",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w300,
                                    color: lightGrey,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        for (int i = 0; i < items.length; i++)
                          Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 0.0), // Add vertical margin
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.all(0),
                                      width: 100,
                                      height: 25,
                                      child: Center(
                                          child:
                                              Text(items[i].code.toString())),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(0),
                                      width: 100,
                                      height: 25,
                                      child: Center(
                                          child: Text(
                                              items[i].printName.toString())),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(0),
                                      width: 100,
                                      height: 25,
                                      child: Center(
                                        child: Text(items[i].qty.toString()),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(0),
                                      width: 100,
                                      height: 25,
                                      child: Center(
                                        child: Text(items[i].price.toString()),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.all(0),
                                      width: 100,
                                      height: 25,
                                      child: Center(
                                        child: Text('988'),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        Visibility(
                          visible: widget.topbarbutton == true ? false : true,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 0.0), // Add vertical margin
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.all(0),
                                  width: 150,
                                  height: 150,
                                  child: CustomTextField(
                                    filledColor: Colors.grey.shade300,
                                    borderColor: Colors.grey,
                                    lable: 'Code',
                                    controller: code,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(0),
                                  width: 150,
                                  height: 150,
                                  child: CustomTextField(
                                    filledColor: Colors.grey.shade300,
                                    borderColor: Colors.grey,
                                    lable: 'Print Name',
                                    controller: printName,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(0),
                                  width: 150,
                                  height: 150,
                                  child: CustomTextField(
                                    filledColor: Colors.grey.shade300,
                                    borderColor: Colors.grey,
                                    lable: 'Quantity',
                                    controller: qty,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.all(0),
                                  width: 150,
                                  height: 150,
                                  child: CustomTextField(
                                    filledColor: Colors.grey.shade300,
                                    borderColor: Colors.grey,
                                    lable: 'Price',
                                    controller: price,
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    addDataWorkshop();
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 100, right: 20),
                                    width: 50,
                                    // Adjust the width as needed
                                    height: 50,
                                    // Adjust the height as needed
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          8), // Rounded corners (optional)
                                      color: Colors.grey
                                          .shade300, // Add background color
                                    ),
                                    child: const Center(
                                      child: Icon(
                                        Icons.add,
                                        size: 24,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10, left: 20),
                      // width: screenWidth / 9,
                      child: Text(
                        "Part Used",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: textFieldTypeTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth / 4.35,
                      child: CustomTextField(
                        filledColor: Colors.grey.shade300,
                        borderColor: Colors.grey,
                        lable: '',
                        controller: partUsed,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10, left: 20),
                      // width: screenWidth / 9,
                      child: Text(
                        "Repair Charge",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: textFieldTypeTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth / 4.35,
                      child: CustomTextField(
                        filledColor: Colors.grey.shade300,
                        borderColor: Colors.grey,
                        lable: '',
                        controller: repairCharge,
                      ),
                    ),
                    SizedBox(
                      width: 12,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10, left: 20),
                      child: Text(
                        "Total",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w300,
                          color: textFieldTypeTextColor,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: screenWidth / 4.35,
                      child: CustomTextField(
                        filledColor: Colors.grey.shade300,
                        borderColor: Colors.grey,
                        lable: '',
                        controller: total,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    widget.topbarbutton == false
                        ? Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Navigator.of(context).pop();
                                  _pickFile();

                                  // Action when the button is tapped
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  // width: 300, // Customize the width of the button
                                  // height: 50, // Customize the height of the button
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(4.0),
                                    border: Border.all(
                                      color: textFieldTypeTextColor,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SvgPicture.asset(
                                        'assets/Icons/upload.svg',
                                        // Path to your SVG asset
                                        color: floatingButtonColor,
                                        // Optional color for the SVG icon
                                        width: 24,
                                        // Customize icon width
                                        height: 24, // Customize icon height
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10),
                                        child: Text(
                                          "UPLOAD BIKE PHOTO",
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold,
                                            color: floatingButtonColor,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // captureImage();

                                  // Action when the button is tapped
                                  print("SVG Button tapped");
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),

                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  // width: 50, // Customize the width of the button
                                  // height: 50, // Customize the height of the button
                                  decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(4.0),
                                    border: Border.all(
                                      color: textFieldTypeTextColor,
                                      width: 1.0,
                                    ),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(
                                      'assets/Icons/camera.svg',
                                      // Path to your SVG asset
                                      color: floatingButtonColor,
                                      // Optional color for the SVG icon
                                      width: 24,
                                      // Customize icon width
                                      height: 24, // Customize icon height
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Action when the button is tapped
                                  imageContainerPopUp(context);
                                },
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),

                                  // padding: const EdgeInsets.symmetric(
                                  //     vertical: 10.0, horizontal: 20.0),
                                  width:
                                      60, // Customize the width of the button
                                  height:
                                      60, // Customize the height of the button
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'assets/Icons/bikeimage.png'),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  // child: Center(
                                  //   child: SvgPicture.asset(
                                  //     'assets/Icons/camera.svg',
                                  //     // Path to your SVG asset
                                  //     color: floatingButtonColor,
                                  //     // Optional color for the SVG icon
                                  //     width: 24,
                                  //     // Customize icon width
                                  //     height: 24, // Customize icon height
                                  //   ),
                                  // ),
                                ),
                              ),
                            ],
                          ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                          padding: const EdgeInsets.symmetric(
                              vertical: 15.0, horizontal: 20.0),
                          margin: EdgeInsets.only(top: 10.0, right: 0),
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            borderRadius: BorderRadius.circular(4.0),
                            border: Border.all(
                              color: textFieldTypeTextColor,
                              width: 1.0,
                            ),
                          ),
                          child: const Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'TOTAL CHARGES: ', // Normal text
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight:
                                        FontWeight.normal, // Normal font weight
                                  ),
                                ),
                                TextSpan(
                                  text: '558 KWD', // Bold text
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight:
                                        FontWeight.bold, // Bold font weight
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: () {
                    widget.topbarbutton == true ? {} : signaturePopUp(context);
                  },
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 100,
                    ),
                    width: screenWidth,
                    height: 50,
                    decoration: BoxDecoration(
                      color: widget.topbarbutton == true
                          ? completingJobOrder.withOpacity(0.6)
                          : floatingButtonColor, // Background color
                      borderRadius: BorderRadius.circular(5), // Rounded corners
                    ),
                    child: const Center(
                      child: Text(
                        'COMPLETE JOB ORDER',
                        style: TextStyle(
                          color: Colors.white, // Text color
                          fontSize: 12, // Font size
                          fontWeight: FontWeight.bold, // Font weight
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  imageContainerPopUp(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Theme(
            data: Theme.of(context)
                .copyWith(dialogBackgroundColor: Colors.transparent),
            child: AlertDialog(
              content: Container(
                margin: EdgeInsets.only(left: 10),
                width: 300, // Customize the width of the button
                height: 300, // Customize the height of the button
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Icons/download 1.png'),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
          );
        });
  }

  Widget TextFieldFunction(String label, TextEditingController controller) {
    return SizedBox(
      child: CustomTextField(
        lable: label,
        controller: controller,
      ),
    );
  }
}
