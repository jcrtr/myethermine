part of 'dashboard_eth_bloc.dart';

@immutable
abstract class DashboardEthEvent  extends Equatable{
  const DashboardEthEvent();
}

class DashboardEthRequested extends DashboardEthEvent{
  const DashboardEthRequested();

  @override
  List<Object> get props => [];
}