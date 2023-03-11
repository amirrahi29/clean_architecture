import 'package:clean_architecture/MyBlogs/domain/entities/CommentEntity.dart';

class CommentModel extends CommentEntity {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  CommentModel({this.postId, this.id, this.name, this.email, this.body})
      : super(postId: postId, id: id, name: name, email: email, body: body);

  factory CommentModel.fromJson(Map<String, dynamic> json) {
    return CommentModel(
      postId: json['postId'],
      id: json['id'],
      name: json['name'],
      email: json['email'],
      body: json['body'],
    );
  }
}
