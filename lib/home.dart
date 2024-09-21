import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hussainbikewebapp/utils/colors.dart';
import 'package:hussainbikewebapp/widget/RowGesturebutton.dart';
import 'package:hussainbikewebapp/widget/date_picker.dart';
import 'package:hussainbikewebapp/widget/gesturebutton.dart';
import 'package:flutter_svg/svg.dart';
import 'Textfield.dart';
import 'customer_screen1.dart';
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
  final TextEditingController address1 = TextEditingController();
  final textFieldsDate1 = GlobalKey<DatePickerExampleState>();
  final textFieldsDate2 = GlobalKey<DatePickerExampleState>();

  int selectedIndex = 0; // Track the selected screen index
  int selectedIndex1 = 0;
  int passingIndex = 0;

  List<DropdownMenuItem<String>> weekList = [];
  var selectWeek = '';

  List<DropdownMenuItem<String>> customerList = [];

  List<DropdownMenuItem<String>> bikeList = [];
  var selectBikeList = '';

  List<Item> items = [
    Item(
      name: 'Imman',
      salesman: 'John Doe',
      phoneCode: '+1',
      deliverDate: '20-09-2024',
      customer: 'Customer A',
      mobileNumber: '1234567890',
      driverDetails: 'Driver A',
      receiveDate: '2024-09-20',
      bikeNumber: 'Bike123',
      diagnosis: 'Diagnosis A',
      estimateCharges: '100',
      address: 'Address A',
      outstanding: '50',
      phoneNumber: '0987654321',
      email: 'email@example.com',
      vat: 'VAT123',
      address1: 'Address1 A',
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
    address1.clear();
  }

  void _onButtonTap(int index) {
    setState(() {
      selectedIndex = index;
    });
    setState(() {
      passingIndex = index;
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

    print('Item name: ${items[0].name}');

    super.initState();
  }

  var selectCustomer = '';

  addDatumFunction() {
    setState(() {
      items.add(Item(
        name: name.text,
        deliverDate: textFieldsDate1.currentState?.formattedDate.toString(),
        salesman: salesman.text,
        phoneCode: phoneCode.text,
        customer: selectCustomer.toString(),
        mobileNumber: mobileNumber.text,
        receiveDate: textFieldsDate2.currentState?.formattedDate.toString(),
        driverDetails: driverDetails.text,
        bikeNumber: selectBikeList.toString(),
        diagnosis: diagnosis.text,
        estimateCharges: estimateCharges.text,
        outstanding: outstanding.text,
        address: address.text,
        phoneNumber: phoneNumber.text,
        email: email.text,
        vat: vat.text,
        address1: address1.text,
      ));
    });
    Navigator.of(context).pop();
  }

  customerFilter() {
    customerList.add(
      DropdownMenuItem(
        value: "",
        child: Center(
          child: Text(
            'Customer 1',
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 14 // Color of the label text
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
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 14 // Color of the label text
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
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 14 // Color of the label text
                ),
          ),
        ),
      ),
    );
  }

  bikeNumberFilter() {
    bikeList.add(
      DropdownMenuItem(
        value: "",
        child: Center(
          child: Text(
            '5645',
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 14 // Color of the label text
                ),
          ),
        ),
      ),
    );
    bikeList.add(
      DropdownMenuItem(
        value: "1",
        child: Center(
          child: Text(
            '123',
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 14 // Color of the label text
                ),
          ),
        ),
      ),
    );
    bikeList.add(
      DropdownMenuItem(
        value: "2",
        child: Center(
          child: Text(
            "345",
            style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w300,
                fontSize: 14 // Color of the label text
                ),
          ),
        ),
      ),
    );
  }

  workerFilter() {
    weekList.add(
      const DropdownMenuItem(
        value: "",
        child: Center(
          child: Text(
            'week 1',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12, // Set font size to 20
              fontWeight: FontWeight.normal, // Set font weight to bold
            ),
          ),
        ),
      ),
    );
    weekList.add(
      const DropdownMenuItem(
        value: "1",
        child: Center(
          child: Text(
            'week 2',
            style: TextStyle(
              color: Colors.black,
              fontSize: 12, // Set font size to 20
              fontWeight: FontWeight.normal, // Set font weight to bold
            ),
          ),
        ),
      ),
    );
    weekList.add(
      const DropdownMenuItem(
        value: "2",
        child: Center(
          child: Text(
            "week 3",
            style: TextStyle(
              color: Colors.black,
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
          bottom: size.height * 0.05,
        ),
        child: SingleChildScrollView(
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
              Row(
                children: [
                  Container(
                    height: size.height / 0.8125,
                    color: homeScreenBackgroundContainerColor,
                    margin: const EdgeInsets.only(top: 30),
                    child: SingleChildScrollView(
                      child: Column(children: [
                        Visibility(
                          visible: selectedIndex == 0 || selectedIndex == 2
                              ? false
                              : true,
                          child: Padding(
                            padding: EdgeInsets.only(left: size.width / 88),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  GestureDetector(
                                      onTap: () async {},
                                      child: Container(
                                        width: 50,
                                        height: 30,
                                        margin:
                                            EdgeInsets.only(top: 6, left: 0),
                                        // padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        child: Center(
                                          child: const Text(
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
                                        margin:
                                            EdgeInsets.only(top: 6, left: 0),
                                        // padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(0),
                                        ),
                                        child: Center(
                                          child: const Text(
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
                                        margin:
                                            EdgeInsets.only(top: 6, left: 0),
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
                                      margin: EdgeInsets.only(top: 6, left: 0),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            25), // Set border radius here
                                      ),
                                      height: 30,
                                      child: DropdownButton(
                                        dropdownColor: Colors.grey.shade100,
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
                                      margin: EdgeInsets.only(top: 6, left: 0),
                                      child: Image.asset(
                                        'assets/Icons/excell.png', // Replace with your PNG asset path
                                        width: 50.0, // Set width as needed
                                        height: 50.0, // Set height as needed
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
                                  milliseconds: 300), // Duration for animation
                              width: selectedIndex1 == index
                                  ? 320
                                  : 300, // Increase width for selected container
                              margin: EdgeInsets.only(
                                left: 10,
                                top: index == 0
                                    ? (selectedIndex == 0 || selectedIndex == 2
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
                                        child:
                                            Text(items[index].name.toString())),
                                    SizedBox(height: 5),
                                    Center(
                                        child: Text('Job Order ${index + 1}')),
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
                    flex: 8,
                    child: IndexedStack(
                      index: selectedIndex1,
                      children: [
                        for (int i = 0; i < items.length; i++)
                          CustomerScreen1(
                              showPopup: showPopup,
                              items: items,
                              index: i,
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
    Expanded(
      flex: 8,
      child: IndexedStack(
        index: selectedIndex1,
        children: [
          for (int i = 0; i < index!; i++)
            CustomerScreen1(
                showPopup: showPopup,
                items: items,
                index: index,
                selectedIndex: selectedIndex)
        ],
      ),
    );
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
    text == false ? editInitialSetupFunction(index) : clearAllControllers();
    final Size size = MediaQuery.of(context).size;
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    bool? popup = true;
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Theme(
          data: Theme.of(context).copyWith(dialogBackgroundColor: Colors.white),
          child: AlertDialog(
            backgroundColor: appBackGroundColor,
            surfaceTintColor: Colors.transparent,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: screenWidth * 0.28),
                          child: Text(
                            text == false ? "EDIT JOB ORDER" : 'NEW JOB ORDER',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          )),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.05),
                  const SizedBox(height: 16),
                  TextFieldFunction("Salesman", salesman),
                  SizedBox(height: screenHeight * 0.015),
                  TextFieldFunction("Phone Code", phoneCode),
                  SizedBox(height: screenHeight * 0.015),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: screenWidth / 2.95,
                          child: DatePickerExample(
                              label: "Receive Date", key: textFieldsDate2),
                        ),
                        SizedBox(
                          width: screenWidth / 2.95,
                          child: DatePickerExample(
                              label: "Deliver Date", key: textFieldsDate1),
                        ),
                      ]),
                  SizedBox(height: screenHeight * 0.015),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: screenHeight * 0.082,
                        width: screenWidth / 1.58,
                        margin: EdgeInsets.only(top: 6, left: 0),
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
                            contentPadding:
                                EdgeInsets.symmetric(horizontal: 25),
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
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.only(top: 6, left: 0),
                          width: 50.0, // Width of the square
                          height: 50.0, // Height of the square
                          decoration: BoxDecoration(
                            border: Border.all(color: borderColor, width: 1),
                            color: Colors
                                .transparent, // Background color// Border color
                            borderRadius: BorderRadius.circular(
                                8), // Optional: Rounded corners
                          ),
                          child: Center(
                            child: InkWell(
                              onTap: () {
                                nextPopup(context);
                              },
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
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.015),
                  TextFieldFunction("Mobile Number", mobileNumber),
                  SizedBox(height: screenHeight * 0.015),
                  TextFieldFunction("Driver Details", driverDetails),
                  SizedBox(height: screenHeight * 0.015),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: screenHeight * 0.082,
                          width: screenWidth / 2.95,
                          margin: EdgeInsets.only(top: 2, left: 0),
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
                              contentPadding:
                                  EdgeInsets.symmetric(horizontal: 25),
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
                            margin: EdgeInsets.only(top: 2, left: 0),
                            height: screenHeight * 0.082,
                            width: screenWidth / 2.95,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: redBorder, // Set the border color
                                width: 1, // Set the border width
                              ),
                              color: redBorder.withOpacity(
                                  0.1), // Background color with 50% opacity
                              borderRadius: BorderRadius.circular(
                                  8), // Optional: Rounded corners
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
                                      fontSize: 16, // Text size
                                      fontWeight: FontWeight.bold, // Text style
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ]),
                  SizedBox(height: screenHeight * 0.015),
                  CustomTextField(
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
                            filledColor: Colors.grey.shade300,
                            borderColor: Colors.grey,
                            lable: 'Estimate Charges',
                            controller: estimateCharges,
                          ),
                        ),
                        Container(
                          width: screenWidth / 3.045,
                          child: CustomTextField(
                            filledColor: Colors.grey.shade300,
                            borderColor: Colors.grey,
                            lable: 'Outstanding',
                            controller: outstanding,
                          ),
                        ),
                      ]),
                  SizedBox(height: screenHeight * 0.09),
                  GestureDetector(
                    onTap: () =>
                        text == false ? editUpdate(index) : addDatumFunction(),
                    child: Container(
                        height: 50,
                        // width: widget.popup == true ? 100 : 0,
                        width: size.width / 1.45,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color:
                                floatingButtonColor, // Set your desired border color here
                            width: 1, // Set the width of the border
                          ),
                          color: floatingButtonColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        // padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                        child: Center(
                            child: Text(
                          text == false ? "UPDATE" : "ADD",
                          style: TextStyle(color: Colors.white),
                        ))),
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
                backgroundColor: appBackGroundColor,
                surfaceTintColor: Colors.transparent,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8.0)),
                ),
                title: Text(
                  "ADD CUSTOMER",
                  style: TextStyle(
                      color: floatingButtonColor,
                      fontSize: 14,
                      fontWeight: FontWeight.bold),
                ),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: screenWidth / 3.045,
                        child: CustomTextField(
                          filledColor: Colors.grey.shade300,
                          borderColor: Colors.grey,
                          lable: 'Name',
                          controller: name,
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        width: screenWidth / 3.045,
                        child: CustomTextField(
                          filledColor: Colors.grey.shade300,
                          borderColor: Colors.grey,
                          lable: 'Phone Number',
                          controller: phoneNumber,
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        width: screenWidth / 3.045,
                        child: CustomTextField(
                          filledColor: Colors.grey.shade300,
                          borderColor: Colors.grey,
                          lable: 'Email',
                          controller: email,
                        ),
                      ),
                      SizedBox(height: 6),
                      Container(
                        width: screenWidth / 3.045,
                        child: CustomTextField(
                          filledColor: Colors.grey.shade300,
                          borderColor: Colors.grey,
                          lable: 'Vat',
                          controller: vat,
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        width: screenWidth / 3.045,
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
                            height: 50,
                            width: screenWidth / 3.045,
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
                              "SAVE",
                              style: TextStyle(color: Colors.white),
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
