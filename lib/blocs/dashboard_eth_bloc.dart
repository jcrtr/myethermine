import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:myethermine/models/balance.dart';
import 'package:myethermine/repositories/repositories.dart';

part 'dashboard_eth_event.dart';
part 'dashboard_eth_state.dart';

class DashboardEthBloc extends Bloc<DashboardEthEvent, DashboardEthState> {
  final DashboardEthRepository dashboardEthRepository;

  DashboardEthBloc({this.dashboardEthRepository})
      : assert(dashboardEthRepository != null),
        super(DashboardEthEmpty());

  @override
  Stream<DashboardEthState> mapEventToState(DashboardEthEvent event,) async* {
    if (event is DashboardEthRequested) {
      yield* _mapDashboardEthRequestedToState(event);
    }
  }

  Stream<DashboardEthState> _mapDashboardEthRequestedToState (DashboardEthEvent event,) async* {
    yield DashboardEthLoading();
    try {
      final Balance balance = await dashboardEthRepository.fetchDashboardEth();
      yield DashboardEthLoadSuccess(balance: balance);
    } catch (_) {
      yield DashboardEthError();
    }
  }
}
