import 'package:flutter/material.dart';
import 'package:sample5/loginScreen.dart';
import 'package:sample5/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
              onPressed: () {
                signOut(context);
              },
              icon: Icon(Icons.exit_to_app))
        ],
      ),
      body: SafeArea(
        child: Center(
          child: Text('Home'),
        ),
      ),
    );
  }

  signOut(BuildContext ctx1) async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    await _sharedPrefs.clear();
    Navigator.of(ctx1).pushAndRemoveUntil(
        MaterialPageRoute(builder: (ctx1) => loginScreen()), (route) => false);
  }
}
