import 'package:flutter/material.dart';
import 'package:mniii_flutter_daily_tracker/widgets/cost/expenses.dart';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:mniii_flutter_daily_tracker/widgets/quiz/quiz_widget.dart';

void main() {
  runApp(
    const MaterialApp(
      home: Expenses(),
    ),
  );
} 

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await dotenv.load(fileName: '.env');
//   runApp(const App());
// }

// class App extends StatelessWidget {
//   const App({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSwatch(
//           backgroundColor: const Color(0xFFE7626C),
//         ),
//         textTheme: const TextTheme(
//           displayLarge: TextStyle(
//             color: Color(0xFF232B55),
//           ),
//         ),
//         cardColor: const Color.fromARGB(255, 68, 50, 5),
//       ),
//       home: const QuizWidget(),
//     );
//   }
// }
