import 'package:clean_architecture/Common/AllColors.dart';
import 'package:clean_architecture/Common/AllDimensions.dart';
import 'package:clean_architecture/Common/route/PageConstants.dart';
import 'package:clean_architecture/MyBlogs/presentation/cubit/PostCubit/post_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllPost extends StatefulWidget {
  const AllPost({Key? key}) : super(key: key);

  @override
  State<AllPost> createState() => _AllPostState();
}

class _AllPostState extends State<AllPost> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    BlocProvider.of<PostCubit>(context).allPost();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("All Posts"),
          ),
          body: BlocBuilder<PostCubit,PostState>(
              builder: (context,state){
                print(state);
                if(state is PostLoading){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if(state is PostLoadingFailed){
                  return Center(
                    child: Text(state.msg!),
                  );
                }
                if(state is PostLoadingSuccess){
                  return ListView.builder(
                    itemCount: state.myList!.length,
                      itemBuilder: (context,index){
                      return InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, PageConstants.allComment,
                          arguments: state.myList![index]);
                        },
                        child: Container(
                          color: Colors.grey[200],
                          padding: EdgeInsets.all(AllDimensions.eight),
                          margin: EdgeInsets.all(AllDimensions.eight),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              Text(state.myList![index].title!,style: TextStyle(color: AllColors.greenColor),),
                              Text(state.myList![index].body!,style: TextStyle(color: AllColors.greenColor),),

                            ],
                          ),
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
          floatingActionButton: FloatingActionButton(
            onPressed: (){
              Navigator.pushNamed(context, PageConstants.addPost);
            },
            child: Icon(Icons.add),
          ),
        )
    );
  }
}
