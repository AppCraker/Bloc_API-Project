part of 'post_bloc.dart';

@immutable
sealed class PostState {}

abstract class PostsActionState extends PostState{}

final class PostInitial extends PostState {}

class PostFetchingSuccessfulState extends PostState{

final List<PostDataUiModel> posts;

  PostFetchingSuccessfulState({required this.posts});
}