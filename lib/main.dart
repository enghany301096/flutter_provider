import 'package:flutter/material.dart';
import 'package:flutter_provider/provider/appProvider.dart';
import 'package:flutter_provider/provider/userProvider.dart';
import 'package:provider/provider.dart';

import 'HomeView.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => AppProvider()),
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: Consumer<AppProvider>(builder: (context, _app, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.blue,
            ),
            home: MyHomePage(title: _app.appName),
          );
        }));
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Provider.of<AppProvider>(context, listen: false).appInit();
    return Provider.of<UserProvider>(context, listen: false).loginStatus == null
        ? Login()
        : Provider.of<UserProvider>(context, listen: false).loginStatus
            ? HomeView()
            : Login();
  }
}
