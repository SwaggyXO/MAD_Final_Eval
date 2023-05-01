import 'package:final_eval/models/message.dart';
import 'package:final_eval/models/user.dart';
import 'package:final_eval/services/user_operations.dart';
import 'package:final_eval/utils/constants.dart';
import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  late TextEditingController userEmailCtrl;
  late TextEditingController userpasswordCtrl;
  late TextEditingController userappIdCtrl;

  @override
  void initState() {
    super.initState();
    userEmailCtrl = TextEditingController();
    userpasswordCtrl = TextEditingController();
    userappIdCtrl = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.all(8),
              child: TextField(
                controller: userEmailCtrl,
                decoration: InputDecoration(
                    hintText: 'Enter your email here',
                    prefixIcon: Icon(Icons.app_registration),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: TextField(
                controller: userpasswordCtrl,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Enter your password here',
                    prefixIcon: Icon(Icons.password),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8),
              child: TextField(
                controller: userappIdCtrl,
                obscureText: true,
                decoration: InputDecoration(
                    hintText: 'Enter your id here',
                    prefixIcon: Icon(Icons.extension),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: EdgeInsets.all(8),
                    child: ElevatedButton(
                        onPressed: () {
                          registerFunc();
                        },
                        child: Text('Add'))),
                Container(
                    margin: EdgeInsets.all(8),
                    child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text('Cancel')))
              ],
            )
          ],
        ),
      ),
    );
  }

  dynamic registerFunc() async {
    String message = '';

    String userId = userEmailCtrl.text;
    String userPwd = userpasswordCtrl.text;
    String userAppId = userappIdCtrl.text;

    if (userAppId != CONSTANTS.APP_ID) {
      message = "Wrong app id";
      return;
    } else {
      UserClass userObj = UserClass.takeInput(
          userId: userId, userPwd: userPwd, userAppId: userAppId);

      UserOperations userOps = UserOperations();
      Message msgObj = await userOps.addUser(userObj);

      print(msgObj.message);
    }
  }
}