import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get_it/get_it.dart';
import 'package:trubuy/data/models/plan_model.dart';
import 'package:trubuy/data/models/response_model.dart';
import 'package:trubuy/data/repository/plan_repo.dart';

part 'plan_event.dart';

part 'plan_state.dart';

class PlanBloc extends Bloc<PlanEvent, PlanState> {
  var planRepository = GetIt.I<PlanRepository>();

  PlanBloc() : super(PlanInitial()) {
    on<GetPlanEvent>(_getPLanListApi);
  }

  Future<FutureOr<void>> _getPLanListApi(
      GetPlanEvent event, Emitter<PlanState> emit) async {
    emit(PlanLoading());
    ResponseModel res = await planRepository.getPlanList(map: {});
    emit(PlanLoaded(planList: res.data));
  }
}
