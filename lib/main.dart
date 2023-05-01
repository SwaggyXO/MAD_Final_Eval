import 'package:final_eval/config/routes.dart';
import 'package:final_eval/controller/cart_notifier.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // initialize the firebase --> returns a future object --> waits till the time application gets initialized.
  await Firebase.initializeApp();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => CartNotifier())],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Login(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Colors.indigo),
        primarySwatch: Colors.indigo,
      ),
      initialRoute: '/',
      routes: getRoutes(),
    ),
  ));
}