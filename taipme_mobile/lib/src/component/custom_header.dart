import 'package:flutter/material.dart';
import 'package:taipme_mobile/src/component/menu.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {

  const CustomHeader({super.key});

  @override
 Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            Row(
              children: [
                Image.asset(
                  'assets/logo/taipme.jpg',
                  width: 150,
                  height: 150,
                ),
              ],
            ),
            // Icona Menu per aprire il Drawer
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () {
                Scaffold.of(context).openEndDrawer();
              },
            ),
          ],
        ),
        elevation: 0,
      ),
      endDrawer: const Menu(),
      body: Center(child: Text('Contenuto principale')),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}