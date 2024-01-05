import 'package:employee_app/main_screens/age_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          appBarTheme: AppBarTheme(
              backgroundColor: Colors.grey.shade800,
              elevation: 10,
              shadowColor: Colors.black),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(Size(
                  MediaQuery.of(context).size.width * 0.8,
                  MediaQuery.of(context).size.height * 0.07)),
              backgroundColor: MaterialStateProperty.all(
                Colors.yellow.withOpacity(0.8),
              ),
            ),
          ),
          scaffoldBackgroundColor: Colors.grey.shade600.withOpacity(0.7)),
      initialRoute: '/age',
      routes: {
        '/age': (context) => const AgeSelectionScreen(),
      },
    );
  }
}
