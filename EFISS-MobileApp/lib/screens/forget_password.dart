import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
//import 'package:screentwo/screens/intro_page.dart';
import 'package:survillience_screens/screens/login.dart';
import 'package:survillience_screens/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgetPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ForgetPassword(),
    );
  }
}

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPassState createState() => _ForgetPassState();
}

class _ForgetPassState extends State<ForgetPassword> {
  String _email;
  final _auth = FirebaseAuth.instance;
  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  void validate() {
    if (formkey.currentState.validate()) {
      print('Validated');
    }
    print('Not validated');
  }

  showAlertDialog(BuildContext context) {
    Widget okayButton = FlatButton(
      child: Text(
        "Okay",
        style: TextStyle(color: Colors.grey[700]),
      ),
      onPressed: () {
        Get.to(Login());
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        "Password Reset",
        style: TextStyle(
          color: Colors.blue[500],
        ),
      ),
      content: Text("A link was sent on your email to reset your password."),
      actions: [
        okayButton,
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  String EmailValidation(value) {
    if (value.isEmpty) {
      return 'Please enter your email';
    } else if (!EmailValidator.validate(value)) {
      return 'Please insert a valid email';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final AuthService _auth = AuthService();
    return Scaffold(
        backgroundColor: Colors.white,
        body: ListView(children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.black,
                  onPressed: () {
                    if (formkey.currentState.validate()) {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return Login();
                      }));
                    }
                  },
                ),
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Forget Password ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0)),
                ),
                SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                      'please enter your email to receive the instruction to reset your password.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.grey,
                          fontSize: 13.0)),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Center(
                    child: Form(
                      autovalidate: true,
                      key: formkey,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  _email = value.trim();
                                });
                              },
                              validator: EmailValidation,
                              autofocus: true,
                              decoration: InputDecoration(
                                fillColor: Colors.white,
                                filled: true,
                                border: InputBorder.none,
                                hintText: 'Enter you email..',
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 290,
                    height: 50,
                    // ignore: deprecated_member_use
                    child: RaisedButton(
                        onPressed: () async {
                          if (formkey.currentState.validate()) {
                            _auth.sendPasswordResetEmail(_email);
                            showAlertDialog(context);
                          } else {
                            return ("try again later");
                          }
                        },
                        color: Colors.blue[500],
                        child: Text("Send Request",
                            style: TextStyle(color: Colors.white))),
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
