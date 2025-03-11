import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/asset_management.dart';
import 'login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () async {

      // var preference = await SharedPreferences.getInstance();
      // int uid = await preference.getInt('UID') ?? 0;
      //
      Widget navigateTo = LoginScreen();
      //
      // if(uid>0){
        // navigateTo = BottomNavigation();
      // }
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => navigateTo));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          children: [
            Image.asset(
              Assets.splash_screen_img,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 20,
            ),
            const Text('Confirm your order and await delivery', style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),),
            const SizedBox(
              height: 15,
            ),
            const Text('Choose from a wide range of deliver options', style: TextStyle(fontSize: 20, color: Colors.grey),),
            const Text('eShop, pickup point or at your doorstep', style: TextStyle(fontSize: 20, color: Colors.grey),)
          ],
        ),
      ),
    );
  }
}
