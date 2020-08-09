import 'package:flutter/material.dart';

import './connections.dart';

class ConnectionsManager extends StatefulWidget {
  final String startingConnection;

  Connections({this.startingConnection = 'Kim'}) {
    print('Check');
  }

  @override
  State<StatefulWidget> createState() {
    return _ConnectionsManagerState();
  }
}

class _ConnectionsManagerState extends State<ConnectionsManager> {
  List<String> _connections = [];

  @override
  void initState() {
    _connections.add(widget.startingConnection);
    super.initState();
  }

  @override
  void didUpdateWidget(ConnectionsManager oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(10.0), 
            child: RaisedButton(
              color: Theme.of(context).primaryColor,
              onPressed: () {
                  setState(() {
                    _connections.add('Tony');
                  });
              }, 
              child: Text('Add Connection'),
            ),
          ),
          Connections(_connections)
      ],
    );
  }
}