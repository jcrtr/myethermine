import 'package:equatable/equatable.dart';

class ErrorMes extends Equatable {
  final String status;
  final String error;

  ErrorMes({
    this.status,
    this.error,
  });

  @override
  List<Object> get props => [
    this.status,
    this.error,
  ];

  static ErrorMes fromJson(dynamic json) {
    return ErrorMes(
      // Status
      status: json['status'],
      error: json['error'],
    );
  }
}
