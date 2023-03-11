import 'package:clean_architecture/Common/AllDimensions.dart';
import 'package:clean_architecture/MyBlogs/domain/entities/PostEntity.dart';
import 'package:clean_architecture/MyBlogs/presentation/cubit/PostCubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  final titleController = TextEditingController();
  final bodyController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text("Add Post"),
      ),
      body: Container(
        margin: EdgeInsets.all(AllDimensions.eight),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                    fillColor: Colors.grey[200], hintText: 'Enter title'),
              ),
              TextField(
                controller: bodyController,
                decoration: InputDecoration(
                    fillColor: Colors.grey[200], hintText: 'Enter body'),
              ),
              SizedBox(
                height: AllDimensions.sixteen,
              ),
              BlocBuilder<PostCubit, PostState>(builder: (context, state) {
                if (state is PostLoading) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (state is PostLoadingForm) {
                  return Center(
                    child: Text(state.msg.toString()),
                  );
                }
                return Center(
                  child: Text(state.toString()),
                );
              }),
              SizedBox(
                height: AllDimensions.sixteen,
              ),
              ElevatedButton(
                  onPressed: () {
                    PostEntity postEntity = PostEntity(
                        title: titleController.text, body: bodyController.text);
                    BlocProvider.of<PostCubit>(context).addPost(postEntity);
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ),
    ));
  }
}
