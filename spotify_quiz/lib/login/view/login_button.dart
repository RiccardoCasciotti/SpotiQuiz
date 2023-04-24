import 'package:authentication_repository/authentication_repository.dart';
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

    return Scaffold(
      
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: ElevatedButton(
      key: const Key('loginForm_continue_raisedButton'),
      onPressed: () async => {

        await Navigator.of(context).push(
          MaterialPageRoute(builder: (context) {
            // return BlocProvider.value(
            // value: BlocProvider.of<LoginBloc>(context),
            // child: const WebViewLogin(),);

          return BlocProvider(
          create: (context) {
            return LoginBloc(
              authenticationRepository:
                  RepositoryProvider.of<AuthenticationRepository>(context),
            );
          },
          child: const WebViewLogin());
           } ),
        ),
          
     },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(utilities.secondaryColor)),
      child: const Text('Login'),
    )
        ),
      );
    
  }
}


