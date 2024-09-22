// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:hussainbikewebapp/datamodule/dummyData.dart';
// import 'package:hussainbikewebapp/utils/colors.dart';
// import 'package:hussainbikewebapp/widget/bottom_gesture_button.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:hussainbikewebapp/widget/date_picker.dart';
// import 'package:hussainbikewebapp/workshopscreen.dart';
//
// import 'Textfield.dart';
//
// class CustomerScreen1 extends StatefulWidget {
//   int? selectedIndex;
//   int? passingIndex;
//   String? salesman;
//   Function(BuildContext context, bool? text, int? index)? showPopup;
//   int? index;
//   List<Item>? items;
//   final ValueChanged<Item> onEdit;
//
//   CustomerScreen1(
//       {super.key,
//       this.passingIndex,
//       this.selectedIndex,
//       required,
//       this.showPopup,
//       this.salesman,
//       this.items,
//       this.index,
//       required this.onEdit});
//
//   @override
//   State<CustomerScreen1> createState() => CustomerScreen1State();
// }
//
// class CustomerScreen1State extends State<CustomerScreen1> {
//   final TextEditingController salesman = TextEditingController();
//   final TextEditingController phoneCode = TextEditingController();
//   final TextEditingController customer = TextEditingController();
//   final TextEditingController mobileNumber = TextEditingController();
//   final TextEditingController receiveDate = TextEditingController();
//   final TextEditingController driverDetails = TextEditingController();
//   final TextEditingController driverDate = TextEditingController();
//
//   // final TextEditingController salesman = TextEditingController();
//   // final TextEditingController phoneCode = TextEditingController();
//   // final TextEditingController customer = TextEditingController();
//   final TextEditingController deliveryDate = TextEditingController();
//
//   final TextEditingController bikeNumber = TextEditingController();
//   final TextEditingController diagnosis = TextEditingController();
//   final TextEditingController estimateCharges = TextEditingController();
//   final TextEditingController outstanding = TextEditingController();
//   final TextEditingController address = TextEditingController();
//   final TextEditingController name = TextEditingController();
//   final TextEditingController phoneNumber = TextEditingController();
//   final TextEditingController email = TextEditingController();
//   final TextEditingController vat = TextEditingController();
//   final TextEditingController address1 = TextEditingController();
//   final textFieldsDate1 = GlobalKey<DatePickerExampleState>();
//   final textFieldsDate2 = GlobalKey<DatePickerExampleState>();
//
//   int selectedIndex = 0; // Track the selected screen index
//   int selectedIndex1 = 0;
//   int passingIndex = 0;
//
//   List<DropdownMenuItem<String>> weekList = [];
//   var selectWeek = '';
//
//   List<DropdownMenuItem<String>> customerList = [];
//
//   List<DropdownMenuItem<String>> bikeList = [];
//   var selectBikeList = '';
//
//   // final TextEditingController bikeNumber = TextEditingController();
//   // final TextEditingController diagnosis = TextEditingController();
//   // final TextEditingController estimateCharges = TextEditingController();
//   // final TextEditingController outstanding = TextEditingController();
//   // final TextEditingController address = TextEditingController();
//   final receivedate = GlobalKey<DatePickerExampleState>();
//   final deliverydate = GlobalKey<DatePickerExampleState>();
//
//   bool? display = true;
//   bool? disable = true;
//
//   @override
//   void initState() {
//     salesman.text = widget.items![widget.index!].salesman.toString();
//     phoneCode.text = widget.items![widget.index!].phoneCode.toString();
//     customer.text = widget.items![widget.index!].customer.toString();
//     mobileNumber.text = widget.items![widget.index!].mobileNumber.toString();
//     receiveDate.text = widget.items![widget.index!].receiveDate.toString();
//     driverDate.text = widget.items![widget.index!].deliverDate.toString();
//     driverDetails.text = widget.items![widget.index!].driverDetails.toString();
//     bikeNumber.text = widget.items![widget.index!].bikeNumber.toString();
//     diagnosis.text = widget.items![widget.index!].diagnosis.toString();
//     estimateCharges.text =
//         widget.items![widget.index!].estimateCharges.toString();
//     outstanding.text = widget.items![widget.index!].outstanding.toString();
//     address.text = widget.items![widget.index!].address.toString();
//     super.initState();
//   }
//
//   edit() {
//     setState(() {
//       widget.items![widget.index!].salesman = "horlic";
//     });
//     // Navigator.pop(context);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     var screenWidth = MediaQuery.of(context).size.width;
//     var screenHeight = MediaQuery.of(context).size.height;
//
//     return Container(
//       height: size.height / 0.8125,
//       color: homeScreenContainerColor,
//       margin: const EdgeInsets.only(
//         top: 30,
//         // right: 24,
//       ),
//       padding: const EdgeInsets.only(
//         left: 24,
//         right: 24,
//       ),
//       child: SingleChildScrollView(
//         child: Column(
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                     margin: EdgeInsets.only(
//                       top: 10,
//                       left: screenWidth * 0.28,
//                     ),
//                     child: Text('JOB ORDER')),
//                 Visibility(
//                     visible:
//                         widget.selectedIndex == 1 || widget.selectedIndex == 2
//                             ? false
//                             : true,
//                     child: GestureDetector(
//                       onTap: () {
//                         edit();
//                         showPopup(context, false, widget.index);
//                         // widget.showPopup!(context, false, widget.index);
//                       },
//                       child: Container(
//                         margin: EdgeInsets.only(
//                           top: 10,
//                         ),
//                         width: 40, // Specify the width of the container
//                         height:
//                             40, // Specify the height of the container// Background color of the container
//                         child: SvgPicture.asset(
//                           'assets/Icons/edit_icon.svg', // Path to your SVG file
//                           fit: BoxFit.contain, // Adjust the fit as needed
//                         ),
//                       ),
//                     ))
//               ],
//             ),
//             SizedBox(height: screenHeight * 0.05),
//             const SizedBox(height: 16),
//             TextFieldFunction(
//               "Salesman",
//               salesman,
//             ),
//             SizedBox(height: screenHeight * 0.015),
//             TextFieldFunction("Phone Code", phoneCode),
//             SizedBox(height: screenHeight * 0.015),
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               SizedBox(
//                 width: screenWidth / 3.045,
//                 child: DatePickerExample(
//                   disable: disable,
//                   key: receivedate,
//                   label: "Receive Date",
//                   text: receiveDate.text.toString(),
//                 ),
//               ),
//               SizedBox(
//                 width: screenWidth / 3.045,
//                 child: DatePickerExample(
//                   disable: disable,
//                   key: deliverydate,
//                   label: "Delivery Date",
//                   text: driverDate.text.toString(),
//                 ),
//               ),
//             ]),
//             SizedBox(height: screenHeight * 0.015),
//             TextFieldFunction(
//               "Customer",
//               customer,
//             ),
//             SizedBox(height: screenHeight * 0.015),
//             TextFieldFunction(
//               "Mobile Number",
//               mobileNumber,
//             ),
//             SizedBox(height: screenHeight * 0.015),
//             TextFieldFunction(
//               "Driver Details",
//               driverDetails,
//             ),
//             SizedBox(height: screenHeight * 0.015),
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               Container(
//                 width: screenWidth / 3.045,
//                 child: CustomTextField(
//                   display: display,
//                   filledColor: Colors.grey.shade300,
//                   borderColor: Colors.grey,
//                   lable: 'Bike Number',
//                   controller: bikeNumber,
//                 ),
//               ),
//               SizedBox(
//                 width: screenWidth / 3.045,
//                 child: CustomTextField(
//                   display: display,
//                   filledColor: Colors.grey.shade300,
//                   borderColor: Colors.grey,
//                   lable: 'Address 1,Address, ...',
//                   controller: address,
//                 ),
//               ),
//             ]),
//             SizedBox(height: screenHeight * 0.015),
//             CustomTextField(
//               display: display,
//               filledColor: Colors.grey.shade300,
//               borderColor: Colors.grey,
//               maxLines: 4,
//               lable: 'Diagnosis',
//               controller: diagnosis,
//             ),
//             SizedBox(height: screenHeight * 0.015),
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               Container(
//                 width: screenWidth / 3.045,
//                 child: CustomTextField(
//                   display: display,
//                   filledColor: Colors.grey.shade300,
//                   borderColor: Colors.grey,
//                   lable: 'Estimate Charges',
//                   controller: estimateCharges,
//                 ),
//               ),
//               Container(
//                 width: screenWidth / 3.045,
//                 child: CustomTextField(
//                   display: display,
//                   filledColor: Colors.grey.shade300,
//                   borderColor: Colors.grey,
//                   lable: 'Outstanding',
//                   controller: outstanding,
//                 ),
//               ),
//             ]),
//             SizedBox(height: screenHeight * 0.09),
//             Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
//               Visibility(
//                 visible: widget.selectedIndex == 1 || widget.selectedIndex == 2
//                     ? false
//                     : true,
//                 child: BottomGestureButton(
//                   text: "CANCEL",
//                   // selectedIndexRow: widget.selectedIndexRow,
//                   // textColor: Colors.white,
//                   textColor: Colors.black,
//
//                   color: Colors.transparent,
//                 ),
//               ),
//               BottomGestureButton(
//                 topbarbutton:
//                     widget.selectedIndex == 1 || widget.selectedIndex == 2
//                         ? true
//                         : false,
//                 selectedIndexRow: widget.selectedIndex,
//                 textColor: Colors.white,
//                 text: "GO TO WORKSHOP",
//                 navigationFunction: navigationFunction,
//                 color: floatingButtonColor,
//               ),
//             ]),
//             SizedBox(
//               height: 20,
//             )
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget TextFieldFunction(String label, TextEditingController controller) {
//     return SizedBox(
//       child: CustomTextField(
//         // display: display,
//         lable: label,
//         controller: controller,
//       ),
//     );
//   }
//
//   showPopup(BuildContext context, bool? text, int? index) {
//     // text == false ? editInitialSetupFunction(index) : clearAllControllers();
//     final Size size = MediaQuery.of(context).size;
//     var screenWidth = MediaQuery.of(context).size.width;
//     var screenHeight = MediaQuery.of(context).size.height;
//     bool? popup1 = true;
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Theme(
//           data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
//           child: AlertDialog(
//             backgroundColor: appBackGroundColor,
//             surfaceTintColor: Colors.transparent,
//             shape: const RoundedRectangleBorder(
//               borderRadius: BorderRadius.all(Radius.circular(8.0)),
//             ),
//             content: SingleChildScrollView(
//               child: Container(
//                 // width: screenWidth/52,
//                 // height: screenHeight/2,
//                 child: Column(
//                   children: [
//                     Center(
//                       child: Text(
//                         "EDIT JOB ORDER",
//                         style: TextStyle(
//                             fontWeight: FontWeight.bold, color: Colors.black),
//                       ),
//                     ),
//                     SizedBox(height: screenHeight * 0.02),
//                     SizedBox(
//                         width: screenWidth / 2.5,
//                         height: screenHeight / 18,
//                         child: TextFieldFunction("Salesman", salesman)),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     SizedBox(
//                         width: screenWidth / 2.5,
//                         height: screenHeight / 18,
//                         child: TextFieldFunction("Phone Code", phoneCode)),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SizedBox(
//                             height: screenHeight / 18,
//                             width: (screenWidth / 2.5) / 2.05,
//                             child: DatePickerExample(
//                                 label: "Receive Date", key: textFieldsDate2),
//                           ),
//                           SizedBox(
//                             height: screenHeight / 18,
//                             width: (screenWidth / 2.5) / 2.05,
//                             child: DatePickerExample(
//                                 label: "Deliver Date", key: textFieldsDate1),
//                           ),
//                         ]),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     SizedBox(
//                         width: screenWidth / 2.5,
//                         height: screenHeight / 18,
//                         child:
//                             TextFieldFunction("Mobile Number", mobileNumber)),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     SizedBox(
//                         width: screenWidth / 2.5,
//                         height: screenHeight / 18,
//                         child:
//                             TextFieldFunction("Driver Details", driverDetails)),
//                     SizedBox(height: 5),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Container(
//                             // padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
//                             height: screenHeight / 18,
//                             width: (screenWidth / 2.5) / 2.05,
//                             decoration: BoxDecoration(
//                               color: Colors
//                                   .transparent, // Set your desired background color here
//                               border: Border.all(
//                                   color: textBorderColor,
//                                   width: 1), // Border color
//                               borderRadius:
//                                   BorderRadius.circular(5), // Rounded corners
//                             ),
//                             child: DropdownButtonFormField<String>(
//                               decoration: const InputDecoration(
//                                 border: InputBorder.none,
//                                 hintText: "Select",
//                                 contentPadding: EdgeInsets.only(
//                                     bottom: 16, left: 23, right: 10),
//                               ),
//                               focusColor: Colors.transparent,
//                               value: selectBikeList,
//                               dropdownColor: Colors.white,
//                               items: bikeList,
//                               onSaved: (String? itemChosen) {
//                                 setState(() {
//                                   selectBikeList = itemChosen!;
//                                 });
//                               },
//                               onChanged: (String? value) {
//                                 setState(() {
//                                   selectBikeList = value!;
//                                 });
//                               },
//                             ),
//                           ),
//                           GestureDetector(
//                             onTap: () {},
//                             child: Container(
//                               height: screenHeight / 18,
//                               width: (screenWidth / 2.5) / 2.05,
//                               decoration: BoxDecoration(
//                                 border: Border.all(
//                                   color: redBorder, // Set the border color
//                                   width: 1, // Set the border width
//                                 ),
//                                 color: redBorder.withOpacity(
//                                     0.1), // Background color with 50% opacity
//                                 borderRadius: BorderRadius.circular(
//                                     5), // Optional: Rounded corners
//                               ),
//                               child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Container(
//                                     margin: EdgeInsets.only(right: 20),
//                                     // color: Colors.,
//                                     width: 25.0, // Width of the square
//                                     height: 25.0,
//                                     child: SvgPicture.asset(
//                                       'assets/Icons/location.svg',
//                                       // Replace with your SVG asset path
//                                       fit: BoxFit
//                                           .contain, // Adjusts SVG size within the square
//                                     ),
//                                   ),
//                                   Center(
//                                     child: Text(
//                                       "Pickup Location", // Button text
//                                       style: TextStyle(
//                                         color: redBorder, // Text color
//                                         fontSize: 14, // Text size
//                                         fontWeight:
//                                             FontWeight.bold, // Text style
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           )
//                         ]),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     SizedBox(
//                       // height: screenHeight/6,
//                       width: screenWidth / 2.5,
//                       child: CustomTextField(
//                         filledColor: Colors.grey.shade300,
//                         borderColor: Colors.grey,
//                         maxLines: 3,
//                         lable: 'Diagnosis',
//                         controller: diagnosis,
//                       ),
//                     ),
//                     SizedBox(
//                       height: 5,
//                     ),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SizedBox(
//                             height: screenHeight / 18,
//                             width: (screenWidth / 2.5) / 2.05,
//                             child: CustomTextField(
//                               filledColor: Colors.grey.shade300,
//                               borderColor: Colors.grey,
//                               lable: 'Estimate Charges',
//                               controller: estimateCharges,
//                             ),
//                           ),
//                           SizedBox(
//                             height: screenHeight / 18,
//                             width: (screenWidth / 2.5) / 2.05,
//                             child: CustomTextField(
//                               popup: popup1,
//                               filledColor: Colors.grey.shade300,
//                               borderColor: Colors.grey,
//                               lable: 'Outstanding',
//                               controller: outstanding,
//                             ),
//                           ),
//                         ]),
//                     SizedBox(height: 5),
//                     SizedBox(
//                       width: screenWidth / 2.5,
//                       height: screenHeight / 18,
//                       child: GestureDetector(
//                         onTap: () {
//                           Item updatedItem = Item(
//                             salesman: salesman.text,
//                             // receiveDate: receiveDateController.text,
//                             // deliverDate: deliverDateController.text,
//                           );
//
//                           // Call the onEdit function to update the item
//                           widget.onEdit(updatedItem);
//
//                           Navigator.of(context).pop();
//                         },
//                         child: Container(
//                             height: 50,
//                             // width: widget.popup == true ? 100 : 0,
//                             width: size.width / 1.45,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color:
//                                     floatingButtonColor, // Set your desired border color here
//                                 width: 1, // Set the width of the border
//                               ),
//                               color: floatingButtonColor,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
//                             child: Center(
//                                 child: Text(
//                               text == false ? "UPDATE" : "ADD",
//                               style: TextStyle(color: Colors.white),
//                             ))),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
//
//   nextPopup(BuildContext context) {
//     var screenWidth = MediaQuery.of(context).size.width;
//     var screenHeight = MediaQuery.of(context).size.height;
//
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Theme(
//           data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
//           child: Stack(
//             children: [
//               AlertDialog(
//                 backgroundColor: appBackGroundColor,
//                 surfaceTintColor: Colors.transparent,
//                 shape: const RoundedRectangleBorder(
//                   borderRadius: BorderRadius.all(Radius.circular(8.0)),
//                 ),
//                 title: Text(
//                   "ADD CUSTOMER",
//                   style: TextStyle(
//                       color: floatingButtonColor,
//                       fontSize: 14,
//                       fontWeight: FontWeight.bold),
//                 ),
//                 content: SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Container(
//                         width: screenWidth / 3.045,
//                         child: CustomTextField(
//                           filledColor: Colors.grey.shade300,
//                           borderColor: Colors.grey,
//                           lable: 'Name',
//                           controller: name,
//                         ),
//                       ),
//                       SizedBox(height: 6),
//                       Container(
//                         width: screenWidth / 3.045,
//                         child: CustomTextField(
//                           filledColor: Colors.grey.shade300,
//                           borderColor: Colors.grey,
//                           lable: 'Phone Number',
//                           controller: phoneNumber,
//                         ),
//                       ),
//                       SizedBox(height: 6),
//                       Container(
//                         width: screenWidth / 3.045,
//                         child: CustomTextField(
//                           filledColor: Colors.grey.shade300,
//                           borderColor: Colors.grey,
//                           lable: 'Email',
//                           controller: email,
//                         ),
//                       ),
//                       SizedBox(height: 6),
//                       Container(
//                         width: screenWidth / 3.045,
//                         child: CustomTextField(
//                           filledColor: Colors.grey.shade300,
//                           borderColor: Colors.grey,
//                           lable: 'Vat',
//                           controller: vat,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       Container(
//                         width: screenWidth / 3.045,
//                         child: CustomTextField(
//                           filledColor: Colors.grey.shade300,
//                           borderColor: Colors.grey,
//                           lable: 'Address',
//                           controller: address,
//                         ),
//                       ),
//                       SizedBox(height: 10),
//                       GestureDetector(
//                         onTap: () => {Navigator.pop(context)},
//                         child: Container(
//                             height: 50,
//                             width: screenWidth / 3.045,
//                             decoration: BoxDecoration(
//                               border: Border.all(
//                                 color:
//                                     floatingButtonColor, // Set your desired border color here
//                                 width: 1, // Set the width of the border
//                               ),
//                               color: floatingButtonColor,
//                               borderRadius: BorderRadius.circular(10),
//                             ),
//                             child: Center(
//                                 child: Text(
//                               "SAVE",
//                               style: TextStyle(color: Colors.white),
//                             ))),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               Container(
//                 // color: appBackGroundColor,
//                 // margin: EdgeInsets.only(
//                 //     left: screenWidth / 1.5, top: screenHeight / 7.95),
//                 child: IconButton(
//                   icon: SvgPicture.asset(
//                     'assets/Icons/cross.svg', // Update this path to your SVG file
//                     // width: 25,
//                     // height: 25,
//                     color: Colors.black, // You can change the color if needed
//                   ),
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   navigationFunction() async {
//     await Navigator.push(
//       context,
//       MaterialPageRoute(
//           builder: (context) => Workshopscreen(
//                 topbarbutton:
//                     widget.selectedIndex == 1 || widget.selectedIndex == 2
//                         ? true
//                         : false,
//               )),
//     );
//   }
// }
