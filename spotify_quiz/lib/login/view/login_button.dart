import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/authentication/web_view/web_view_login.dart';
import 'package:spotify_quiz/custom_widgets/text.dart';
import 'package:spotify_quiz/login/login.dart';
import 'package:spotify_quiz/authentication/bloc/authentication_bloc.dart';
import 'package:spotify_quiz/repositories/user/user_repository.dart';

import 'package:spotify_quiz/utility/utilities.dart' as utilities;

import 'package:flutter/material.dart';

import '../../utility/api_calls.dart';

class AnimatedLoginButton extends StatefulWidget {
  const AnimatedLoginButton({Key? key}) : super(key: key);

  @override
  AnimatedLoginButtonState createState() => AnimatedLoginButtonState();
}

class AnimatedLoginButtonState extends State<AnimatedLoginButton>
    with SingleTickerProviderStateMixin {
  bool _isVisible = false;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    // Delay the visibility of the button to start the animation after a certain duration
    Future.delayed(const Duration(milliseconds: 500), () {
      if (mounted) {
        setState(() {
          _isVisible = true;
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: _isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      child: const LoginButton(),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

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
          utilities.artists = await get_followed_artists();
          if (utilities.artists == []) {
            utilities.artists =
                await get_related_artists("0TnOYISbd1XYRBk9myaseg");
          }
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
           utilities.artists = await get_followed_artists();
          if (utilities.artists == []) {
            utilities.artists =
                await get_related_artists("0TnOYISbd1XYRBk9myaseg");
          }
           print(utilities.artists.toString());
        }
        // ignore: use_build_context_synchronously
        //context.read<LoginBloc>().add(const LoginSubmitted());
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      color: const Color.fromRGBO(54, 217, 174, 1),
      highlightColor: const Color.fromRGBO(60, 187, 171, 1),
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


  /*
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
*/