import 'package:flutter/material.dart';
import 'package:myapp/utils/list_element.dart';

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
            /* 
              to-do: navigation to each each screen of the element
              For those cases, the element should have a resource to load, it will have (or not) actions, depending of its nature
            */
            Navigator.pushNamed(
              context,
              elements[index].destinationRoute,
              arguments: {
                'title': elements[index].title,
                'resourceToLoad': elements[index].resourceToLoadRoute,
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
                child: 
                  ListTile(
                    title: Text(learningItem.title),
                    leading: Image.asset(
                      learningItem.assetName,
                    ),
                    trailing: const Icon(Icons.chevron_right),
                  ),  
              ),
              const Divider(
                    height: 1,
                    thickness: 1,
                    color: Colors.grey,
                  ),
            ],
          ),
        );
      },
      
    );
  }
}
