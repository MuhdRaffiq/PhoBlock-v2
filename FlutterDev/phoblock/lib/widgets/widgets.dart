import 'package:flutter/material.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:phoblock/main.dart';

/*---------------------------------------WIDGETS----------------------------------------*/

//Profile Banner when called
Widget profileBanner(String name, String username, double width) {
  return Stack(
    children: [
      Positioned(
        top: 100,
        child: Container(
          height: 210,
          width: width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: CircleAvatar(
                      maxRadius: 45,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      Text(
                        username,
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 25,
                ),
                child: Text(
                  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                ),
              )
            ],
          ),
        ),
      ),
    ],
  );
}

PreferredSizeWidget phoBlockAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    leadingWidth: 80,
    leading: Container(
      child: Image.asset(
        'assets/phoblock_branding-10.png',
      ),
    ),
    toolbarHeight: 70,
    actions: [
      PopupMenuButton(
        onSelected: (value) {
          //TODO: Navigate to sites
          navigatorKey.currentState.pushNamed('profilepage');
        },
        itemBuilder: (context) => [
          PopupMenuItem(
            value: 'homepage',
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
  );
}

/*---------------------------------------METHODS----------------------------------------*/

loadingScreen() {
  return Container(
    height: 100,
    // padding: EdgeInsets.all(15),
    child: LoadingBouncingGrid.square(
      backgroundColor: Colors.green,
    ),
  );
}

displayImg(List<String> imgData, int n) {
  return Column(
    children: [
      Container(
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30), color: Colors.blue),
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
