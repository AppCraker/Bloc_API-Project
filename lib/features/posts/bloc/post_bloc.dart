import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:bloc_api/features/posts/models/post_data_ui_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
   on<PostsInitialFetchEvent>(postsInitialFetchEvent);
  }

  FutureOr<void> postsInitialFetchEvent(PostsInitialFetchEvent event, Emitter<PostState> emit) async {
    var client = http.Client();
    List<PostDataUiModel> posts = [];
try {
  var response = await client.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'));

      List result = jsonDecode(response.body);
      for (int i = 0; i < result.length; i++) {
        PostDataUiModel post = PostDataUiModel.fromMap(result[i] as Map<String,dynamic>);
        posts.add(post);
      }
  print(posts);
  emit(PostFetchingSuccessfulState(posts: posts));
} 
catch(e){
  log(e.toString() as num);
}
  }
}
