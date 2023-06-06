import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:employment_test/data/models/form_status.dart';
import 'package:employment_test/data/models/user_model.dart';
import 'package:employment_test/data/repositories/user_repository.dart';
import 'package:equatable/equatable.dart';
part 'user_event.dart';

part 'user_state.dart';

class UsersBloc extends Bloc<UserEvent, UserState> {
  UsersBloc({required this.userRepository})
      : super(
          const UserState(status: FormStatus.pure, error: "", users: []),
        ) {
    on<FetchUsers>(_fetchUsers);
  }

  final UserRepository userRepository;

  _fetchUsers(FetchUsers event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: FormStatus.gettingUserLoad));
    try {
      await for (var user in userRepository.getUsers()) {
        emit(
            state.copyWith(status: FormStatus.gettingUserSuccess, users: user));
      }
    } catch (e) {
      emit(state.copyWith(
          error: state.error, status: FormStatus.gettingUserFail));
    }
  }
}
