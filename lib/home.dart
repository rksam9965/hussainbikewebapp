import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hussainbikewebapp/responsive.dart';
import 'package:hussainbikewebapp/utils/colors.dart';
import 'package:hussainbikewebapp/widget/RowGesturebutton.dart';
import 'package:hussainbikewebapp/widget/date_picker.dart';
import 'package:hussainbikewebapp/widget/gesturebutton.dart';
import 'package:flutter_svg/svg.dart';
import 'Textfield.dart';
import 'side_screen.dart';
import 'datamodule/dummyData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  TextEditingController search = TextEditingController();
  final TextEditingController salesman = TextEditingController();
  final TextEditingController phoneCode = TextEditingController();
  final TextEditingController customer = TextEditingController();
  final TextEditingController deliveryDate = TextEditingController();

  final TextEditingController mobileNumber = TextEditingController();
  final TextEditingController receiveDate = TextEditingController();
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
  var textFieldsDate1 = GlobalKey<DatePickerExampleState>();
  var textFieldsDate2 = GlobalKey<DatePickerExampleState>();

  int selectedIndex = 0; // Track the selected screen index
  int selectedIndex1 = 0;
  int passingIndex = 0;

  List<DropdownMenuItem<String>> weekList = [];
  var selectWeek = 'week 1';

  List<DropdownMenuItem<String>> customerList = [];
  var selectCustomer = 'Customer 1';

  List<DropdownMenuItem<String>> bikeList = [];
  var selectBikeList = '123';

  List<Item> items = [
    Item(
      name: 'Imman',
      salesman: 'John Doe',
      phoneCode: '+1',
      deliverDate: '2024-09-20',
      receiveDate: '2024-09-24',
      customer: 'Customer A',
      mobileNumber: '1234567890',
      driverDetails: 'Driver A',
      bikeNumber: 'Bike123',
      diagnosis: 'Diagnosis A',
      estimateCharges: '100',
      address: 'Address A',
      outstanding: '50',
      phoneNumber: '0987654321',
      email: 'email@example.com',
      vat: 'VAT123',
      selectDriver: "123",
      selectCustomer: "Customer 2",
      selectWeek: "week 2",
    ),
    Item(
      name: 'Imman',
      salesman: 'John Doe',
      phoneCode: '+1',
      deliverDate: '2024-09-20',
      receiveDate: '2024-09-24',
      customer: 'Customer A',
      mobileNumber: '1234567890',
      driverDetails: 'Driver A',
      bikeNumber: 'Bike123',
      diagnosis: 'Diagnosis A',
      estimateCharges: '100',
      address: 'Address A',
      outstanding: '50',
      phoneNumber: '0987654321',
      email: 'email@example.com',
      vat: 'VAT123',
      selectDriver: "123",
      selectCustomer: "Customer 2",
      selectWeek: "week 2",
    )
  ];

  clearAllControllers() {
    salesman.clear();
    phoneCode.clear();
    customer.clear();
    mobileNumber.clear();
    receiveDate.clear();
    driverDetails.clear();
    bikeNumber.clear();
    diagnosis.clear();
    estimateCharges.clear();
    outstanding.clear();
    address.clear();
    name.clear();
    phoneNumber.clear();
    email.clear();
    vat.clear();
  }

  _onButtonTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    setState(() {
      passingIndex = index;
    });
  }

  onTab2() {
    setState(() {
      selectedIndex = 2;
    });
    setState(() {
      passingIndex = 2;
    });
  }

  onTab1() {
    setState(() {
      selectedIndex = 1;
    });
    setState(() {
      passingIndex = 1;
    });
  }

  void _onMenuItemTap(int index) {
    setState(() {
      selectedIndex1 = index;
    });
  }

  @override
  void initState() {
    workerFilter();
    customerFilter();
    bikeNumberFilter();
    super.initState();
  }

  addDatumFunction() {
    setState(() {
      items.add(Item(
        name: name.text,
        deliverDate: textFieldsDate1.currentState!.formattedDate,
        receiveDate: textFieldsDate2.currentState?.formattedDate,
        salesman: salesman.text,
        selectWeek: selectWeek.toString(),
        selectCustomer: selectCustomer.toString(),
        selectDriver: selectBikeList.toString(),
        phoneCode: phoneCode.text,
        customer: selectCustomer.toString(),
        mobileNumber: mobileNumber.text,
        driverDetails: driverDetails.text,
        bikeNumber: selectBikeList.toString(),
        diagnosis: diagnosis.text,
        estimateCharges: estimateCharges.text,
        outstanding: outstanding.text,
        address: address.text,
        phoneNumber: phoneNumber.text,
        email: email.text,
        vat: vat.text,
      ));
    });
    Navigator.of(context).pop();
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

  popUp() {
    Navigator.pop(context);
  }

  bool? isBack = true;
  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [];

    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    final Size size = MediaQuery.of(context).size;

    String path = "assets/Icons/addicon.svg";
    String path1 = "assets/Icons/backIcon.svg";

    return Scaffold(
      backgroundColor: appBackGroundColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: size.width * 0.02,
          right: size.width * 0.02,
          top: size.height * 0.05,
          bottom: size.height * 0.01,
        ),
        child: SingleChildScrollView(
          // physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    height: 50,
                    width: size.width / 1.4,
                    child: _buildSearchController(),
                  ),
                  SizedBox(width: size.width * 0.01),
                  GestureButton(
                      imagePath: path,
                      showPopup: showPopup,
                      selectCustomer: selectCustomer),
                  SizedBox(width: size.width * 0.01),
                  GestureButton(popUp: popUp, imagePath: path1, logout: isBack),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomButton(
                    Maxwidth: size.width / 3.2,
                    text: "ON-GOING",
                    isSelected: selectedIndex == 0,
                    borderColor: redButtonColor,
                    onTap: () => _onButtonTap(0),
                  ),
                  SizedBox(width: size.width * 0.01),
                  CustomButton(
                    Maxwidth: size.width / 3.2,
                    text: "COMPLETED",
                    newchange: selectedIndex,
                    isSelected: selectedIndex == 1,
                    borderColor: redButtonColor,
                    onTap: () => _onButtonTap(1),
                  ),
                  SizedBox(width: size.width * 0.01),
                  CustomButton(
                    Maxwidth: size.width / 3.2,
                    text: "CANCELLED",
                    isSelected: selectedIndex == 2,
                    borderColor: redButtonColor,
                    onTap: () => _onButtonTap(2),
                  ),
                ],
              ),
              Responsive.isTablet(context)
                  ? Row(
                      children: [
                        Container(
                          // / 4.067
                          // width: screenWidth / 4.067,
                          height: Responsive.isTablet(context)
                              ? size.height / 1.2
                              : size.height / 0.8125,
                          color: homeScreenBackgroundContainerColor,
                          margin: const EdgeInsets.only(top: 20),
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Visibility(
                                visible:
                                    selectedIndex == 0 || selectedIndex == 2
                                        ? false
                                        : true,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width / 88),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                            onTap: () async {},
                                            child: Container(
                                              width: 45,
                                              height: 30,
                                              margin: EdgeInsets.only(
                                                  top: 6, left: 0),
                                              // padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Week',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            )),
                                        GestureDetector(
                                            onTap: () async {},
                                            child: Container(
                                              width: 45,
                                              height: 30,
                                              margin: EdgeInsets.only(
                                                  top: 6, left: 0),
                                              // padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Month',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            )),
                                        GestureDetector(
                                            onTap: () async {},
                                            child: Container(
                                              width: 45,
                                              height: 30,
                                              margin: EdgeInsets.only(
                                                  top: 6, left: 0),
                                              // padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Year',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            )),
                                        Container(
                                            width: 80,
                                            margin: EdgeInsets.only(
                                                top: 6, left: 0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  25), // Set border radius here
                                            ),
                                            height: 30,
                                            child: DropdownButton(
                                              dropdownColor:
                                                  Colors.grey.shade100,
                                              hint: const Center(
                                                child: Text(
                                                  "Select",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight
                                                        .normal, // Set font weight to bold
                                                  ),
                                                ),
                                              ),
                                              underline: SizedBox(),
                                              isExpanded: true,
                                              items: weekList,
                                              onChanged: (String? itemChosen) {
                                                setState(() {
                                                  selectWeek = itemChosen!;
                                                });
                                              },
                                              value: selectWeek,
                                            )),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: 6, left: 0),
                                            child: Image.asset(
                                              'assets/Icons/excell.png', // Replace with your PNG asset path
                                              width:
                                                  50.0, // Set width as needed
                                              height:
                                                  50.0, // Set height as needed
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              for (int index = 0; index < items.length; index++)
                                InkWell(
                                  onDoubleTap: () {
                                    // deleteItem(index);
                                  },
                                  onTap: () => _onMenuItemTap(index),
                                  child: AnimatedContainer(
                                    // Use AnimatedContainer for smooth transitions
                                    duration: const Duration(
                                        milliseconds:
                                            300), // Duration for animation
                                    width: selectedIndex1 == index
                                        ? 270
                                        : 250, // Increase width for selected container
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: index == 0
                                          ? (selectedIndex == 0 ||
                                                  selectedIndex == 2
                                              ? 80
                                              : 30)
                                          : 10,
                                      bottom: 10,
                                      right: selectedIndex1 == index
                                          ? 0
                                          : 8, // Right margin 0 for selected index
                                    ),
                                    height: screenHeight / 5,
                                    decoration: BoxDecoration(
                                      color: selectedIndex1 == index
                                          ? homeScreenContainerColor
                                          : newContainerColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Center(
                                            child: Text(
                                                items[index].name.toString())),
                                        SizedBox(height: 5),
                                        Center(
                                            child:
                                                Text('Job Order ${index + 1}')),
                                        SizedBox(height: 5),
                                        Center(
                                            child: Text(items[index]
                                                .receiveDate
                                                .toString())),
                                        SizedBox(height: 5),
                                        Center(
                                            child: Text(items[index]
                                                .deliverDate
                                                .toString())),
                                      ],
                                    ),
                                  ),
                                ),
                            ]),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IndexedStack(
                            index: selectedIndex1,
                            children: [
                              for (int i = 0; i < items.length; i++)
                                CustomerScreen1(
                                    ontab: onTab2,
                                    ontab1: onTab1,
                                    showPopup: showPopup,
                                    items: items,
                                    index: i,
                                    onEdit: (updatedItem) {
                                      _editItem(i, updatedItem);
                                    },
                                    selectedIndex: selectedIndex)
                            ],
                          ),
                        ),
                      ],
                    )
                  : Row(
                      children: [
                        Container(
                          // / 4.067
                          // width: screenWidth / 4.067,
                          height: size.height / 0.8125,
                          color: homeScreenBackgroundContainerColor,
                          margin: const EdgeInsets.only(top: 30),
                          child: SingleChildScrollView(
                            child: Column(children: [
                              Visibility(
                                visible:
                                    selectedIndex == 0 || selectedIndex == 2
                                        ? false
                                        : true,
                                child: Padding(
                                  padding:
                                      EdgeInsets.only(left: size.width / 88),
                                  child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                            onTap: () async {},
                                            child: Container(
                                              width: 50,
                                              height: 30,
                                              margin: EdgeInsets.only(
                                                  top: 6, left: 0),
                                              // padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Week',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            )),
                                        GestureDetector(
                                            onTap: () async {},
                                            child: Container(
                                              width: 50,
                                              height: 30,
                                              margin: EdgeInsets.only(
                                                  top: 6, left: 0),
                                              // padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Month',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            )),
                                        GestureDetector(
                                            onTap: () async {},
                                            child: Container(
                                              width: 50,
                                              height: 30,
                                              margin: EdgeInsets.only(
                                                  top: 6, left: 0),
                                              // padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(0),
                                              ),
                                              child: const Center(
                                                child: Text(
                                                  'Year',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            )),
                                        Container(
                                            width: 100,
                                            margin: EdgeInsets.only(
                                                top: 6, left: 0),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(
                                                  25), // Set border radius here
                                            ),
                                            height: 30,
                                            child: DropdownButton(
                                              dropdownColor:
                                                  Colors.grey.shade100,
                                              hint: const Center(
                                                child: Text(
                                                  "Select",
                                                  style: TextStyle(
                                                    fontSize: 11,
                                                    color: Colors.black,
                                                    fontWeight: FontWeight
                                                        .normal, // Set font weight to bold
                                                  ),
                                                ),
                                              ),
                                              underline: SizedBox(),
                                              isExpanded: true,
                                              items: weekList,
                                              onChanged: (String? itemChosen) {
                                                setState(() {
                                                  selectWeek = itemChosen!;
                                                });
                                              },
                                              value: selectWeek,
                                            )),
                                        GestureDetector(
                                          onTap: () {},
                                          child: Container(
                                            margin: EdgeInsets.only(
                                                top: 6, left: 0),
                                            child: Image.asset(
                                              'assets/Icons/excell.png', // Replace with your PNG asset path
                                              width:
                                                  50.0, // Set width as needed
                                              height:
                                                  50.0, // Set height as needed
                                            ),
                                          ),
                                        ),
                                      ]),
                                ),
                              ),
                              for (int index = 0; index < items.length; index++)
                                InkWell(
                                  onDoubleTap: () {
                                    // deleteItem(index);
                                  },
                                  onTap: () => _onMenuItemTap(index),
                                  child: AnimatedContainer(
                                    // Use AnimatedContainer for smooth transitions
                                    duration: const Duration(
                                        milliseconds:
                                            300), // Duration for animation
                                    width: selectedIndex1 == index
                                        ? 320
                                        : 300, // Increase width for selected container
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      top: index == 0
                                          ? (selectedIndex == 0 ||
                                                  selectedIndex == 2
                                              ? 80
                                              : 30)
                                          : 10,
                                      bottom: 10,
                                      right: selectedIndex1 == index
                                          ? 0
                                          : 8, // Right margin 0 for selected index
                                    ),
                                    height: screenHeight / 4.5,
                                    decoration: BoxDecoration(
                                      color: selectedIndex1 == index
                                          ? homeScreenContainerColor
                                          : newContainerColor,
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.only(top: 20),
                                      child: Column(
                                        children: [
                                          Center(
                                              child: Text(items[index]
                                                  .name
                                                  .toString())),
                                          SizedBox(height: 5),
                                          Center(
                                              child: Text(
                                                  'Job Order ${index + 1}')),
                                          SizedBox(height: 5),
                                          Center(
                                              child: Text(items[index]
                                                  .receiveDate
                                                  .toString())),
                                          SizedBox(height: 5),
                                          Center(
                                              child: Text(items[index]
                                                  .deliverDate
                                                  .toString())),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                            ]),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IndexedStack(
                            index: selectedIndex1,
                            children: [
                              for (int i = 0; i < items.length; i++)
                                CustomerScreen1(
                                    ontab: onTab2,
                                    ontab1: onTab1,
                                    // selectedIndex1:selectedIndex1
                                    showPopup: showPopup,
                                    items: items,
                                    index: i,
                                    onEdit: (updatedItem) {
                                      _editItem(i, updatedItem);
                                    },
                                    selectedIndex: selectedIndex)
                            ],
                          ),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }

  kk(updatedItem) {
    for (int i = 0; i < items.length; i++) {
      _editItem(i, updatedItem);
    }
  }

  void _editItem(int index, Item newItem) {
    setState(() {
      items[index] = newItem; // Update the item in the list
    });
  }

  editInitialSetupFunction(int? index) {
    setState(() {
      // for (int i = 0; i < items.length; i++) {
      salesman.text = items[index!].salesman.toString();
      // phoneCode.text = items[i].phoneCode.toString();
      // customer.text = items[i].customer.toString();
      // mobileNumber.text = items[i].mobileNumber.toString();
      // receiveDate.text = items[i].receiveDate.toString();
      // driverDetails.text = items[i].deliverDate.toString();
      // bikeNumber.text = items[i].bikeNumber.toString();
      // diagnosis.text = items[i].diagnosis.toString();
      // estimateCharges.text = items[i].estimateCharges.toString();
      // outstanding.text = items[i].outstanding.toString();
      // address.text = items[i].address1.toString();
      // }
    });
  }

  editUpdate(int? index) {
    setState(() {
      // for (int i = 0; i < items.length; i++) {
      items[index!].salesman = salesman.text;
      // phoneCode.text = items[i].phoneCode.toString();
      // customer.text = items[i].customer.toString();
      // mobileNumber.text = items[i].mobileNumber.toString();
      // receiveDate.text = items[i].receiveDate.toString();
      // driverDetails.text = items[i].deliverDate.toString();
      // bikeNumber.text = items[i].bikeNumber.toString();
      // diagnosis.text = items[i].diagnosis.toString();
      // estimateCharges.text = items[i].estimateCharges.toString();
      // outstanding.text = items[i].outstanding.toString();
      // address.text = items[i].address1.toString();
      // }
    });

    // CustomerScreen1(
    //     showPopup: showPopup,
    //     items: items,
    //     index: index,
    //     selectedIndex: selectedIndex);
    Navigator.pop(context);
  }

  Widget _buildSearchController() {
    return TextField(
      controller: search,
      onChanged: (value) {},
      cursorColor: Colors.black,
      style: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        prefixIcon: IconButton(
          icon: Icon(Icons.search),
          onPressed: () {},
        ),
        suffixIcon: IconButton(
          icon: Icon(Icons.arrow_forward),
          onPressed: () {},
        ),
        filled: true,
        fillColor: Colors.transparent,
        border: InputBorder.none,
        hintText: 'Search',
        hintStyle: const TextStyle(
          fontWeight: FontWeight.w300,
          color: Colors.black,
          fontSize: 14,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14.0),
          borderSide: BorderSide(
            color: borderColor,
          ),
        ),
      ),
    );
  }

  deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }

  showPopup(BuildContext context, bool? text, int? index) {
    final Size size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    bool? popup1 = true;
    bool? ddd = true;
    clearAllControllers();
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
              child: Responsive.isTablet(context)
                  ? Column(
                      children: [
                        const Center(
                          child: Text(
                            'NEW JOB ORDER',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13),
                          ),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                            width: screenWidth / 2.5,
                            height: screenHeight / 18,
                            child: TextFieldFunction("Salesman", salesman)),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                            width: screenWidth / 2.5,
                            height: screenHeight / 18,
                            child: TextFieldFunction("Phone Code", phoneCode)),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: screenHeight / 18,
                                width: (screenWidth / 2.5) / 2.05,
                                child: DatePickerExample(
                                    ddd: ddd,
                                    label: "Receive Date",
                                    key: textFieldsDate2),
                              ),
                              SizedBox(width: (screenWidth / 2.5) / 39),
                              SizedBox(
                                height: screenHeight / 18,
                                width: (screenWidth / 2.5) / 2.05,
                                child: DatePickerExample(
                                    ddd: ddd,
                                    label: "Deliver Date",
                                    key: textFieldsDate1),
                              ),
                            ]),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: screenHeight / 18,
                              // width: screenWidth / 2.5,

                              width: (screenWidth / 2.5) / 1.18,
                              decoration: BoxDecoration(
                                color: Colors
                                    .transparent, // Set your desired background color here
                                border: Border.all(
                                    color: textBorderColor,
                                    width: 1), // Border color
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
                            // SizedBox(width: (screenWidth / 2.5) / 30),
                            GestureDetector(
                              onTap: () {
                                nextPopup(context);
                              },
                              child: Container(
                                height: screenHeight / 18,
                                width: 40,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: textBorderColor, width: 1),
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
                                      // Replace with your SVG asset path
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
                                "Mobile Number", mobileNumber)),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                            width: screenWidth / 2.5,
                            height: screenHeight / 18,
                            child: TextFieldFunction(
                                "Driver Details", driverDetails)),
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
                                  border: Border.all(
                                      color: textBorderColor, width: 1),
                                  // Border color
                                  borderRadius: BorderRadius.circular(
                                      5), // Rounded corners
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
                                        width: 25.0, // Width of the square
                                        height: 25.0,
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
                                            fontWeight:
                                                FontWeight.bold, // Text style
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
                          // height: screenHeight/6,
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
                        SizedBox(height: 5),
                        SizedBox(
                          width: screenWidth / 2.5,
                          height: screenHeight / 18,
                          child: GestureDetector(
                            onTap: () {
                              addDatumFunction();
                            },
                            child: Container(
                                height: 50,
                                width: size.width / 1.45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        floatingButtonColor, // Set your desired border color here
                                    width: 1, // Set the width of the border
                                  ),
                                  color: floatingButtonColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                child: Center(
                                    child: Text(
                                  "ADD",
                                  style: TextStyle(color: Colors.white),
                                ))),
                          ),
                        ),
                      ],
                    )
                  : Column(
                      children: [
                        const Center(
                          child: Text(
                            'NEW JOB ORDER',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 13),
                          ),
                        ),
                        SizedBox(height: 5),
                        SizedBox(
                            width: screenWidth / 2.5,
                            height: screenHeight / 18,
                            child: TextFieldFunction("Salesman", salesman)),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                            width: screenWidth / 2.5,
                            height: screenHeight / 18,
                            child: TextFieldFunction("Phone Code", phoneCode)),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                height: screenHeight / 18,
                                width: (screenWidth / 2.5) / 2.05,
                                child: DatePickerExample(
                                    ddd: ddd,
                                    label: "Receive Date",
                                    key: textFieldsDate2),
                              ),
                              SizedBox(
                                height: screenHeight / 18,
                                width: (screenWidth / 2.5) / 2.05,
                                child: DatePickerExample(
                                    ddd: ddd,
                                    label: "Deliver Date",
                                    key: textFieldsDate1),
                              ),
                            ]),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: screenHeight / 18,
                              // width: screenWidth / 2.5,

                              width: (screenWidth / 2.5) / 1.11,
                              decoration: BoxDecoration(
                                color: Colors
                                    .transparent, // Set your desired background color here
                                border: Border.all(
                                    color: textBorderColor,
                                    width: 1), // Border color
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
                                width: 50,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: textBorderColor, width: 1),
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
                                      // Replace with your SVG asset path
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
                                "Mobile Number", mobileNumber)),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                            width: screenWidth / 2.5,
                            height: screenHeight / 18,
                            child: TextFieldFunction(
                                "Driver Details", driverDetails)),
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
                                  border: Border.all(
                                      color: textBorderColor, width: 1),
                                  // Border color
                                  borderRadius: BorderRadius.circular(
                                      5), // Rounded corners
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
                                        width: 25.0, // Width of the square
                                        height: 25.0,
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
                                            fontWeight:
                                                FontWeight.bold, // Text style
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
                          // height: screenHeight/6,
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
                        SizedBox(height: 5),
                        SizedBox(
                          width: screenWidth / 2.5,
                          height: screenHeight / 18,
                          child: GestureDetector(
                            onTap: () {
                              addDatumFunction();
                            },
                            child: Container(
                                height: 50,
                                width: size.width / 1.45,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color:
                                        floatingButtonColor, // Set your desired border color here
                                    width: 1, // Set the width of the border
                                  ),
                                  color: floatingButtonColor,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                                child: Center(
                                    child: Text(
                                  "ADD",
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
                title: Text(
                  "ADD CUSTOMER",
                  style: TextStyle(
                      color: floatingButtonColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                color:
                                    floatingButtonColor, // Set your desired border color here
                                width: 1, // Set the width of the border
                              ),
                              color: floatingButtonColor,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Center(
                                child: Text(
                              "SAVE",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
                            ))),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                // color: appBackGroundColor,
                // margin: EdgeInsets.only(
                //     left: screenWidth / 1.5, top: screenHeight / 7.95),
                child: IconButton(
                  icon: SvgPicture.asset(
                    'assets/Icons/cross.svg', // Update this path to your SVG file
                    // width: 25,
                    // height: 25,
                    color: Colors.black, // You can change the color if needed
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
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
