import 'package:clean_architecture/Common/AllColors.dart';
import 'package:clean_architecture/Common/AllDimensions.dart';
import 'package:clean_architecture/MyBlogs/domain/entities/PostEntity.dart';
import 'package:clean_architecture/MyBlogs/presentation/cubit/CommentCubit/comment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllComments extends StatefulWidget {

  final PostEntity postEntity;

  const AllComments({Key? key, required this.postEntity}) : super(key: key);

  @override
  State<AllComments> createState() => _AllCommentsState();
}

class _AllCommentsState extends State<AllComments> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<CommentCubit>(context).getAllComments(widget.postEntity.id!);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("All Comments: ${widget.postEntity.id}"),
          ),
          body: BlocBuilder<CommentCubit,CommentState>(
              builder: (context,state){
                print(state);
                if(state is CommentLoading){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state is CommentLoadingFailed){
                  return Center(
                    child: Text(state.msg!),
                  );
                }
                if(state is CommentLoadingSuccess){
                  return ListView.builder(
                      itemCount: state.myList!.length,
                      itemBuilder: (context,index){
                        return Container(
                          color: Colors.grey[200],
                          padding: EdgeInsets.all(AllDimensions.eight),
                          margin: EdgeInsets.all(AllDimensions.eight),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text(state.myList![index].name!,style: TextStyle(color: AllColors.greenColor),),
                              Text(state.myList![index].body!,style: TextStyle(color: AllColors.greenColor),),

                            ],
                          ),
                        );
                      }
                  );
                }
                return Center(
                  child: Text("Error"),
                );
              }
          ),
        )
    );
  }
}
