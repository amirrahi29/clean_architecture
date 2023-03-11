import 'package:clean_architecture/MyBlogs/data/remote/models/MainResponseModel.dart';
import 'package:clean_architecture/MyBlogs/domain/repositories/MyRepository.dart';

class AllCommentUseCases{

  final MyRepository myRepository;
  AllCommentUseCases({required this.myRepository});

  Future<MainResponseModel> call(int postId)async{
    return myRepository.getAllComments(postId);
  }

}