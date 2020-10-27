part of 'dashboard_bloc.dart';

abstract class DashboardEvent extends Equatable{
  const DashboardEvent();
}

class DashboardFetched extends DashboardEvent {
  const DashboardFetched();

  @override
  List<Object> get props => [];
}