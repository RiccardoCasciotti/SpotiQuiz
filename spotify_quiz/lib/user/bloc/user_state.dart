part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {}

class InitialState extends UserState {
  @override
  List<Object?> get props => [];
}

class UserAdding extends UserState {
  @override
  List<Object?> get props => [];
}

class UserAdded extends UserState {
  @override
  List<Object?> get props => [];
}

class UserError extends UserState {
  final String error;

  UserError(this.error);

  @override
  List<Object?> get props => [error];
}

class UserLoading extends UserState {
  @override
  List<Object?> get props => [];
}

// ignore: must_be_immutable
class UserLoaded extends UserState {
  List<User> mydata;
  UserLoaded(this.mydata);

  @override
  List<Object?> get props => [mydata];
}
