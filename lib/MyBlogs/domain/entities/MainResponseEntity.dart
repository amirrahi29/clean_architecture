import 'package:equatable/equatable.dart';

class MainResponseEntity extends Equatable {
  int? statusCode;
  bool? success;
  String? msg;
  Object? data;

  MainResponseEntity({this.statusCode, this.success, this.msg, this.data});

  @override
  // TODO: implement props
  List<Object?> get props => [statusCode, success, msg, data];
}
