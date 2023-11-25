import 'package:demo_flu/models/User.dart';
import 'package:flutter/material.dart';

class DetailStation extends StatelessWidget {
  final User user;
  const DetailStation({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.green, title: Text('asdd')),
      body: Center(
          child: Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          // Image.network(user.data.user),
          const SizedBox(
            height: 30,
          ),
          // Text(user.data.user.nickname)
        ],
      )),
    );
  }
}
