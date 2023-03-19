// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'button_bloc.dart';

class ButtonState extends Equatable {
  const ButtonState({
    this.status = true
  });

  final bool status;
  
  @override
  List<Object> get props => [status];

  ButtonState copyWith({
    bool? status,
  }) {
    return ButtonState(
      status: status ?? this.status,
    );
  }
}

