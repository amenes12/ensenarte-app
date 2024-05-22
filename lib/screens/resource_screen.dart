import 'package:flutter/material.dart';

class ResourceScreen extends StatelessWidget {
  const ResourceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final arguments =
        ModalRoute.of(context)?.settings.arguments as Map<String, String>?;
    final String? title = arguments?['title'];
    final String? resourceToLoad = arguments?['resourceToLoad'];

    return Scaffold(
      appBar: AppBar(
        title: Text(title!),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          Image.asset(
            resourceToLoad!,
            height: 280.0,
            width: 160.0,
          )
        ]),
      ),
    );
  }
}
