import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:just_driver/data/utils/constants.dart';
import 'package:just_driver/data/utils/widgets.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginController = TextEditingController();
  final FocusNode _loginFocus = FocusNode();
  static Color loginButtonColor = colorPassive;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainBackground,
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  child: Text(
                    "Welcome",
                    style: TextStyle(
                      fontSize: 24,
                      fontFamily: "SpartanMB",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 40.0),
                  child: customMaskTextField(
                    prefixText: "+998",
                    labelText: "Enter telephone number",
                    controller: _loginController,
                    onChanged: (value) {
                      setState(() {
                        isFull();
                      });
                    },
                    keyboardType: TextInputType.number,
                    inputAction: TextInputAction.done,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(25.0, 0, 25.0, 35.0),
                  child: SizedBox(
                      width: double.infinity,
                      child:
                      customButton(() {}, "Login", loginButtonColor, 35.0)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  bool isFull() {
    if (_loginController.text.length == 13) {
      loginButtonColor = colorActive;
      return true;
    }
    {
      loginButtonColor = colorPassive;
      return false;
    }
  }
}
