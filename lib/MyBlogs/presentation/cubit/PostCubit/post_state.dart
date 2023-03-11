part of 'post_cubit.dart';

abstract class PostState extends Equatable {
  const PostState();
}

class PostInitial extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoading extends PostState {
  @override
  List<Object> get props => [];
}

class PostLoadingFailed extends PostState {
  String? msg;
  PostLoadingFailed(this.msg);
  @override
  List<Object> get props => [];
}

class PostLoadingSuccess extends PostState {
  List<PostModel>? myList;
  PostLoadingSuccess(this.myList);
  @override
  List<Object> get props => [];
}

class PostLoadingForm extends PostState {

  String? msg;
  int? statusCode;
  bool? success;
  PostLoadingForm({this.msg,this.statusCode,this.success});

  @override
  List<Object> get props => [];
}
