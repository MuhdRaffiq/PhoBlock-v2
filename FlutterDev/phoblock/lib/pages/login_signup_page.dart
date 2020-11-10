import 'package:flutter/material.dart';

class LogIn_SignUp_Page extends StatefulWidget {
  @override
  _LogIn_SignUp_PageState createState() => _LogIn_SignUp_PageState();
}

class _LogIn_SignUp_PageState extends State<LogIn_SignUp_Page> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset(
                    "assets/Big Sur.jpg",
                  ),
                  Text(
                      "Welcome to PhoBlock\nThe decentralized photography platform",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14.5,
                      ))
                ],
              ),
              Center(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  decoration: BoxDecoration(),
                  width: 280,
                  height: 280,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Please log in",
                          style: TextStyle(fontSize: 18),
                        ),
                      ),
                      TextField(
                        decoration: InputDecoration(
                          labelText: 'username',
                        ),
                      ),
                      TextField(
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'password',
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      FlatButton(
                        color: Colors.blue,
                        onPressed: () {
                          //TODO: check user name and password match in data.
                          print('Submit');
                        },
                        child: Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          //TODO: opens in app browser to web sign up page
                          print('url');
                        },
                        child: Text(
                          'No account? Sign up here!',
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
