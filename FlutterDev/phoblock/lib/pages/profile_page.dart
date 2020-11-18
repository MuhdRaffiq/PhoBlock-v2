import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:phoblock/widgets/widgets.dart';

class Profile_Page extends StatefulWidget {
  @override
  _Profile_PageState createState() => _Profile_PageState();
}

class _Profile_PageState extends State<Profile_Page>
//TODO: something needs to be done on this
    with
        SingleTickerProviderStateMixin {
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
        '&page=3' +
        '&per_page=8');
    data = json.decode(res.body);
    for (int j = 0; j < data.length; j++) {
      imgData.add(data.elementAt(j)["urls"]["regular"]);
    }
    len = data.length;
    setState(() {
      showImg = true;
    });
  }

  TabController controller;

  final String name = "John Adam Smith";
  final String username = "@JAdamSmith";
  @override
  void initState() {
    super.initState();
    controller = new TabController(length: 3, vsync: this);
  }

  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            // collapsedHeight: 75,
            pinned: true,
            backgroundColor: Colors.white,
            leadingWidth: 80,
            leading: Container(
              child: Image.asset(
                'assets/phoblock_branding-10.png',
              ),
            ),
            toolbarHeight: 70,
            flexibleSpace: FlexibleSpaceBar(
              // centerTitle: true,
              background: profileBanner(
                  name, username, MediaQuery.of(context).size.width),
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
                    child: Text("Profile"),
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
            expandedHeight: 310,
            bottom: TabBar(
              controller: controller,
              tabs: [
                Tab(
                  child: Text(
                    "Tab 1",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    "Tab 2",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
                Tab(
                  child: Text(
                    "Tab 3",
                    style: TextStyle(color: Colors.black, fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return !showImg ? loadingScreen() : displayImg(imgData, index);
              },
              childCount: len,
            ),
          ),
        ],
      ),
    );
  }
}
