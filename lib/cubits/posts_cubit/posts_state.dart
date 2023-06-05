import 'package:api_handling_using_bloc/models/post_model.dart';

abstract class PostsState{}

class PostsLoadingState extends PostsState{}

class PostsLoadedState extends PostsState{
  final List<PostModel> posts;
  PostsLoadedState(this.posts);
}

class PostsErrorState extends PostsState{
  final String errorMessage;
  PostsErrorState(this.errorMessage);
}