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
            height: 360.0,
            width: 180.0,
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // to-do: navigate to the camera
        },
        label: const Text(
          'Tu turno',
          style: TextStyle(
            color: Colors.white, 
            fontSize: 20.0,
          ),
        ),
        foregroundColor: Colors.white,
        backgroundColor: const Color.fromRGBO(97, 137, 255, 1),
        icon: const Icon(Icons.camera_alt_outlined),
      ),
    );
  }
}
