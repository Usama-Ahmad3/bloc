
import 'package:state_management/features/posts/models/PostUiModels.dart';

abstract class PostState {}
abstract class PostActionState extends PostState{}

class PostInitial extends PostState {}
class InitialFetchState extends PostState{
  final List<PostUiModels> postUiModels;

  InitialFetchState({required this.postUiModels});
}
class PostLoadingState extends PostState{}
class PostErrorState extends PostState{}
class PostSuccessAdd extends PostActionState{}
class PostErrorAdd extends PostActionState{}
