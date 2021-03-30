import 'package:flutter/material.dart';
import 'package:screentwo/screens/constants.dart';
import 'package:email_validator/email_validator.dart';
import '../Animation/FadeAnimation.dart';
import 'package:screentwo/screens/forget_password.dart';
import 'package:screentwo/screens/profile_main.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String _email;
  final TextEditingController _password = TextEditingController();

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 70),
          child: Text(
            'Log in',
            style: TextStyle(
              fontSize: MediaQuery.of(context).size.height / 25,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildForm() {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Form(
        key: _formkey,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              validator: (value) {
                if (value.isEmpty) {
                  return "This Field is Empty";
                } else if (!EmailValidator.validate(value)) {
                  return "The email you inserted is not valid";
                }
                return null;
              },
              onSaved: (String email) {
                _email = email;
              },
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: mainColor,
                  ),
                  labelText: 'E-mail'),
            ),
            TextFormField(
              autofocus: true,
              controller: _password,
              validator: (value) {
                if (value.isEmpty) {
                  return "This Field is Empty";
                } else if (value.length < 6) {
                  return "your password should have at least 6 characters";
                }
                return null;
              },
              onSaved: (String password) {
                _password.text = password;
              },
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.lock,
                  color: mainColor,
                ),
                labelText: 'Password',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForgetPasswordButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        FlatButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return ForgetPass();
            }));
          },
          child: Text("Forgot Password?"),
        ),
      ],
    );
  }

  Widget _buildLoginButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        FadeAnimation(
            2,
            Container(
              height: 1.4 * (MediaQuery.of(context).size.height / 20),
              width: 5 * (MediaQuery.of(context).size.width / 10),
              margin: EdgeInsets.only(bottom: 20),
              child: RaisedButton(
                elevation: 5.0,
                color: mainColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: () {
                  if (_formkey.currentState.validate()) {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Profile();
                    }));
                  }
                },
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Colors.black,
                    letterSpacing: 1.5,
                    fontSize: MediaQuery.of(context).size.height / 40,
                  ),
                ),
              ),
            ))
      ],
    );
  }
  Widget _buildContainer() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[],
                ),
                _buildForm(),
                _buildForgetPasswordButton(),
                _buildLoginButton(),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFF01579B),
        body: Stack(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.7,
              width: MediaQuery.of(context).size.width,
              child: Container(
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.only(
                    bottomLeft: const Radius.circular(70),
                    bottomRight: const Radius.circular(70),
                  ),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                _buildLogo(),
                _buildContainer(),
              ],
            )
          ],
        ),
      ),
    );
  }
}
