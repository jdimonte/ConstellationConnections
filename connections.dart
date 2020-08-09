import 'package:flutter/material.dart';

class Connections extends StatelessWidget {
  final List<String> connections;

  Connections([this.connections = const []]) {
  }

  @override

  Widget build(BuildContext context) {
    return Column(
      children: connections
        .map(
          (element) => Card(
            child: Column(
              children: <Widget>[
                Image.asset('.dart_tool/assets/galaxy.jpg'),
                Text(element)
              ],
            ),
          ),
        )
        .toList(),
    );
  }
}