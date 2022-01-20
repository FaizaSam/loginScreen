import 'package:flutter/material.dart';
import 'package:sample5/home.dart';
import 'package:sample5/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class loginScreen extends StatefulWidget {
  loginScreen({Key? key}) : super(key: key);

  @override
  State<loginScreen> createState() => _loginScreenState();
}

class _loginScreenState extends State<loginScreen> {
  final _nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();

  late bool _isDataMatched = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                validator: (value) {
                  // _isDataMatched ? null : Text('Error');
                  if ((value == null) || (value.isEmpty)) {
                    return 'value is empty';
                  } else {
                    return null;
                  }
                },
                controller: _nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  //   borderSide: BorderSide(color: Colors.grey, width: 2)),
                  hintText: 'Please Enter UserName',
                  //  constraints: BoxConstraints(maxWidth: 50)
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                validator: (value) {
                  // _isDataMatched ? null : Text('Error');
                  if ((value == null) || (value.isEmpty)) {
                    return 'value is empty';
                  } else {
                    return null;
                  }
                },
                controller: _passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  //    borderSide: BorderSide(color: Colors.grey, width: 2)),
                  hintText: 'Please Enter Password',
                  //  constraints: BoxConstraints(maxWidth: 50)
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Visibility(
                  //   visible: !_isDataMatched,
                  //   child:
                  // Text(
                  //   "User Name password does not match",
                  //   style: TextStyle(color: Colors.red),
                  // ),
                  //      ),
                  //child: Container(
                  // constraints: BoxConstraints(minWidth: 40, maxHeight: 40),
                  ElevatedButton.icon(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          checkLogin(context);
                        } else {
                          print('Data Empty');
                        }
                      },
                      icon: Icon(Icons.check),
                      label: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.black),
                      )),
                ],
              ),
              //       ),
            ],
          ),
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) async {
    final userName = _nameController.text;
    final password = _passwordController.text;
    if (userName == password) {
      print('User name and password match');
      final _sharedPrefs = await SharedPreferences.getInstance();
      await _sharedPrefs.setBool(SAVE_KEY_NAME, true);
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx1) => ScreenHome()));
    } else {
      print('User name and password does not match');
    }

    /*   if (userName == password) {
      setState(() {
        _isDataMatched = true;
      });
    } else {
      final _errorMsg = 'Password do not match';
      ScaffoldMessenger.of(ctx)
          .showSnackBar(SnackBar(content: Text(_errorMsg)));
      showDialog(
          context: ctx,
          builder: (ctx1) {
            return AlertDialog(
              title: Text(_errorMsg),
              actions: [
                TextButton(
                    onPressed: () {
                      Navigator.of(ctx1).pop();
                    },
                    child: Text('Close'))
              ],
            );
          });}
     */
    // setState(() {
    //   _isDataMatched = false;
    // });
  }
}
