import 'package:taipme_mobile/main_app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await loadEnv();
  runApp(const ProviderScope(child: MainApp()));
}

// import 'package:flutter/material.dart';
// import 'package:taipme_mobile/src/theme/theme.dart';

// void main() {
//   runApp(const MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Taipme',
//       theme: TaipmeTheme.lightTheme,
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset('assets/logo/taipme.jpg'),
//             SizedBox(height: 20),
//             Text('Taipme è ancora in lavorazine 🚧', style: TextStyle(fontSize: 24)),
//           ],
//         ),
//       ),
//     );
//   }
// }
