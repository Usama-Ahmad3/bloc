import 'package:flutter/material.dart';
import 'package:state_management/features/posts/bloc/post_bloc.dart';
import 'package:state_management/features/posts/bloc/post_state.dart';

import '../bloc/post_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostsPage extends StatefulWidget {
  const PostsPage({super.key});

  @override
  State<PostsPage> createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  final PostBloc postBloc = PostBloc();

  @override
  void initState() {
    postBloc.add(InitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Posts'),
        centerTitle: true,
        backgroundColor: Colors.tealAccent,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          postBloc.add(PostAddEvent());
        },
        child: const Icon(Icons.add),
      ),
      body: BlocConsumer<PostBloc, PostState>(
        bloc: postBloc,
        listenWhen: (previous, current) => current is PostActionState,
        buildWhen: (previous, current) => current is !PostActionState,
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          switch(state.runtimeType){
            case PostLoadingState:
              return const Center(child: CircularProgressIndicator());
            case InitialFetchState:
              final successState = state as InitialFetchState;
              return ListView.builder(
                itemCount: successState.postUiModels.length,
              itemBuilder: (context, index) {
                return  Container(
                  color: Colors.grey.shade200,
                  margin: const EdgeInsets.all(16),
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Text(successState.postUiModels[index].userId.toString()),
                      Text(successState.postUiModels[index].title.toString()),
                      Text(successState.postUiModels[index].body.toString()),
                    ],
                  ),
                );
              },);
            case PostErrorState:
              return Center(
                child: Container(
                    color: Colors.red,
                    height: 100,
                    width: 100,
                    child: const Center(child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text('SomeThing Goes Wrong',style: TextStyle(color: Colors.white),),
                    ),)),
              );
            default:
              return const SizedBox();
          }
        },
      ),
    );
  }
}
