part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class Create extends UserEvent {
  final String uid;
  final String username;
  int level = 0;
  int numOfQuiz = 0;
  int experience = 0;
  int coins = 0;

  Create(this.uid, this.username, this.level, this.coins, this.experience,
      this.numOfQuiz);
}

class GetData extends UserEvent {
  GetData();
}

class GetDataByID extends UserEvent {
  final String uid;

  GetDataByID(this.uid);
}
