part of 'plan_bloc.dart';

sealed class PlanState extends Equatable {
  const PlanState();
}

final class PlanInitial extends PlanState {
  @override
  List<Object> get props => [];
}
final class PlanLoading extends PlanState {
  @override
  List<Object> get props => [];
}
final class PlanLoaded extends PlanState {
  final List<Datum> planList;

  PlanLoaded({required this.planList});

  @override
  List<Object> get props => [planList];
}

final class PlanError extends PlanState {
  final String error ;

  PlanError({required this.error});
  @override
  List<Object> get props => [error];
}
