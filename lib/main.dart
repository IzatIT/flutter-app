import 'package:first_app/pages/home/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      theme: ThemeData(
        primaryColor: const Color(0xFF23232C), // Основной цвет
        scaffoldBackgroundColor: const Color(0xFF231921), // Цвет фона Scaffold
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF33343D), // Цвет AppBar
        ),
        colorScheme: const ColorScheme(
          brightness:
              Brightness.dark, // Переопределяем цвета для темного режима
          primary: Color(0xFF7868D8), // Основной акцентный цвет
          onPrimary: Colors.white, // Цвет текста на кнопках с акцентным цветом
          secondary: Color(0xFF8AC186), // Вторичный акцентный цвет
          onSecondary: Colors.white, // Цвет текста на вторичных элементах
          error: Color(0xFFFFABC7), // Цвет ошибок
          onError: Colors.white, // Цвет текста на элементах с ошибками
          surface: Color(0xFF23232C), // Цвет поверхности (например, карточки)
          onSurface: Colors.white, // Цвет текста на поверхностях
        ),
        buttonTheme: const ButtonThemeData(
          buttonColor: Color(0xFF7868D8), // Цвет кнопок
          textTheme: ButtonTextTheme.primary, // Цвет текста на кнопках
        ),
      ),
      home: const HomePage(),
    );
  }
}
