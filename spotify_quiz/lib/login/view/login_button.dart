import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/authentication/web_view/web_view_login.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/login/login.dart';
import 'package:spotify_quiz/authentication/bloc/authentication_bloc.dart';
import 'package:spotify_quiz/repositories/user/user_repository.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

//Here is where we click the button to open the WebViewer
class LoginButton extends StatelessWidget {
  const LoginButton({super.key});
  @override
  Widget build(BuildContext context) {
    final UserRepository userRepository = UserRepository();
    return MaterialButton(
      key: const Key('LoginButton'),
      onPressed: () async {
        var userTest = await userRepository.getByID("11136145170");

        // ignore: use_build_context_synchronously
        if (utilities.runningTest) {
          utilities.refreshToken = userTest!.refreshToken;
          context.read<AuthenticationBloc>().user = userTest;
          context.read<LoginBloc>().add(const LoginSubmitted());
        }
        // ignore: use_build_context_synchronously
        else {
          await Navigator.of(context).push(
            MaterialPageRoute(builder: (context) {
              return BlocProvider.value(
                value: BlocProvider.of<LoginBloc>(context),
                child: const WebViewLogin(),
              );

              //return WebViewLogin();
            }),
          );
        }
        // ignore: use_build_context_synchronously
        //context.read<LoginBloc>().add(const LoginSubmitted());
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: const Color.fromRGBO(54, 217, 174, 1),
      //hoverColor: const Color.fromRGBO(60, 187, 171, 1),
      highlightColor: const Color.fromRGBO(60, 187, 171, 1),
      //focusColor: const Color.fromRGBO(60, 187, 171, 1),
      splashColor: const Color.fromRGBO(60, 187, 171, 1),
      child: CustomText(
        text: "Login with Spotify",
        size: 25,
        secondColor: true,
        bold: true,
        italic: true,
      ),
    );
  }
}
