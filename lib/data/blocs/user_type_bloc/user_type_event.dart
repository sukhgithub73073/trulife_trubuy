part of 'user_type_bloc.dart';

sealed class UserTypeEvent extends Equatable {
  const UserTypeEvent();
}

class ChangeUserTypeEvent extends UserTypeEvent {
  final String type;

  const ChangeUserTypeEvent({required this.type});

  @override
  List<Object?> get props => [type];
}
