part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable{
  const DashboardEvent();
}

class DashboardRequested extends DashboardEvent {
  const DashboardRequested();

  @override
  List<Object> get props => [];
}

class DashboardRefreshRequested extends DashboardEvent {
  const DashboardRefreshRequested();

  @override
  List<Object> get props => [];
}