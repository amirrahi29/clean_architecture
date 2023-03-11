import 'package:clean_architecture/MyBlogs/data/remote/models/MainResponseModel.dart';
import 'package:clean_architecture/MyBlogs/domain/entities/PostEntity.dart';
import 'package:clean_architecture/MyBlogs/domain/repositories/MyRepository.dart';

class AddNotesUseCases {
  final MyRepository myRepository;
  AddNotesUseCases({required this.myRepository});

  Future<MainResponseModel> call(PostEntity postEntity) async {
    return myRepository.addNotes(postEntity);
  }
}
