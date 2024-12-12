import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trubuy/all_enums/user_type_enum.dart';

part 'user_type_event.dart';

part 'user_type_state.dart';

class UserTypeBloc extends Bloc<UserTypeEvent, UserTypeState> {
  UserTypeBloc() : super(UserTypeInitial()) {
    on<ChangeUserTypeEvent>(_changeUserType);
  }

  FutureOr<void> _changeUserType(
      ChangeUserTypeEvent event, Emitter<UserTypeState> emit) {
    emit(UserTypeLoading());
    if (event.type == UserTypeEnum.User.name) {
      emit(UserTypeUser());
    } else if (event.type == UserTypeEnum.Vendor.name) {
      emit(UserTypeVendor());
    } else if (event.type == UserTypeEnum.Ryder.name) {
      emit(UserTypeRyder());
    } else if (event.type == UserTypeEnum.TruOrder.name) {
      emit(UserTypeTruOrder());
    }
  }
}
