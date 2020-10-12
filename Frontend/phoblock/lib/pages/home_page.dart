import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:http/http.dart' as http;

class Home_Page extends StatefulWidget {
  Home_Page({Key key}) : super(key: key);

  @override
  _Home_PageState createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  String _unsplash_site = "https://api.unsplash.com/";
  String _unsplash_API_key = "_GiqL07UUHcEfIh9ZgNCr7NmwJjg-LGNeFo-9bY2Cbs";
  String _unsplash_API_secret_key =
      "eElIQe44ob-5x7-D6Uhr8vIXIDUnwFJ68hDbnBwEhjI";

  Future<String> getJson() {
    return rootBundle.loadString('unsplash_API_data.json');
  }
  // getData() async {
  //   http.Response res = await http.get(_unsplash_site +
  //       '/photos/?client_id=' +
  //       _unsplash_API_key +
  //       '&per_page=100');`
  //   data = json.decode(res.body);
  //   return data.elementAt(1)["urls"]["regulars"];
  // }

  @override
  Widget build(BuildContext context) {
    var deviceData = MediaQuery.of(context);
    var deviceSize = deviceData.size;
    print(deviceSize);
    print('');
    // print(getJson());
    print('');

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        TextEditingController().clear();
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 80,
          leading: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              child: Center(
                child: Text('Logo'),
              ),
              decoration: BoxDecoration(
                color: Colors.pink,
                border: Border.all(
                  color: Colors.black,
                ),
              ),
              height: 80,
            ),
          ),
          toolbarHeight: 80,
          actions: [
            AppBarContainer('About Us'),
            AppBarContainer('Votes & Services'),
            AppBarContainer('Login'),
            TextButton(
              style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.resolveWith((states) => Colors.white),
              ),
              onPressed: () {
                print('Sign Up');
              },
              child: Container(
                margin: EdgeInsets.all(15),
                width: 100,
                decoration: BoxDecoration(
                  color: Color(0xffDF774A),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text(
                    "Sign Up",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  ),
                ),
              ),
            )
          ],
          title: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
                labelText: 'Search Photos',
              ),
            ),
          ),
        ),
        body: Column(
          children: [
            Container(
              width: deviceSize.width,
              height: 650,
              child: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Image.asset(
                    'assets/Big_Sur.jpg',
                    width: deviceSize.width,
                    fit: BoxFit.cover,
                  ),
                  Stack(
                    children: [
                      Text(
                        """\n\n\nFuck you and you're a piece of shit """,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                        ),
                      ),
                      Text(
                        'PhoBlock',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 80,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            // GridView.count(
            //   crossAxisCount: 3,
            //   children: List.generate(data.length, (index) {
            //     return Container(
            //       child: Center(
            //         child: Text('Item $index'),
            //       ),
            //     );
            //   }),
            // ),
          ],
        ),
      ),
    );
  }
}

// TODO: Required: Text and Navigation; Optional: decoration
AppBarContainer(String text) {
  return Padding(
    padding: const EdgeInsets.all(15.0),
    child: TextButton(
      style: ButtonStyle(
        overlayColor:
            MaterialStateProperty.resolveWith((states) => Colors.white),
      ),
      onPressed: () {
        // TODO: Navigate to pages
        print(text);
      },
      child: Container(
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 15,
              color: Colors.black,
            ),
          ),
        ),
      ),
    ),
  );
}
