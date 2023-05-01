import 'package:flutter/material.dart';
import 'package:yourmuaa/Screen/bookingmua.dart';
import 'package:yourmuaa/Screen/home_page.dart';
import 'package:yourmuaa/Screen/login_page.dart';
import 'package:provider/provider.dart';
import 'Screen/bookingmua.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        // '/booking': (context) => BookingPage(),
        // '/specialist': (context) => SpecialistPage()
      },
    );
  }
}
