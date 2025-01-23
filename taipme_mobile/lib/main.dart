import 'package:flutter/material.dart';
import 'package:taipme_mobile/theme/theme.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taipme',
      theme: TaipmeTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo/taipme.jpg'),
            SizedBox(height: 20),
            Text('Taipme è ancora in lavorazine 🚧', style: TextStyle(fontSize: 24)),
          ],
        ),
      ),
    );
  }
}
