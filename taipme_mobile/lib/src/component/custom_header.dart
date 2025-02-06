import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {

  const CustomHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo + Testo
          Row(
            children: [
              // Simbolo personalizzato (rappresentativo dei tre puntini nell'immagine)
              Image.asset('assets/logo/taipme.jpg',
                      width: 150, height: 150),
            ],
          ),
          // Icona Menu
          Icon(Icons.menu, color: Colors.white),
        ],
      ),
      elevation: 0,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}