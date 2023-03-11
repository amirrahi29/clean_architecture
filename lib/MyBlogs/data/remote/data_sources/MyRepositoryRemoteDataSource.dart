import 'package:clean_architecture/MyBlogs/data/remote/models/MainResponseModel.dart';
import 'package:clean_architecture/MyBlogs/domain/entities/PostEntity.dart';

abstract class MyRepositoryRemoteDataSource{

  Future<MainResponseModel> addNotes(PostEntity postEntity);
  Future<MainResponseModel> getAllNotes();
  Future<MainResponseModel> getAllComments(int postId);

}