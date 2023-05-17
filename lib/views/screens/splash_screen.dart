import 'package:flutter/material.dart';
import 'dart:async';

import '../../../utils/image_path.dart';
import '../../utils/routes_utils.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  void mySplashScreen() {
    Timer.periodic(
      const Duration(seconds: 3),
      (tick) {
        Navigator.of(context).pushReplacementNamed(MyRoutes.home);
        tick.cancel();
      },
    );
  }

  @override
  void initState() {
    super.initState();
    mySplashScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 350,
              width: 350,
              child: Image.asset(
                imagePath + "logo.png",
                fit: BoxFit.cover,
                color: Colors.purple,
              ),
            ),
            Text(
              "Egle Enterprise",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            const Text(
              "please wait...",
              style: TextStyle(
                fontSize: 18,
                color: Colors.purple,
              ),
            ),
            SizedBox(height: 10),
            CircularProgressIndicator(
              backgroundColor: Colors.purple,
            ),
          ],
        ),
      ),
    );
  }
}
