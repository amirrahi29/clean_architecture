part of 'comment_cubit.dart';

abstract class CommentState extends Equatable {
  const CommentState();
}

class CommentInitial extends CommentState {
  @override
  List<Object> get props => [];
}

class CommentLoading extends CommentState {
  @override
  List<Object> get props => [];
}

class CommentLoadingFailed extends CommentState {
  String? msg;

  CommentLoadingFailed(this.msg);

  @override
  List<Object> get props => [];
}

class CommentLoadingSuccess extends CommentState {
  List<CommentModel>? myList;

  CommentLoadingSuccess(this.myList);

  @override
  List<Object> get props => [];
}
