import 'package:taipme_mobile/route/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('assets/logo/taipme.png', width: 250, height: 250),
            Text('Ancora in lavorazione... 🚧'),
            ElevatedButton(
              onPressed: () => ref.read(goRouterProvider).go('/debug'),
              child: Text('Debug Page'),
            ),
          ],
        ),
      ),
    );
  }
}
