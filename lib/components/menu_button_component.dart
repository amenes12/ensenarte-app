import 'package:ensenarte/routes/routes.dart';
import 'package:ensenarte/services/auth_service.dart';
import 'package:flutter/material.dart';


class MenuButtonComponent extends StatelessWidget {
  const MenuButtonComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      icon: const Icon(Icons.menu),
      position: PopupMenuPosition.under,
      itemBuilder: (BuildContext context) => <PopupMenuEntry>[
        const PopupMenuItem(
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.person,
                  color: Color.fromRGBO(97, 137, 255, 1),
                ),
              ),
              Text(
                'Perfil',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Color.fromRGBO(97, 137, 255, 1),
                ),
              ),
            ],
          ),
        ),
        const PopupMenuDivider(),
        PopupMenuItem(
          onTap: () async { 
            await AuthService().signOut(); 
            Navigator.pushReplacementNamed(context, AppRouting.signInScreen);
          },
          child: const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(Icons.logout,
                    color: Color.fromRGBO(97, 137, 255, 1)),
              ),
              Text(
                'Salir',
                style: TextStyle(
                    fontSize: 14.0,
                    color: Color.fromRGBO(97, 137, 255, 1)),
              ),
            ],
          ),
        ),
      ],
    );
  }
}