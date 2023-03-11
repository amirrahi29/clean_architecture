import 'package:clean_architecture/MyBlogs/domain/entities/MainResponseEntity.dart';

class MainResponseModel extends MainResponseEntity {
  int? statusCode;
  bool? success;
  String? msg;
  Object? data;

  MainResponseModel({this.statusCode, this.success, this.msg, this.data})
      : super(statusCode: statusCode, success: success, msg: msg, data: data);

  String toString() {
    return 'statusCode:$statusCode,success:$success,msg:$msg,data:$data';
  }
}
