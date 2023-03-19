import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spotify_quiz/button/bloc/button_bloc.dart';

import '../bloc/button_bloc.dart';

class ButtonPage extends StatelessWidget {
  const ButtonPage({super.key});

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const ButtonPage());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        //appBar: AppBar(title: const Text('Button Page')),
        builder: (context, child) => BlocProvider(
              create: (context) => ButtonBloc(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  BlocBuilder<ButtonBloc, ButtonState>(
                    builder: (context, state) {
                      return FloatingActionButton(
                    onPressed: () {
                      context.read<ButtonBloc>().add( ButtonPressed(state.status));
                      debugPrint("Button is pressed\n");
                    },
                    tooltip: 'Pressed',
                    child: const Icon(Icons.lightbulb),
                  );
                    },
                  ),
                  //Should I use BlocBuilder just to send an event??
                  BlocBuilder<ButtonBloc, ButtonState>(
                    builder: (context, state) {
                      return Text(state.status.toString(),
                          style: Theme.of(context).textTheme.headline4);
                    },
                  )
                ],
              ),
            ));
  }
}
