import 'package:final_eval/models/message.dart';
import 'package:final_eval/models/user.dart';
import 'package:final_eval/utils/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserOperations {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // For registration
  Future<Message> addUser(UserClass userObj) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: userObj.userId, password: userObj.password);
      Message msg = Message.takeMessage(
          message: "Registration successful!", code: CONSTANTS.SUCCESS);
      return msg;
    } catch (e) {
      return Message.takeMessage(
          message: "Registration Failed!!", code: CONSTANTS.FAIL);
    }
  }

  // For login
  Future<Message> read(UserClass userObj) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: userObj.userId, password: userObj.password);
      return Message.takeMessage(
          message: 'Login successful!', code: CONSTANTS.SUCCESS);
    } catch (err) {
      return Message.takeMessage(
          message: 'Login Failed!', code: CONSTANTS.FAIL);
    }
  }
}