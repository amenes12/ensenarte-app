import 'package:flutter/material.dart';

class CardComponent extends StatelessWidget {
  final String title;
  final String assetName;
  final String routeName;


  const CardComponent(
    {
      super.key,
      required this.title,
      required this.assetName,
      required this.routeName
    });

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, routeName);
            },
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromRGBO(97, 137, 255, 1),
                borderRadius: BorderRadius.circular(8),
              ),
              width: size.width - 50,
              height: size.height * 0.2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    assetName,
                    height: size.height * 0.13,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      title,
                      style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
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
