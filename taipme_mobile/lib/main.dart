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
      theme: TaipmeTheme.lightTheme,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              Image.asset('taipme_mobile/assets/logo/taipme.jpg'),
              SizedBox(height: 20),
              Text('Taipme è ancora in lavorazine 🚧', style: TextStyle(fontSize: 30)),
            ],
          ),
        ),
      ),
    );
  }
}
