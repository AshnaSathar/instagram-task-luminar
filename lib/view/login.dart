import 'package:flutter/material.dart';
import 'package:flutter_application_1/view/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    void share(String name, String password) async {
      final prefs = await SharedPreferences.getInstance();
      prefs.setString("name", name);
      prefs.setString("password", password);
    }

    TextEditingController passwordController = TextEditingController();
    TextEditingController usernameController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Image.network(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/2/2a/Instagram_logo.svg/2560px-Instagram_logo.svg.png"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 25, left: 8.0, right: 8.0, bottom: 8.0),
            child: Container(
              color: Color.fromARGB(255, 234, 232, 232),
              child: TextFormField(
                controller: usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Username",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Username",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Color.fromARGB(255, 234, 232, 232),
              child: TextFormField(
                controller: passwordController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Password",
                    hintStyle: TextStyle(color: Colors.black),
                    labelText: "Password",
                    labelStyle: TextStyle(color: Colors.black)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 25, left: 8.0, right: 8.0, bottom: 15.0),
            child: Container(
              width: MediaQuery.sizeOf(context).width,
              height: 40,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(Colors.blue[900])),
                  onPressed: () {
                    if (usernameController.text != "" &&
                        usernameController.text != null) {
                      if (passwordController.text != null &&
                          passwordController.text != "") {
                        share(usernameController.text, passwordController.text);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Home(),
                          ),
                        );
                      }
                    }
                  },
                  child: Text("Submit")),
            ),
          ),
          Spacer(),
          Divider(),
          Container(
            height: 70,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do You Have An account? ",
                  style: TextStyle(color: Colors.grey),
                ),
                Text(
                  "SIGN UP",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
