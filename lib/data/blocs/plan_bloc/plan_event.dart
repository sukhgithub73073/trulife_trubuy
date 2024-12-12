part of 'plan_bloc.dart';

sealed class PlanEvent extends Equatable {
  const PlanEvent();
}

class GetPlanEvent extends PlanEvent {
  const GetPlanEvent();

  @override
  List<Object?> get props => [];
}
