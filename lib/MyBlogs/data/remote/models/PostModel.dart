import 'package:clean_architecture/MyBlogs/domain/entities/PostEntity.dart';

class PostModel extends PostEntity {
  int? userId;
  int? id;
  String? title;
  String? body;

  PostModel({this.userId, this.id, this.title, this.body})
      : super(userId: userId, id: id, title: title, body: body);

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
      body: json['body'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }
}
