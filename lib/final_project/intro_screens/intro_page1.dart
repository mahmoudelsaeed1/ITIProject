import 'package:flutter/material.dart';

class Intropage1 extends StatelessWidget {
  const Intropage1({Key? key}) : super(key: key);

  // Replace this URL with the actual Firebase Storage URL of your image
  final String imageUrl = 'https://firebasestorage.googleapis.com/v0/b/itiproject-25f76.appspot.com/o/images%2F1.jpg?alt=media&token=515860fb-cb95-4d9b-837f-35125b8c2cd6';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(imageUrl),
      ),
    );
  }
}
