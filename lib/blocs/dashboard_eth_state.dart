part of 'dashboard_eth_bloc.dart';

@immutable
abstract class DashboardEthState extends Equatable {
  const DashboardEthState();

  @override
  List<Object> get props => [];
}

class DashboardEthEmpty extends DashboardEthState {}

class DashboardEthLoading extends DashboardEthState {}

class DashboardEthLoadSuccess extends DashboardEthState {
  final Balance balance;

  @required
  DashboardEthLoadSuccess({this.balance}) : assert(balance != null);

  @override
  List<Object> get props => [balance];
}

class DashboardEthError extends DashboardEthState {}