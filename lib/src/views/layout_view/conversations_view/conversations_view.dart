import 'package:flutter/material.dart';

class ConversationsView extends StatelessWidget {
  const ConversationsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conversations'),
      ),
      body: Container(
        color: Colors.pinkAccent,
      ),
    );
  }
}
