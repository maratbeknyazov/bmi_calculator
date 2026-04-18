// 6
import 'package:bmi_calculator/bottom_button.dart'; // Берем готовую кнопку снизу
import 'package:bmi_calculator/constants.dart';    // Берем настройки цветов и шрифтов
import 'package:flutter/material.dart';             // Главный набор деталей для Flutter

// Создаем экран "Наш Результат" (OurResultPage)
// StatelessWidget означает, что сам экран не меняется после отрисовки, 
// он просто показывает то, что в него передали.
class OurResultPage extends StatelessWidget {
  
  // Это "Конструктор". Когда мы переходим на этот экран, мы ОБЯЗАТЕЛЬНО
  // должны передать ему три вещи: число ИМТ, статус текстом и совет.
  const OurResultPage({
    Key? key,
    required this.resultString,  // Текст (например: "Норма")
    required this.resultNumber,  // Само число (например: "22.5")
    required this.resultExplain, // Совет (например: "У вас все отлично!")
  }) : super(key: key);

  // Это коробочки (переменные), где хранятся данные, которые мы передали выше
  final String resultNumber;
  final String resultString;
  final String resultExplain;

  @override
  // Метод build — это "чертеж" того, как экран будет выглядеть на телефоне
  Widget build(BuildContext context) {
    return Scaffold(
      // Верхняя панель приложения
      appBar: AppBar(
        title: const Text('Result Page'), // Заголовок вверху экрана
      ),
      // Основное тело экрана — это Column (Столбик). Все элементы идут сверху вниз.
      body: Column(
        // Растягиваем содержимое, чтобы всё было красиво распределено по вертикали
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // Растягиваем содержимое во всю ширину экрана
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 1. ЗАГОЛОВОК "Your Result"
          Expanded( // Занимает доступное место
            child: Container(
              padding: const EdgeInsets.all(15.0), // Отступы внутри, чтобы текст не прилипал
              child: const Text(
                'Your Result',
                style: kBigText, // Стиль текста (большой и жирный) из файла констант
              ),
            ),
          ),
          
          // 2. БОЛЬШАЯ КАРТОЧКА С ЦИФРАМИ
          Expanded(
            flex: 6, // Эта часть в 6 раз больше остальных, потому что она главная
            child: Container(
              margin: const EdgeInsets.all(15.0), // Отступы снаружи карточки
              decoration: const BoxDecoration(
                  color: kAllColor, // Цвет фона карточки
                  borderRadius: BorderRadius.only( // Скругляем только верхние углы
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0))),
              // Внутри карточки еще один столбик (Column) для текста
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Равномерно распределяем текст внутри
                children: [
                  // Текст статуса (Норма/Лишний вес)
                  Text(
                    resultString,
                    style: const TextStyle(
                        color: kGreenColor, // Зеленый цвет текста
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold),
                  ),
                  // Текст с числом ИМТ (например, 24.2)
                  Text(
                    resultNumber,
                    style: kBigText,
                  ),
                  // Текст с пояснением (что делать дальше)
                  Text(
                    resultExplain,
                    textAlign: TextAlign.center, // Выравниваем текст по центру
                    style: kStyles,
                  )
                ],
              ),
            ),
          ),
          
          // 3. КНОПКА "ПЕРЕСЧИТАТЬ"
          BottomButton(
            text: 'RE-CALCULATE', // Надпись на кнопке
            tap: () {
              // Когда нажимаем, мы просто "выбрасываем" (pop) этот экран 
              // и возвращаемся на предыдущий (где вводили рост и вес)
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}