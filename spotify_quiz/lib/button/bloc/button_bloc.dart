import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'button_event.dart';
part 'button_state.dart';

class ButtonBloc extends Bloc<ButtonEvent, ButtonState> {
  ButtonBloc() : super(const ButtonState()) {
    on<ButtonPressed>(_onButtonPressed);
  }

  void _onButtonPressed(ButtonPressed event, Emitter<ButtonState> emit) {
    final status = !event.status;
    debugPrint(event.status.toString());
    return emit(state.copyWith(status: status));
  }
}
