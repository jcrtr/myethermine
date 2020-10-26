import 'package:equatable/equatable.dart';

class Dashboard extends Equatable{

  final String worker;
  final int reportedHashrate;
  final int currentHashrate;
  final int validShares;
  final int invalidShares;
  final int staleShares;

  Dashboard({
    this.worker,
    this.reportedHashrate,
    this.currentHashrate,
    this.invalidShares,
    this.staleShares,
    this.validShares,
  });

  @override
  List<Object> get props => [
    worker,
    reportedHashrate,
    currentHashrate,
    invalidShares,
    staleShares,
    validShares,
  ];

  static Dashboard fromJson(dynamic json) {
    final workers = json['data']['workers'][0];
    return Dashboard(
      worker: workers['worker'],
      reportedHashrate: workers['reportedHashrate'],
      currentHashrate: workers['currentHashrate'],
      invalidShares: workers['invalidShares'],
      staleShares: workers['staleShares'],
      validShares: workers['validShares'],
    );
  }
  // Dashboard.fromJson(Map<String,dynamic> parsedJson)
  //     : worker = parsedJson['worker'],
  //       reportedHashrate = parsedJson['reportedHashrate'],
  //       currentHashrate = parsedJson['currentHashrate'],
  //       validShares = parsedJson['validShares'],
  //       invalidShares = parsedJson['invalidShares'],
  //       staleShares = parsedJson['staleShares'];
}