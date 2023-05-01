import 'package:final_eval/screens/login.dart';
import 'package:final_eval/screens/products.dart';
import 'package:final_eval/screens/register.dart';
import 'package:final_eval/utils/constants.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getRoutes() {
  return {
    Routes.LOGIN: (context) => const Login(),
    Routes.REGISTER: (context) => const Register(),
    Routes.PRODUCTS:(context) => const Products()
  };
}