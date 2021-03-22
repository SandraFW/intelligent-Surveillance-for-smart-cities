import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:get/get.dart';
import 'package:survillience_screens/screens/login.dart';

class NewOfficer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AddNewOfficer(),
    );
  }
}

class AddNewOfficer extends StatefulWidget {
  @override
  _AddNewOfficerState createState() => _AddNewOfficerState();
}

class _AddNewOfficerState extends State<AddNewOfficer> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final TextEditingController firstname = TextEditingController();
  final TextEditingController lastname = TextEditingController();
  final TextEditingController id = TextEditingController();
  final TextEditingController station = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController password = TextEditingController();
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;

      if (_obscureText) {
        _obscureText = true;
      } else {
        _obscureText = false;
      }
    });
  }

  void addData() {
    Map<String, dynamic> demoData = {
      "FirstName": firstname.text,
      "LastName": lastname.text,
      "ID": id.text,
      "Station": station.text,
      "Email": email.text,
      "Password": password.text
    };
    CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('Posts');
    collectionReference.add(demoData);
  }

  showAlertDialog(BuildContext context) {
    // ignore: deprecated_member_use
    Widget okayButton = FlatButton(
      child: Text(
        "Okay",
        style: TextStyle(color: Colors.grey[700]),
      ),
      onPressed: () {
        //Get.to(IntroPage());
      },
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        "New Account",
        style: TextStyle(
          color: Colors.lightBlue[900],
        ),
      ),
      content: Text("A new account is added successfully."),
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

  @override
  Widget build(BuildContext context) {
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
                  child: Text('Admin',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'Montserrat',
                          color: Colors.lightBlue[900],
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0)),
                ),
                SizedBox(width: 10.0),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                      'Fill the fields below with information to add a new officer.',
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
                      key: formkey,
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "This Field is Empty";
                                  }
                                  return null;
                                },
                                // ignore: deprecated_member_use
                                autovalidate: true,
                                controller: firstname,
                                autofocus: true,
                                decoration: InputDecoration(
                                  fillColor: Colors.blueGrey[50],
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'First Name',
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "This Field is Empty";
                                  }
                                  return null;
                                },
                                // ignore: deprecated_member_use
                                autovalidate: true,
                                controller: lastname,
                                autofocus: true,
                                decoration: InputDecoration(
                                  fillColor: Colors.blueGrey[50],
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'Last Name',
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                                // ignore: deprecated_member_use
                                autovalidate: true,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "This Field is Empty";
                                  }
                                  return null;
                                },
                                controller: id,
                                autofocus: true,
                                decoration: InputDecoration(
                                  fillColor: Colors.blueGrey[50],
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'ID',
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                                // ignore: deprecated_member_use
                                autovalidate: true,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "This Field is Empty";
                                  }
                                  return null;
                                },
                                controller: station,
                                autofocus: true,
                                decoration: InputDecoration(
                                  fillColor: Colors.blueGrey[50],
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'Station',
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                                // ignore: deprecated_member_use
                                autovalidate: true,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return "This Field is Empty";
                                  } else if (!EmailValidator.validate(value)) {
                                    return "The email you inserted is not valid";
                                  }
                                  return null;
                                },
                                autofocus: true,
                                decoration: InputDecoration(
                                  fillColor: Colors.blueGrey[50],
                                  filled: true,
                                  border: InputBorder.none,
                                  hintText: 'Email',
                                  contentPadding: EdgeInsets.fromLTRB(
                                      20.0, 10.0, 20.0, 10.0),
                                )),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: TextFormField(
                              // ignore: deprecated_member_use
                              autovalidate: true,
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "This Field is Empty";
                                } else if (value.length < 6) {
                                  return "your password should have at least 6 characters";
                                }
                                return null;
                              },
                              autofocus: true,
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: _obscureText
                                      ? Icon(Icons.visibility)
                                      : Icon(Icons.visibility_off),
                                  onPressed: _toggle,
                                ),
                                fillColor: Colors.blueGrey[50],
                                filled: true,
                                border: InputBorder.none,
                                hintText: 'Password',
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                              ),
                              obscureText: _obscureText,
                            ),
                          ),
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
                            showAlertDialog(context);
                            addData();
                          } else {
                            return ("try again later");
                          }
                        },
                        color: Colors.lightBlue[900],
                        child: Text("Add Account",
                            style: TextStyle(color: Colors.white))),
                  ),
                )
              ],
            ),
          ),
        ]));
  }
}
