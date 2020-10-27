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
  Stream<DashboardState> mapEventToState(DashboardEvent event,) async* {
    if (event is DashboardFetched) {
      yield DashboardLoading();
      try {
        final Dashboard dashboard = await dashboardRepository.fetchDashboard();
        yield DashboardLoaded(dashboard: dashboard);
      } catch (_) {
        yield DashboardError();
      }
    }
  }
}
