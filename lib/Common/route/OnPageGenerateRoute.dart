import 'package:clean_architecture/Common/route/PageConstants.dart';
import 'package:clean_architecture/MyBlogs/domain/entities/PostEntity.dart';
import 'package:clean_architecture/MyBlogs/presentation/pages/AddPost.dart';
import 'package:clean_architecture/MyBlogs/presentation/pages/AllComments.dart';
import 'package:clean_architecture/MyBlogs/presentation/pages/AllPost.dart';
import 'package:clean_architecture/MyBlogs/presentation/pages/ErrorPage.dart';
import 'package:flutter/material.dart';

class OnPageGenerateRoute {
  static Route<dynamic> route(RouteSettings settings) {

    var args = settings.arguments;

    switch (settings.name) {
      case PageConstants.addPost:
        {
          return materialPageRoute(widget: AddPost());
        }
      case PageConstants.allPost:
        {
          return materialPageRoute(widget: AllPost());
        }
      case PageConstants.allComment:
        {
          if(args is PostEntity){
            return materialPageRoute(widget: AllComments(postEntity: args));
          }else{
            return materialPageRoute(widget: ErrorPage());
          }
        }
      default:
        {
          return materialPageRoute(widget: ErrorPage());
        }
    }
  }
}

MaterialPageRoute materialPageRoute({required Widget widget}) {
  return MaterialPageRoute(builder: (_) => widget);
}
