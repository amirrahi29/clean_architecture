import 'package:clean_architecture/Common/route/OnPageGenerateRoute.dart';
import 'package:clean_architecture/MyBlogs/presentation/cubit/CommentCubit/comment_cubit.dart';
import 'package:clean_architecture/MyBlogs/presentation/cubit/PostCubit/post_cubit.dart';
import 'package:clean_architecture/MyBlogs/presentation/pages/AllPost.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'Common/InjectionContainer.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<PostCubit>(create: (_) => di.sl<PostCubit>()),
        BlocProvider<CommentCubit>(create: (_) => di.sl<CommentCubit>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          onGenerateRoute: OnPageGenerateRoute.route,
          initialRoute: '/',
          routes: {
            "/": (context) {
              return AllPost();
            }
          }),
    );
  }
}
