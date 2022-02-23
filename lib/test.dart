import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class TestScreen extends StatelessWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              String message = "sdkfjskdfsdfsdhf";
              Share.share('$message');
            },
            icon: const Icon(Icons.share),
          ),
        ],
        title: Text('TestScreen'),
      ),
      body: Center(
        child: Text('Share botton '),
      ),
    );
  }
}
