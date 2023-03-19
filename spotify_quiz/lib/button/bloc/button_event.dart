part of 'button_bloc.dart';

@immutable
abstract class ButtonEvent extends Equatable{
  const ButtonEvent();

  @override
  List<Object> get props => [];
}

class ButtonPressed extends ButtonEvent{
  const ButtonPressed(this.status);
  final bool status;

  @override
  List<Object> get props => [status];
}

