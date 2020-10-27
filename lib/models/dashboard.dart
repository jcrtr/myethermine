import 'package:equatable/equatable.dart';

class Dashboard extends Equatable{

  final int minPayout;

  final int currentHashrate;
  final int reportedHashrate;
  final int validShares;
  final int invalidShares;
  final int staleShares;
  // final int activeWorkers;

  Dashboard({
    // this.status,
    this.minPayout,
    this.currentHashrate,
    this.reportedHashrate,
    this.validShares,
    this.invalidShares,
    this.staleShares,
    // this.activeWorkers,
  });

  @override
  List<Object> get props => [
    // status,
    minPayout,
    reportedHashrate,
    currentHashrate,
  ];

  static Dashboard fromJson(dynamic json) {
    final data = json['data'];
    return Dashboard(
      minPayout: data['settings']['minPayout'],
      reportedHashrate: data['currentStatistics']['reportedHashrate'],
      // currentHashrate: _data['currentStatistics']['currentHashrate'],
      validShares: data['currentStatistics']['validShares'],
      invalidShares: data['currentStatistics']['invalidShares'],
      staleShares: data['currentStatistics']['staleShares'],
      // activeWorkers: _data['currentStatistics']['activeWorkers'],
    );
  }
}