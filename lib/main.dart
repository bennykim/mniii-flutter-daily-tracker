import 'package:flutter/material.dart';
import 'package:mniii_flutter_daily_tracker/widgets/cost/expenses.dart';

// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:mniii_flutter_daily_tracker/widgets/quiz/quiz_widget.dart';

var kColorSchema = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorSchema = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 99, 125),
);

void main() {
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorSchema,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorSchema.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorSchema.primaryContainer,
            foregroundColor: kDarkColorSchema.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: kColorSchema,
        appBarTheme: AppBarTheme(
          backgroundColor: kColorSchema.onPrimaryContainer,
          foregroundColor: kColorSchema.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorSchema.primaryContainer,
          margin: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 16,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorSchema.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorSchema.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      themeMode: ThemeMode.system,
      home: const Expenses(),
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
