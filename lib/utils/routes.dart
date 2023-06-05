

import 'package:api_handling_using_bloc/cubits/posts_cubit/posts_cubit.dart';
import 'package:api_handling_using_bloc/pages/posts/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Routes{
 final String postsPage= "/postsPage";
 static Route? onGenerateRoute(RouteSettings settings){
  switch(settings.name){
     case "/postsPage":
         return MaterialPageRoute(builder: (context)=>BlocProvider(
          create: (context) => PostsCubit(),
          child: PostsPage()));
       default:
       return null; 
  }
 }
}