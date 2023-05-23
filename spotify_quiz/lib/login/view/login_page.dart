import 'package:flutter/material.dart';
import 'package:spotify_quiz/login/login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const LoginPage());
  }

  @override
  Widget build(BuildContext context) {
    ImageProvider logo = const AssetImage("assets/images/logo2.png");
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Hero(
              tag: "logo",
              child: Container(
                height: 230,
                width: 230,
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(3.0),
                child: Image(image: logo),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(12),
              child: LoginButton(),
            ),
          ],
        ),
      ),
    );
  }
}
