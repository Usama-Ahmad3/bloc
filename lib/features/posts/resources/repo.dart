import 'dart:convert';

import 'package:state_management/features/posts/models/PostUiModels.dart';
import 'package:http/http.dart' as http;

class Repo{
  static Future<List<PostUiModels>> get() async {
    try{
      List<PostUiModels> posts = [];
      final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      var data = jsonDecode(response.body);
      for(Map i in data){
        posts.add(PostUiModels.fromJson(i));
      }
      return posts;
    }catch(e){
      return [];
    }
  }
  static Future<bool> addPost()async{
    try{
      final response = await http.post(Uri.parse('https://jsonplaceholder.typicode.com/posts'),body: {
        'title':'Usama',
        'body':'Ahmad',
        'userId':'100',
      });
      if(response.statusCode == 200){
        return true;
      }else{
        return false;
      }
    }catch(e){
      return false;
    }
  }
}