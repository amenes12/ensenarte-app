import 'package:flutter/material.dart';
import 'package:ensenarte/models/learning_item.dart';

class ListComponent extends StatelessWidget {
  final List<LearningItem> elements;

  const ListComponent({super.key, required this.elements});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: elements.length,
      itemBuilder: (context, index) {
        final learningItem = elements[index];
        return GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              elements[index].destinationRoute,
              arguments: {
                'title': elements[index].title,
                'resourceToLoad': elements[index].resourceToLoadRoute,
                'isCameraSupported': elements[index].isCameraSupported,
              },
            );
          },
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                ),
                child: ListTile(
                  title: Text(
                    learningItem.title,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  leading: Image.asset(
                    learningItem.assetName,
                    width: 60,
                  ),
                  trailing: const Icon(
                    Icons.chevron_right,
                  ),
                ),
              ),
              const Divider(
                height: 1,
                thickness: 1,
                color: Color.fromRGBO(97, 137, 255, 1),
              ),
            ],
          ),
        );
      },
    );
  }
}
