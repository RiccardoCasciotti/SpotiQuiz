import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const SplashPage());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: Center(
    child: Container(
    margin: const EdgeInsets.all(10.0),
    
    width: 150.0,
    height: 200.0,
    //constraints: BoxConstraints.expand(),
    
    child: Image(
          image: AssetImage("assets/images/logo.png"), fit: BoxFit.cover),
    )));
  }
}