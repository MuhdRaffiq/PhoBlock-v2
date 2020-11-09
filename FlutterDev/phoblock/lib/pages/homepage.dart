import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:loading_animations/loading_animations.dart';

class HomePgae extends StatefulWidget {
  @override
  _HomePgaeState createState() => _HomePgaeState();
}

class _HomePgaeState extends State<HomePgae> {
  String _unsplash_site = "https://api.unsplash.com/";
  String _unsplash_API_key = "_GiqL07UUHcEfIh9ZgNCr7NmwJjg-LGNeFo-9bY2Cbs";
  String _unsplash_API_secret_key =
      "eElIQe44ob-5x7-D6Uhr8vIXIDUnwFJ68hDbnBwEhjI";

  List data = [];
  bool showImg = false;
  int len;
  List<String> imgData = [];
  getData() async {
    http.Response res = await http.get(_unsplash_site +
        '/photos/?client_id=' +
        _unsplash_API_key +
        '&per_page=30');
    data = json.decode(res.body);
    for (int j = 0; j < data.length; j++) {
      imgData.add(data.elementAt(j)["urls"]["regular"]);
    }
    len = data.length;
    setState(() {
      showImg = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leadingWidth: 80,
          leading: Container(
            child: Image.asset(
              'assets/phoblock_branding-10.png',
            ),
          ),
          toolbarHeight: 70,
          flexibleSpace: Row(
            children: [
              Container(
                color: Colors.red,
                height: 300,
              ),
              Container(
                color: Colors.white,
              ),
              Container(
                color: Colors.blue,
              ),
            ],
          ),
          actions: [
            PopupMenuButton(
              // onSelected: (value) {
              //   //TODO: Navigate to sites
              //   Navigator.push(
              //       context, MaterialPageRoute(builder: (context) => value));
              // },
              itemBuilder: (context) => [
                PopupMenuItem(
                  // value: null,
                  child: Text("Log In"),
                ),
                PopupMenuItem(
                  // value: null,
                  child: Text("Votes & Services"),
                ),
                PopupMenuItem(
                  // value: null,
                  child: Text("Settings"),
                )
              ],
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Icon(
                  Icons.menu_rounded,
                  color: Colors.black,
                  size: 35,
                ),
              ),
            ),
          ],
          title: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(40),
              ),
              labelText: 'Search Photos',
            ),
          ),
        ),
        //TODO: show pix
        body: CustomScrollView(
          slivers: [
            //TODO: add a catogery bar on the top body
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext Context, int index) {
                  return !showImg ? loadingScreen() : displayImg(index);
                },
                childCount: len,
              ),
            )
          ],
        ));
  }

  displayImg(int n) {
    return Column(
      children: [
        Container(
          child: Row(
            children: [
              Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.blue),
                margin: EdgeInsets.all(10),
              ),
              Text(
                "User $n",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              )
            ],
          ),
        ),
        Image.network(
          imgData[n],
          fit: BoxFit.cover,
        ),
        Container(
          alignment: Alignment.topCenter,
          height: 80,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              //TODO: put gesture on each icon, also group the repeated thing.
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.favorite_border,
                  size: 30,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  Icons.download_sharp,
                  size: 30,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  loadingScreen() {
    return Container(
      height: 100,
      // padding: EdgeInsets.all(15),
      child: LoadingBouncingGrid.square(
        backgroundColor: Colors.green,
      ),
    );
  }
}
