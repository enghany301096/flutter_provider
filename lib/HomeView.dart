import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/login.dart';
import 'package:flutter_provider/provider/userProvider.dart';
import 'package:provider/provider.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Provider.of<UserProvider>(context, listen: false).logout();
              Navigator.pushReplacement(
                  context, MaterialPageRoute(builder: (context) => Login()));
              setState(() {});
            },
            color: Colors.white,
          )
        ],
      ),
      body: Center(
        child: Text("Home Provider"),
      ),
    );
  }
}
