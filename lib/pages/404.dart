import 'package:flutter/material.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('404'),
      ),
      body: Center(
          child: ElevatedButton(
        child: const Text("返回首页"),
        onPressed: () => {debugPrint("返回")},
      )),
    );
  }
}
