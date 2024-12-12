part of 'user_type_bloc.dart';

sealed class UserTypeState extends Equatable {
  const UserTypeState();
}

final class UserTypeInitial extends UserTypeState {
  @override
  List<Object> get props => [];
}
final class UserTypeLoading extends UserTypeState {
  @override
  List<Object> get props => [];
}
final class UserTypeUser extends UserTypeState {
  @override
  List<Object> get props => [];
}

final class UserTypeVendor extends UserTypeState {
  @override
  List<Object> get props => [];
}

final class UserTypeRyder extends UserTypeState {
  @override
  List<Object> get props => [];
}
final class UserTypeTruOrder extends UserTypeState {
  @override
  List<Object> get props => [];
}