import 'package:bloc/bloc.dart';
import 'package:clean_architecture/MyBlogs/data/remote/models/CommentModel.dart';
import 'package:equatable/equatable.dart';
import '../../../domain/use_cases/AllCommentUseCases.dart';

part 'comment_state.dart';

class CommentCubit extends Cubit<CommentState> {

  final AllCommentUseCases allCommentUseCases;
  CommentCubit({required this.allCommentUseCases}) : super(CommentInitial());

  Future<void> getAllComments(int postId) async{
    emit(CommentLoading());
    try {
      var response = await allCommentUseCases.call(postId);
      var myList = (response.data as List).map((e) => CommentModel.fromJson(e)).toList();
      emit(CommentLoadingSuccess(myList));
    } catch (e) {
      emit(CommentLoadingFailed(e.toString()));
    }
  }

}
