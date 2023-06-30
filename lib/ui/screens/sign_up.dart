import 'dart:core';

import 'package:electrity_fault_reportor/models/user.dart';
import 'package:electrity_fault_reportor/ui/widgets/custom_alert_dialog.dart';
import 'package:electrity_fault_reportor/ui/widgets/custom_flat_button.dart';
import 'package:electrity_fault_reportor/ui/widgets/custom_text_field.dart';
import 'package:electrity_fault_reportor/utils/auth.dart';
import 'package:electrity_fault_reportor/utils/validator.dart';
import "package:flutter/material.dart";

import 'package:flutter/services.dart';

class SignUpScreen extends StatefulWidget {
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _mNumber = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();
  final TextEditingController _pwd = TextEditingController();
  final TextEditingController _confirmPwd = TextEditingController();

  CustomTextField _firstNameInputField;
  CustomTextField _lastNameInputField;
  CustomTextField _emailInputField;
  CustomTextField _mNumberInputField;
  CustomTextField _phoneNumberInputField;
  CustomTextField _pwdInputField;
  CustomTextField _confirmPwdInputField;

  bool _blackVisible = false;
  VoidCallback onBackPress;

  @override
  void initState() {
    super.initState();

    onBackPress = () {
      Navigator.of(context).pop();
    };

    _firstNameInputField = CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _firstName,
      hint: "First Name",
      validator: Validator.validateName,
    );
    _lastNameInputField = CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _lastName,
      hint: "Last Name",
      validator: Validator.validateName,
    );
    _phoneNumberInputField = CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _phoneNumber,
      inputType: TextInputType.number,
      hint: "Phone Number",
      validator: Validator.validateNumber,
    );
    _confirmPwdInputField = CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _confirmPwd,
      obscureText: true,
      hint: "Confirm Password",
      validator: Validator.validatePassword,
    );
    _pwdInputField = CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _pwd,
      obscureText: true,
      hint: "Password",
      validator: Validator.validatePassword,
    );
    _mNumberInputField = CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _mNumber,
      hint: "meter Number",
      inputType: TextInputType.number,
    );
    _emailInputField = CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      errorColor: Colors.red,
      controller: _email,
      hint: "Email",
      inputType: TextInputType.emailAddress,
      validator: Validator.validateEmail,
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        appBar: AppBar(
          elevation: 8.0,
          centerTitle: true,
          title: Text(
            "Electricity Fault Reporter",
          ),
        ),
        body: Stack(
          children: <Widget>[
            Stack(
              alignment: Alignment.topLeft,
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 10.0, left: 10.0, right: 10.0),
                      child: Text(
                        "EFR",
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(212, 20, 15, 1.0),
                          decoration: TextDecoration.none,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 05.0, bottom: 10.0, left: 10.0, right: 10.0),
                      child: Text(
                        "Create new account",
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Color.fromRGBO(212, 20, 15, 1.0),
                          decoration: TextDecoration.none,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                      child: _firstNameInputField,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                      child: _lastNameInputField,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                      child: _phoneNumberInputField,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                      child: _emailInputField,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                      child: _mNumberInputField,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                      child: _pwdInputField,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                      child: _confirmPwdInputField,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 40.0),
                      child: CustomFlatButton(
                        title: "Sign Up",
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        textColor: Colors.white,
                        onPressed: () {
                          _signUp(
                              fullname: _firstName.text,
                              surname: _lastName.text,
                              email: _email.text,
                              number: _phoneNumber.text,
                              meter: _mNumber.text,
                              password: _pwd.text);
                        },
                        splashColor: Colors.black12,
                        borderColor: Color.fromRGBO(59, 89, 152, 1.0),
                        borderWidth: 0,
                        color: Color.fromRGBO(59, 89, 152, 1.0),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Offstage(
              offstage: !_blackVisible,
              child: GestureDetector(
                onTap: () {},
                child: AnimatedOpacity(
                  opacity: _blackVisible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.ease,
                  child: Container(
                    height: MediaQuery.of(context).size.height,
                    color: Colors.black54,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _changeBlackVisible() {
    setState(() {
      _blackVisible = !_blackVisible;
    });
  }

  void _signUp(
      {String fullname,
      String surname,
      String email,
      String number,
      String meter,
      String password,
      BuildContext context}) async {
    if (Validator.validateName(fullname) &&
        Validator.validateName(surname) &&
        Validator.validateEmail(email) &&
        Validator.validateNumber(number) &&
        Validator.validatePassword(password)) {
      try {
        SystemChannels.textInput.invokeMethod('TextInput.hide');
        _changeBlackVisible();
        await Auth.signUp(email, password).then((uID) {
          Auth.addUser(new User(
              userID: uID,
              email: email,
              firstName: fullname,
              lastName: surname,
              meterNumber: meter,
              phoneNumbers: number,
              password: password
              ));
          onBackPress();
        });
      } catch (e) {
        print("Error in sign up: $e");
        String exception = Auth.getExceptionText(e);
        _showErrorAlert(
          title: "Signup failed",
          content: exception,
          onPressed: _changeBlackVisible,
        );
      }
    }
  }

  void _showErrorAlert({String title, String content, VoidCallback onPressed}) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return CustomAlertDialog(
          content: content,
          title: title,
          onPressed: onPressed,
        );
      },
    );
  }
}
