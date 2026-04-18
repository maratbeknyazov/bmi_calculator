// 3.2
// Импортируем «настройки» (цвета, шрифты), которые лежат в другом файле
import 'package:bmi_calculator/constants.dart';
// Импортируем основной набор инструментов Flutter (кнопки, иконки, сетки)
import 'package:flutter/material.dart';

// Создаем наш собственный виджет под названием IconColumnWidget.
// StatelessWidget означает, что этот виджет "глупый" — он просто рисует то, что ему дали,
// и сам по себе не меняется в процессе работы.
class IconColumnWidget extends StatelessWidget {
  
  // Это «конструктор». Сюда мы передаем данные, когда хотим создать этот виджет.
  // Мы говорим: "Эй, чтобы я отрисовал колонку, дай мне иконку (ourfontIcon) и текст (ourText)!"
  const IconColumnWidget(
      {Key? key, required this.ourfontIcon, required this.ourText})
      : super(key: key);

  // Здесь мы объявляем переменные — это коробочки, где будут храниться наши данные
  final IconData ourfontIcon; // Тут будет лежать сама иконка (например, значок пола)
  final String ourText;       // Тут будет лежать текст (например, слово "MALE")

  // Метод build — это сердце виджета. Он говорит Flutter, как именно рисовать всё на экране.
  @override
  Widget build(BuildContext context) {
    // Возвращаем Column (колонку). Она выстраивает элементы сверху вниз.
    return Column(
      // Выравниваем всё по центру по горизонтали
      crossAxisAlignment: CrossAxisAlignment.center,
      // Выравниваем всё по центру по вертикали
      mainAxisAlignment: MainAxisAlignment.center,
      
      // Список "детей" (элементов), которые будут внутри колонки
      children: [
        // 1. Сама иконка
        Icon(
          ourfontIcon, // Берем ту иконку, которую мы передали в конструктор
          size: 60.0,  // Устанавливаем размер побольше, чтобы было видно
        ),
        
        // 2. Пустая невидимая коробка (прослойка)
        // Нужна просто чтобы сделать отступ в 15 пикселей между иконкой и текстом
        const SizedBox(
          height: 15.0,
        ),
        
        // 3. Текст
        Text(
          ourText,     // Берем тот текст, который мы передали в конструктор
          style: kStyles, // Оформляем текст стилем, который прописан в constants.dart
        ),
      ],
    );
  }
}