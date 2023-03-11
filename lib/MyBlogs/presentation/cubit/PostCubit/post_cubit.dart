import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:clean_architecture/Common/Config.dart';
import 'package:clean_architecture/MyBlogs/data/remote/models/PostModel.dart';
import 'package:clean_architecture/MyBlogs/domain/entities/PostEntity.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/use_cases/AddNotesUseCases.dart';
import '../../../domain/use_cases/AllPostUseCases.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  final AddNotesUseCases addNotesUseCases;
  final AllPostUseCases allPostUseCases;

  PostCubit({required this.addNotesUseCases, required this.allPostUseCases})
      : super(PostInitial());

  Future<void> addPost(PostEntity postEntity) async {
    emit(PostLoading());
    try {
      var response = await addNotesUseCases.call(postEntity);
      emit(PostLoadingForm(
          msg: response.msg,
          statusCode: response.statusCode,
          success: response.success));
    } on SocketException catch (e) {
      emit(PostLoadingForm(
          msg: e.toString(),
          statusCode: Config.FOUR_HUNDRED_STATUS,
          success: false));
    }
  }

  Future<void> allPost() async {
    emit(PostLoading());
    try {
      var response = await allPostUseCases.call();
      var myList =
          (response.data as List).map((e) => PostModel.fromJson(e)).toList();
      emit(PostLoadingSuccess(myList));
    } on SocketException catch (e) {
      emit(PostLoadingFailed(e.toString()));
    }
  }
}
