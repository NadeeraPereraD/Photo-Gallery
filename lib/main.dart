import 'dart:async';

import 'package:flutter/material.dart';
import 'package:photo_gallery/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String Tag = 'photoGallery : ';
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      /// Remove Debug banner
      title: 'photo gallery',

      /// App Name
      home: InitialPage(),

      /// Initial Page
    );
  }
}

class InitialPage extends StatefulWidget {
  const InitialPage({super.key});

  @override
  State<InitialPage> createState() => _InitialPageState();
}

class _InitialPageState extends State<InitialPage> {
  @override
  void initState() {
    super.initState();
    startTimer();

    /// Put timer delay for route to Home Page
  }

  /// Start Timer Delay
  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
        return const HomePage();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage('assets/initial_image.png'),
            width: 250,
          ),
          Center(
            child: CircularProgressIndicator(),
          ),
        ],
      )),
    );
  }
}
