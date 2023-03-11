import 'package:equatable/equatable.dart';

class CommentEntity extends Equatable {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentEntity({this.postId, this.id, this.name, this.email, this.body});

  @override
  // TODO: implement props
  List<Object?> get props => [postId, id, name, email, body];
}
