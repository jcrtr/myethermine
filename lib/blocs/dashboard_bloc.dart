import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

import '../repositories/repositories.dart';
import '../models/models.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc extends Bloc<DashboardEvent, DashboardState> {
  final DashboardRepository dashboardRepository;

  DashboardBloc({@required this.dashboardRepository})
      : assert(dashboardRepository != null),
        super(DashboardEmpty());

  @override
  Stream<DashboardState> mapEventToState(DashboardEvent event) async* {
    if (event is DashboardRequested) {
      yield* _mapDashboardRequestedToState(event);
    } else if (event is DashboardRefreshRequested) {
      yield* _mapDashboardRefreshRequestedToState(event);
    }
  }

  Stream<DashboardState> _mapDashboardRequestedToState(DashboardRequested event) async* {
    yield DashboardLoading();
    try {
      final Dashboard dashboard = await dashboardRepository.fetchDashboard();
      yield DashboardLoadSuccess(dashboard: dashboard);
    } catch (_) {
      final ErrorMes error = await dashboardRepository.fetchDashboardError();
      yield DashboardError(error: error);
    }
  }

  Stream<DashboardState> _mapDashboardRefreshRequestedToState(DashboardRefreshRequested event) async* {
    yield DashboardLoading();
    try {
      final Dashboard dashboard = await dashboardRepository.fetchDashboard();
      yield DashboardLoadSuccess(dashboard: dashboard);
    } catch (_) {}
  }
}
