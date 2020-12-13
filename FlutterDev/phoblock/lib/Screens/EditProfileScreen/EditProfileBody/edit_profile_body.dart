import 'package:flutter/material.dart';
import '../../../style.dart';

class EditProfileBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(10.0, 35.0, 10.0, 10.0),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 3.0, color: Colors.black45),
          bottom: BorderSide(width: 3.0, color: Colors.black45),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
            child: Row(
              children: [
                Container(
                  width: 80.0,
                  child: Text('Username: '),
                ),
                Flexible(
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter Username",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(8.0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
            child: Row(
              children: [
                Container(
                  width: 80.0,
                  child: Text('Bio: '),
                ),
                Flexible(
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter Bio",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(8.0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
            child: Row(
              children: [
                Container(
                  width: 80.0,
                  child: Text('Email: '),
                ),
                Flexible(
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter Username",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(8.0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 0.0),
            child: Row(
              children: [
                Container(
                  width: 80.0,
                  child: Text('Phone: '),
                ),
                Flexible(
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter Phone Number",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(8.0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.fromLTRB(30.0, 15.0, 30.0, 20.0),
            child: Row(
              children: [
                Container(
                  width: 80.0,
                  child: Text('Birthday: '),
                ),
                Flexible(
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter Birthday",
                      fillColor: Colors.white,
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(25.0),
                        borderSide: new BorderSide(),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.all(8.0),
                    ),
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
