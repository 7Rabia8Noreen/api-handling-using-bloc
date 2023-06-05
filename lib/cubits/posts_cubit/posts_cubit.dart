 import 'package:api_handling_using_bloc/cubits/posts_cubit/posts_state.dart';
import 'package:api_handling_using_bloc/models/post_model.dart';
import 'package:api_handling_using_bloc/repositories/posts_repository/posts_repository.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

class PostsCubit extends Cubit<PostsState>{
  PostsCubit(): super(PostsLoadingState()){
    getPosts();
  }
  PostsRepository postsRepository=PostsRepository();

  void getPosts() async {
    try{
        List<PostModel> posts= await postsRepository.getPosts();
        emit(PostsLoadedState(posts));
    }
     catch(ex){
      emit(PostsErrorState(ex.toString()));
    }
  }
}