import "package:bloc_api/features/home/homepage.dart";
import "package:bloc_api/features/posts/ui/posts_page.dart";
import"package:flutter/material.dart";


void main()async {
  runApp(new MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PostsPage(),
    );
  }
}