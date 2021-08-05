import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
                UserAccountsDrawerHeader(
                    accountName: Text("Kamal Khan"),
                    accountEmail: Text("kamal@gmail.com"),

                ),
          Container(
            height: 50,

            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white38,

            ),
            child: Text("Dashboard"),
          ),
          Container(
            height: 50,

            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white38,

            ),
            child: Text("Dashboard"),
          ),
          Container(
            height: 50,

            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white38,

            ),
            child: Text("Dashboard"),
          ),
          Container(
            height: 50,

            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white38,

            ),
            child: Text("Dashboard"),
          ),
          Container(
            height: 50,

            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white38,

            ),
            child: Text("Dashboard"),
          ),
          Text("Dashboard"),
          Text("Dashboard"),
          Text("Dashboard"),

        ],

      ),
    );
  }
}
