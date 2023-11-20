import 'package:flutter/material.dart';

class Station extends StatefulWidget {
  const Station({super.key});

  @override
  State<Station> createState() => _StationState();
}

class _StationState extends State<Station> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text('Station'));
  }
}
