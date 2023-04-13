import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:spotify_quiz/repositories/user/user_repository.dart';

import '../../models/user.dart';
import 'dart:io';
part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(InitialState()) {
    on<Create>((event, emit) async {
      emit(UserAdding());
      await Future.delayed(const Duration(seconds: 1));
      try {
        await userRepository.create(
          uid: event.uid,
          username: event.username,
          level: event.level,
          numOfQuiz: event.numOfQuiz,
          experience: event.experience,
          nation: event.nation,
          bestScore: event.bestScore,
        );
        emit(UserAdded());
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
    on<GetData>((event, emit) async {
      emit(UserLoading());
      await Future.delayed(const Duration(seconds: 1));
      try {
        final data = await userRepository.get();
        emit(UserLoaded(data));
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
    on<GetDataByID>((event, emit) async {
      emit(UserLoading());
      await Future.delayed(const Duration(seconds: 1));
      try {
        final data = await userRepository.getByID(event.uid);
        if (data != null) {
          emit(UserFound(data));
        } else {
          emit(UserNotFound());
        }
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
    on<CheckDataByID>((event, emit) async {
      emit(UserLoading());
      await Future.delayed(const Duration(seconds: 1));
      try {
        final data = await userRepository.getByID(event.uid);
        if (data != null) {
          emit(UserFound(data));
        } else {
          emit(UserAdding());
          await Future.delayed(const Duration(seconds: 1));
          try {
            await userRepository.create(
              uid: event.uid,
              username: event.username,
              level: event.level,
              numOfQuiz: event.numOfQuiz,
              experience: event.experience,
              nation: event.nation,
              bestScore: event.bestScore,
            );
            final newUser = await userRepository.getByID(event.uid);
            if (newUser != null) {
              emit(UserFound(newUser));
            } else {
              emit(UserError("User not created correctly"));
            }
          } catch (e) {
            emit(UserError(e.toString()));
          }

          emit(UserNotFound());
        }
      } catch (e) {
        emit(UserError(e.toString()));
      }
    });
  }
}
