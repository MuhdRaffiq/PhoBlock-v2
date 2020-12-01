import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:phoblock/widgets/widgets.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        appBar: phoBlockAppBar(),
        //TODO: show pix
        body: CustomScrollView(
          slivers: [
            //TODO: add a catogery bar on the top body
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return !showImg
                      ? loadingScreen()
                      : displayImg(imgData, index);
                },
                childCount: len,
              ),
            )
          ],
        ));
  }
}
