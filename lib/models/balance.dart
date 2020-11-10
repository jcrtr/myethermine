import 'package:equatable/equatable.dart';

class Balance extends Equatable {
  // final String status;
  final String result;

  Balance({
    // this.status,
    this.result,
  });

  @override
  List<Object> get props => [
    // this.status,
    this.result,
  ];

  static Balance fromJson(dynamic json) {
    return Balance(
      // Status
      // status: json['status'],
      result: json['result'],
    );
  }
}
