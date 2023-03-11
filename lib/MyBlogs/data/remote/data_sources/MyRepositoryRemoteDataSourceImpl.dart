import 'dart:convert';
import 'package:clean_architecture/Common/Config.dart';
import 'package:clean_architecture/MyBlogs/data/remote/data_sources/MyRepositoryRemoteDataSource.dart';
import 'package:clean_architecture/MyBlogs/data/remote/models/MainResponseModel.dart';
import 'package:clean_architecture/MyBlogs/domain/entities/PostEntity.dart';

class MyRepositoryRemoteDataSourceImpl extends MyRepositoryRemoteDataSource {
  @override
  Future<MainResponseModel> addNotes(PostEntity postEntity) async {
    try {
      var response = await Config.client
          .post(Uri.parse("${Config.baseUrl}${Config.postUrl}"), body: {
        "title": postEntity.title,
        "body": postEntity.body,
        "userId": "1"
      });
      var convertedJson = jsonDecode(response.body);
      return MainResponseModel(
          statusCode: response.statusCode,
          success: true,
          msg: 'Note added',
          data: convertedJson);
    } catch (e) {
      return MainResponseModel(
          statusCode: Config.FOUR_HUNDRED_STATUS,
          success: false,
          msg: e.toString(),
          data: null);
    }
  }

  @override
  Future<MainResponseModel> getAllComments(int postId) async {
    try {
      var response = await Config.client.get(
          Uri.parse(
              "${Config.baseUrl}${Config.postUrl}/${postId}${Config.commentUrl}"),
          headers: {'Content-Type': 'application/json'});
      var convertedJson = jsonDecode(response.body);
      if (response.statusCode == Config.TWO_HUNDRED_STATUS) {
        return MainResponseModel(
            statusCode: response.statusCode,
            success: true,
            msg: 'All comments loaded',
            data: convertedJson);
      } else {
        return MainResponseModel(
            statusCode: Config.THREE_HUNDRED_STATUS,
            success: false,
            msg: 'No comments added',
            data: convertedJson);
      }
    } catch (e) {
      return MainResponseModel(
          statusCode: Config.FOUR_HUNDRED_STATUS,
          success: false,
          msg: e.toString(),
          data: null);
    }
  }

  @override
  Future<MainResponseModel> getAllNotes() async {
    try {
      var response = await Config.client.get(
          Uri.parse("${Config.baseUrl}${Config.postUrl}"),
          headers: {'Content-Type': 'application/json'});
      var convertedJson = jsonDecode(response.body);
      if (response.statusCode == Config.TWO_HUNDRED_STATUS) {
        return MainResponseModel(
            statusCode: response.statusCode,
            success: true,
            msg: 'All posts loaded',
            data: convertedJson);
      } else {
        return MainResponseModel(
            statusCode: Config.THREE_HUNDRED_STATUS,
            success: false,
            msg: 'No posts added',
            data: convertedJson);
      }
    } catch (e) {
      return MainResponseModel(
          statusCode: Config.FOUR_HUNDRED_STATUS,
          success: false,
          msg: e.toString(),
          data: null);
    }
  }
}
