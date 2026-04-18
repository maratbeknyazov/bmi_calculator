// 7
import 'package:bmi_calculator/input_page.dart'; // Подключаем наш файл с дизайном кнопок и полей
import 'package:flutter/material.dart'; // Подключаем стандартный набор инструментов от Google (кнопки, шрифты и т.д.)

void main() => runApp(const BMICalculator());

// ГЛАВНЫЙ КЛАСС: Это костяк или "скелет" нашего приложения.
// StatelessWidget означает, что это окно само по себе не меняется (как рамка для картины).
class BMICalculator extends StatelessWidget {
  // Это техническая штука для системы, просто запомни: она должна быть здесь.
  const BMICalculator({Key? key}) : super(key: key);

  @override
  // Метод build — это "чертеж". Здесь мы описываем, как приложение будет выглядеть.
  Widget build(BuildContext context) {
    // MaterialApp — это фундамент. Без него приложение не поймет, что оно приложение.
    return MaterialApp(
      // Настраиваем "тему" (внешний вид). В данном случае делаем всё в темных тонах.
      theme: ThemeData.dark().copyWith(
        // primaryColor: Основной цвет (но во Flutter чаще смотрят на фон и AppBar)
        primaryColor: const Color(0xFF0A0E21), 
        
        // scaffoldBackgroundColor: Цвет заднего фона всего экрана. 
        // 0xFF0A0E21 — это код очень темно-синего, почти черного цвета.
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
        
        // appBarTheme: Настраиваем верхнюю плашку (где обычно написано название приложения)
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF0A0E21), // Делаем верхушку такой же темной, как и фон
        ),
      ),
      
      // home: Это то, что пользователь увидит ПЕРВЫМ при запуске.
      // Мы говорим: "Покажи экран InputPage" (тот самый, который мы импортировали в начале).
      home: const InputPage(),
    );
  }
}