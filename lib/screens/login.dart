import 'package:final_eval/models/message.dart';
import 'package:final_eval/models/user.dart';
import 'package:final_eval/screens/products.dart';
import 'package:final_eval/services/user_operations.dart';
import 'package:final_eval/utils/constants.dart';
import 'package:final_eval/utils/toast.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController userCtrl;
  late TextEditingController passwordCtrl;
  bool isLoggedIn = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userCtrl = TextEditingController();
    passwordCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Image.network(Constants.LOGIN_IMAGE),
          Container(
            margin: EdgeInsets.all(16),
            child: TextField(
              controller: userCtrl,
              decoration: InputDecoration(
                  hintText: 'Enter your username here',
                  prefixIcon: Icon(Icons.login),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          // SizedBox(height: 10),
          Container(
            margin: EdgeInsets.all(16),
            child: TextField(
              controller: passwordCtrl,
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Enter your password here',
                  prefixIcon: Icon(Icons.password),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: EdgeInsets.all(16),
                  child: ElevatedButton(
                      onPressed: () {
                        LoginFunc().then((value) async {
                          if (value == 1) {
                            await Future.delayed(Duration(seconds: 1));
                          }

                          Navigator.pushNamed(context, Routes.PRODUCTS);
                        });
                      },
                      child: Text('Login'))),
              Container(
                  margin: EdgeInsets.all(16),
                  child: ElevatedButton(
                      onPressed: () {
                        // Navigator.push(context, MaterialPageRoute(builder: (context) => Register()));
                        Navigator.pushNamed(context, Routes.REGISTER);
                      },
                      child: Text('Register')))
            ],
          )
        ],
      )),
    ));
  }

  Future<int> LoginFunc() async {
    String sellerId = userCtrl.text;
    String password = passwordCtrl.text;
    UserClass userObj = UserClass.takeInput(
        userId: sellerId, userPwd: password, userAppId: CONSTANTS.APP_ID);
    UserOperations userOpr = UserOperations();
    Message msgObject = await userOpr.read(userObj);
    createToast(msgObject.message, context);
    return msgObject.code;
  }
}