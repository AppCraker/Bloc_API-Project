import 'package:bloc_api/features/posts/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
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
    // TODO: implement initState
    postBloc.add(PostsInitialFetchEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Post Page")),
      body: BlocConsumer<PostBloc, PostState>(
        bloc: postBloc,
        listenWhen: (previous, current) => current is PostsActionState,
        buildWhen: (previous, current) => current is !PostsActionState,
        listener: (context, state) {
         
        },
        builder: (context, state) {
          switch (state.runtimeType) {
            case PostFetchingSuccessfulState:
            final successState = state as PostFetchingSuccessfulState;
             return Container(
            child: ListView.builder(
              itemCount: successState.posts.length,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(children: [
                    Text(successState.posts[index].title)
                  ],),

                );
              },
            ),
          );

            default:
            return const SizedBox();
          }
          
        },
      ),
    );
  }
}
