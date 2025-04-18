import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:taipme_mobile/route/route.dart';

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
            Consumer(
              builder: (context, ref, child) {
                return GestureDetector(
                  onTap: () => ref.read(goRouterProvider).go('/home-page'),
                  child: Image.asset(
                    'assets/logo/taipme.jpg',
                    width: 150,
                    height: 150,
                  ),
                );
              },
            ),
            // Icona Menu per aprire il Drawer
            IconButton(
              icon: Icon(Icons.menu, color: Colors.white),
              onPressed: () => Scaffold.of(context).openEndDrawer(),
            ),
          ],
        ),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Aggiungi un SizedBox per separare la AppBar dal resto del contenuto
          SizedBox(height: 150), // Puoi regolare questa altezza come preferisci
          Center(
            child: Text("Content goes here"),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
