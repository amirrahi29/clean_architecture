import 'package:clean_architecture/MyBlogs/data/remote/data_sources/MyRepositoryRemoteDataSource.dart';
import 'package:clean_architecture/MyBlogs/data/remote/models/MainResponseModel.dart';
import 'package:clean_architecture/MyBlogs/domain/entities/PostEntity.dart';
import 'package:clean_architecture/MyBlogs/domain/repositories/MyRepository.dart';

class MyRepositoryImpl extends MyRepository {
  final MyRepositoryRemoteDataSource myRepositoryRemoteDataSource;

  MyRepositoryImpl({required this.myRepositoryRemoteDataSource});

  @override
  Future<MainResponseModel> addNotes(PostEntity postEntity) async =>
      myRepositoryRemoteDataSource.addNotes(postEntity);

  @override
  Future<MainResponseModel> getAllComments(int postId) async =>
      myRepositoryRemoteDataSource.getAllComments(postId);

  @override
  Future<MainResponseModel> getAllNotes() async =>
      myRepositoryRemoteDataSource.getAllNotes();
}
