

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:state_management/features/posts/bloc/post_event.dart';
import 'package:state_management/features/posts/models/PostUiModels.dart';

import '../resources/repo.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<InitialFetchEvent>((event, emit) async {
      emit(PostLoadingState());
      try{
        List<PostUiModels> posts = await Repo.get();
        emit(InitialFetchState(postUiModels: posts));
      }catch(e){
        emit(PostErrorState());
      }
  });
    on<PostAddEvent>((event, emit) async {
        bool post = await Repo.addPost();
        print(post);
        if(post == true){
          emit(PostSuccessAdd());
        }else{
          emit(PostErrorAdd());
        }
    });
}
}
