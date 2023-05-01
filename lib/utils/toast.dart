import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

createToast(String message, BuildContext context) async{
   await Flushbar(
            title: 'Ecomm App',
            message: message,
            duration: Duration(seconds: 2),
          ).show(context);
}