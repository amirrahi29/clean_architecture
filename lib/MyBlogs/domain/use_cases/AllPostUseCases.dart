import 'package:clean_architecture/MyBlogs/data/remote/models/MainResponseModel.dart';
import 'package:clean_architecture/MyBlogs/domain/repositories/MyRepository.dart';

class AllPostUseCases{

  final MyRepository myRepository;

  AllPostUseCases({required this.myRepository});

  Future<MainResponseModel> call()async{
    return myRepository.getAllNotes();
  }

}