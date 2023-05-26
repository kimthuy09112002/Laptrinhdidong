import 'package:flutter/material.dart';
import 'MyHome_page.dart';
import 'SearchScreen_page.dart';
import 'StatisticsScree_page.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              child: Icon(Icons.person),
            ),
            accountName: Text('John Doe'),
            accountEmail: Text('johndoe@gmail.com'),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
          ),
          ListTile(
            leading: Icon(Icons.search),
            title: Text('Search'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SearchScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.bar_chart),
            title: Text('Thống kê'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => StatisticsScreen()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Cài đặt'),
            onTap: () {
              // TODO: Open settings screen
            },
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text('Trợ giúp'),
            onTap: () {
              // TODO: Open help screen
            },
          ),
        ],
      ),
    );
  }
}
