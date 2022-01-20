import 'package:flutter/material.dart';
import 'package:sample5/home.dart';
import 'package:sample5/loginScreen.dart';
import 'package:sample5/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    checkUserLoggedin();
    // gotoLogin();
    // TODO: implement initState
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Image.asset('assets/images/space.jpg')),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Future<void> gotoLogin() async {
    await Future.delayed(Duration(seconds: 3));
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
      return loginScreen();
    }));
  }

  Future<void> checkUserLoggedin() async {
    final _sharedPrefs = await SharedPreferences.getInstance();
    final _userLoggedin = _sharedPrefs.getBool(SAVE_KEY_NAME);
    if (_userLoggedin == null || _userLoggedin == false) {
      gotoLogin();
    } else {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    }
    // _sharedPrefs.setBool(key, value)
  }
}
