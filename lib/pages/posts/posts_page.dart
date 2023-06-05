import 'package:api_handling_using_bloc/cubits/posts_cubit/posts_cubit.dart';
import 'package:api_handling_using_bloc/cubits/posts_cubit/posts_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatelessWidget {
  const PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Posts'),
      ),
      body: BlocConsumer<PostsCubit, PostsState>(
        builder: (context, state) {
          if(state is PostsLoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          else if(state is PostsLoadedState){
            return ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
               return ListTile(
                   title: Text(state.posts[index].title!),
                   subtitle: Text(state.posts[index].body!),
               );
            },);
          }
          else{
            return Text('An error ocurred');
          }
        },
         listener: (context, state) {
            if(state is PostsErrorState){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: Colors.red,
                  content: Text(state.errorMessage))
              );
            }
         },),
    );
  }
}