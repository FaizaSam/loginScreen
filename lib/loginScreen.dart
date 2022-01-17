import 'package:flutter/material.dart';

class loginScreen extends StatelessWidget {
  loginScreen({Key? key}) : super(key: key);
  final _nameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[100],
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
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
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                //    borderSide: BorderSide(color: Colors.grey, width: 2)),
                hintText: 'Please Enter Password',
                //  constraints: BoxConstraints(maxWidth: 50)
              ),
            ),
            Center(
              //child: Container(
              // constraints: BoxConstraints(minWidth: 40, maxHeight: 40),
              child: ElevatedButton.icon(
                  onPressed: () {
                    checkLogin(context);
                  },
                  icon: Icon(Icons.check),
                  label: const Text(
                    'Submit',
                    style: TextStyle(color: Colors.black),
                  )),
            ),
            //       ),
          ],
        ),
      ),
    );
  }

  void checkLogin(BuildContext ctx) {
    final userName = _nameController.text;
    final password = _passwordController.text;
    if (userName == password) {
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
          });
    }
  }
}
