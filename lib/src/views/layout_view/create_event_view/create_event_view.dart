import 'package:flutter/material.dart';

class AddEventView extends StatelessWidget {
  const AddEventView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Event'),
      ),
      body: Container(
        color: Colors.blueAccent,
      ),
    );
  }
}
