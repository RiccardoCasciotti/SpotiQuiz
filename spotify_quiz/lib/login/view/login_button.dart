import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/authentication/web_view/web_view_login.dart';
import 'package:spotify_quiz/login/login.dart';
import 'package:spotify_quiz/utility/utilities.dart' as utilities;

//Here is where we click the button to open the WebViewer
class LoginButton extends StatelessWidget {
  const LoginButton({super.key});
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      key: const Key('loginForm_continue_raisedButton'),
      onPressed: () async => {
        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => WebViewLogin()),
        ),
        context.read<LoginBloc>().add(const LoginSubmitted()),
      },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(utilities.secondaryColor)),
      child: const Text('Login'),
    );
  }
}
