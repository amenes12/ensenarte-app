import 'package:flutter/material.dart';
import 'package:ensenarte/utils/card_type.dart';
import 'package:ensenarte/models/learning_item.dart';

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
      padding: const EdgeInsets.only(
        top: 16.0,
        left: 4.0,
        right: 4.0,
        bottom: 8.0,
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (learningItems == null) {
                Navigator.pushNamed(context, routeName);
              } else {
                Navigator.pushNamed(context, routeName, arguments: {
                  'title': title,
                  'learningItems': learningItems,
                });
              }
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(97, 137, 255, 1),
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 4),
                    blurRadius: 4,
                    color: Colors.black.withOpacity(0.25),
                  ),
                ],
              ),
              width: width,
              height: height * 0.25,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16)),
                    ),
                    height: height * 0.185,
                    width: double.infinity,
                    child: Image.asset(
                      assetName,
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                  SizedBox(
                    height: height * 0.065,
                    child: Padding(
                      padding: const EdgeInsets.only(
                        left: 8.0,
                        top: 4.0,
                      ),
                      child: Text(
                        title,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400),
                      ),
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
