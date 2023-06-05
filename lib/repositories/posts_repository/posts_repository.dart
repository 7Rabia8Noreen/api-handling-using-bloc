

import 'package:api_handling_using_bloc/models/post_model.dart';
import 'package:api_handling_using_bloc/networks/network_client.dart';

class PostsRepository{

  NetworkClient networkClient=NetworkClient();
   
  Future<List<PostModel>> getPosts() async{
    print('api calling');
    try{
      print('api called');
        final response= await networkClient.get("/posts", {});
        print('api data ferched');
        print('Response '+response.toString());
        List<dynamic> postsMap= response.data;
        return postsMap.map((postMap) => PostModel.fromJson(postMap)).toList();
    }
    catch(ex){
      print('ettttt  '+ex.toString());
      throw ex;
      
    }
  }
}