part of 'user_bloc.dart';


class UserState extends Equatable {
  final FormStatus status;
 final  String error;
  final List<UserModel> users;

  const UserState({
    required this.status,
    required this.error,
    required this.users,
  });

  UserState copyWith({
    FormStatus? status,
    String? error,
    List<UserModel>? users,
  })  {
    return UserState(
      error: error ?? this.error,
      users: users ?? this.users,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [status, error, users];
}
