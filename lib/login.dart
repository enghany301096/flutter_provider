import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_provider/HomeView.dart';
import 'package:flutter_provider/provider/userProvider.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _usernameController = TextEditingController();
  bool _loading = false;
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: Center(
          child: Stack(children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Icon(
              Icons.person,
              size: 40,
              color: Colors.blueAccent,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: TextField(
                      controller: _usernameController,
                      decoration: InputDecoration(
                          hintText: "user name",
                          suffixIcon: Icon(Icons.person)),
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2,
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      hintText: "password",
                      suffixIcon: Icon(Icons.lock),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              //color: Colors.blueAccent,
              child: TextButton(
                onPressed: () {
                  print("asdfghjkl");
                  setState(()  {
                    _loading = true;
                    Provider.of<UserProvider>(context, listen: false).login(
                        _usernameController.text, _passwordController.text);
                    if (Provider.of<UserProvider>(context, listen: false)
                        .loginStatus) {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => HomeView()));
                    }else{
                      _loading=false;
                    }
                  });
                },
                child: Text("Login"),
              ),
            )
          ],
        ),
        !_loading
            ? SizedBox.shrink()
            : Center(child: CircularProgressIndicator())
      ])),
    );
  }
}
