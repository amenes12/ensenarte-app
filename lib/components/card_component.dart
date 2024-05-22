import 'package:flutter/material.dart';
import 'package:myapp/utils/card_type.dart';
import 'package:myapp/utils/list_element.dart';

class CardComponent extends StatelessWidget {
  final String title;
  final String assetName;
  final String routeName;
  final CardType cardType;
  final List<LearningItem>? learningItems;

  const CardComponent(
      {super.key,
      required this.title,
      required this.assetName,
      required this.routeName,
      required this.cardType,
      this.learningItems});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = (cardType.name == CardType.fullCard.name)
        ? (size.width - 50)
        : ((size.width - 50) / 2);
    final height = size.height;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (learningItems == null) {
                Navigator.pushNamed(context, routeName);
              } else {
                Navigator.pushNamed(
                    context, 
                    routeName,
                    arguments: {
                      'title': title,
                      'learningItems': learningItems,
                    });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(97, 137, 255, 1),
                borderRadius: BorderRadius.circular(16),
              ),
              width: width,
              height: height * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    assetName,
                    height: height * 0.18,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headlineLarge
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
