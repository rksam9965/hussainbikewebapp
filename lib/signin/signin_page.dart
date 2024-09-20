import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hussainbikewebapp/signin/signin_content_view.dart';
import 'package:hussainbikewebapp/signin/signin_text_field.dart';
import '../../utils/colors.dart';
import '../../utils/custom_alert.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  SignInPageState createState() => SignInPageState();
}

class SignInPageState extends State<SignInPage> {
  final textFieldsKey = GlobalKey<SignInTextFieldState>();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Container(
      color: appBackGroundColor,
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: true,
          backgroundColor: appBackGroundColor,
          body: Stack(
            children: [
              SignInContentView(
                validateSignIn: validateSignIn,
                textFieldsKey: textFieldsKey,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateSignIn() {
    if (textFieldsKey.currentState!.userName.text == '') {
      displayAlert(context, GlobalKey(), 'Please enter a user name');
    } else {
      submitSignInData();
    }
  }

  String? username;
  String? profileLink;
  String? localId;

  Future<void> submitSignInData() async {
    // var jsonData = getSigninData();
    // displayProgress(context);
    // fetchRegisterTicket(jsonData).then((Authenticate authenticateData) {
    //   hideProgress(context);
    //   if (authenticateData.accessToken!.isNotEmpty) {
    //     bool? isadmin = authenticateData.isAdmin;
    //     username = authenticateData.username;
    //     profileLink = authenticateData.profileLink;
    //     localId = authenticateData.id.toString();
    //     createUser(isadmin);
    //     pushToHomePage();
    //   } else {
    //     displayAlert(context, GlobalKey(), '');
    //     if (authenticateData.accessToken!.isEmpty) {
    //       Future.delayed(Duration(milliseconds: 800), () {
    //         hideProgress(context);
    //         popWindow();
    //       });
    //     }
    //   }
    // }).catchError((error, stackTrace) {
    //   debugPrint(error.toString());
    //   debugPrint(stackTrace.toString());
    //   hideProgress(context);
    //   displayAlert(context, GlobalKey(), error.toString());
    // });
  }

  var imman;

  Future<void> createUser(bool? isadmin) async {
    debugPrint(imman.toString() + "000");
  }

  Future<void> popWindow() async {
    await Navigator.pushNamedAndRemoveUntil(context, "/signin", (r) => false);
  }

  static String getSigninData() {
    var signinDetails = {};
    return json.encode(signinDetails);
  }

  void pushToHomePage() {}
}
