import 'package:ensenarte/components/menu_button_component.dart';
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
        actions: const [MenuButtonComponent()],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              resourceToLoad!,
              filterQuality: FilterQuality.medium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // to-do: navigate to the camera
          // one-way: record a short video, send to backend, process and next.
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
