import 'package:clean_architecture/MyBlogs/data/remote/data_sources/MyRepositoryRemoteDataSource.dart';
import 'package:clean_architecture/MyBlogs/data/remote/data_sources/MyRepositoryRemoteDataSourceImpl.dart';
import 'package:clean_architecture/MyBlogs/data/repositories/MyRepositoryImpl.dart';
import 'package:clean_architecture/MyBlogs/domain/repositories/MyRepository.dart';
import 'package:clean_architecture/MyBlogs/domain/use_cases/AddNotesUseCases.dart';
import 'package:clean_architecture/MyBlogs/domain/use_cases/AllCommentUseCases.dart';
import 'package:clean_architecture/MyBlogs/domain/use_cases/AllPostUseCases.dart';
import 'package:clean_architecture/MyBlogs/presentation/cubit/CommentCubit/comment_cubit.dart';
import 'package:clean_architecture/MyBlogs/presentation/cubit/PostCubit/post_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

GetIt sl = GetIt.instance;

Future<void> init() async {
  //cubit
  sl.registerLazySingleton<PostCubit>(
      () => PostCubit(addNotesUseCases: sl.call(), allPostUseCases: sl.call()));
  sl.registerLazySingleton<CommentCubit>(
      () => CommentCubit(allCommentUseCases: sl.call()));

  //repository
  sl.registerLazySingleton<MyRepository>(
      () => MyRepositoryImpl(myRepositoryRemoteDataSource: sl.call()));

  //data source
  sl.registerLazySingleton<MyRepositoryRemoteDataSource>(
      () => MyRepositoryRemoteDataSourceImpl());

  //use cases
  sl.registerLazySingleton<AddNotesUseCases>(
      () => AddNotesUseCases(myRepository: sl.call()));
  sl.registerLazySingleton<AllCommentUseCases>(
      () => AllCommentUseCases(myRepository: sl.call()));
  sl.registerLazySingleton<AllPostUseCases>(
      () => AllPostUseCases(myRepository: sl.call()));

  //external
  var client = http.Client();
  sl.registerLazySingleton(() => client);
}
