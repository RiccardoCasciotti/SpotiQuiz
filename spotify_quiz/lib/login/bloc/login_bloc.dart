import 'package:authentication_repository/authentication_repository.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_quiz/login/login.dart';
import 'package:formz/formz.dart';
import 'package:spotify_quiz/login/models/models.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(const LoginState()) {
    on<LoginSubmitted>(_onSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  Future<void> _onSubmitted(
    LoginSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    emit(state.copyWith(status: FormzStatus.submissionInProgress));
    debugPrint(FormzStatus.submissionInProgress.toString());
    try {
      await _authenticationRepository.logIn(
        username: state.username.value,
        password: state.password.value,
      );
      emit(state.copyWith(status: FormzStatus.submissionSuccess));
      debugPrint(FormzStatus.submissionSuccess.toString());
    } catch (_) {
      emit(state.copyWith(status: FormzStatus.submissionFailure));
      debugPrint(FormzStatus.submissionFailure.toString());
    }
  }
}
