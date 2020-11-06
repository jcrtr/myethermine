import 'package:equatable/equatable.dart';

class Dashboard extends Equatable {
  final double coinsPerMin;
  final double usdPerMin;
  final double btcPerMin;
  final double currentHashrate;
  final double averageHashrate;
  final int reportedHashrate;
  final int validShares;
  final int invalidShares;
  final int staleShares;
  final int activeWorkers;
  final int unpaid;

  Dashboard({
    // this.status,
    this.coinsPerMin,
    this.usdPerMin,
    this.btcPerMin,
    this.currentHashrate,
    this.averageHashrate,
    this.reportedHashrate,
    this.validShares,
    this.invalidShares,
    this.staleShares,
    this.activeWorkers,
    this.unpaid,
  });

  @override
  List<Object> get props => [
    coinsPerMin,
    usdPerMin,
    btcPerMin,
    currentHashrate,
    averageHashrate,
    reportedHashrate,
    validShares,
    invalidShares,
    staleShares,
    activeWorkers,
    unpaid
  ];

  static Dashboard fromJson(dynamic json) {
    final data = json['data'];
    return Dashboard(
      // Payments
      activeWorkers: data['activeWorkers'],
      unpaid: data['unpaid'],
      //
      coinsPerMin: data['coinsPerMin'],
      usdPerMin: data['usdPerMin'],
      btcPerMin: data['btcPerMin'],
      // Hashrate
      currentHashrate: data['currentHashrate'],
      averageHashrate: data['averageHashrate'],
      reportedHashrate: data['reportedHashrate'],
      // Shares
      validShares: data['validShares'],
      invalidShares: data['invalidShares'],
      staleShares: data['staleShares'],
    );
  }
}
