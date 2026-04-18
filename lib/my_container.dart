// 3.1
import 'package:flutter/material.dart';

// Создаем наш собственный виджет (деталь конструктора), называем его MyContainer
class MyContainer extends StatelessWidget {
  // Это "инструкция по сборке". Когда мы создаем эту коробку, мы говорим ей:
  const MyContainer(
      {Key? key, 
      required this.ourColor, // "Эй, обязательно дай мне цвет!" (required — значит обязательно)
      this.ourWidget,         // "Если хочешь, положи внутрь что-нибудь (текст или иконку)"
      this.onpress})          // "И скажи, что делать, если на коробку нажмут"
      : super(key: key);

  // Это "память" нашей коробки:
  final Color ourColor;       // Тут хранится цвет
  final Widget? ourWidget;    // Тут хранится то, что лежит внутри (может быть пусто — знак вопроса ?)
  final VoidCallback? onpress; // Тут хранится действие при нажатии

  @override
  // А здесь мы описываем, как эта коробка выглядит на экране
  Widget build(BuildContext context) {
    // GestureDetector — это "чувствительный слой". Он ловит касания пальцем
    return GestureDetector(
      onTap: onpress, // Если коснулись — выполняем действие, которое передали выше
      
      // Сама коробка (визуальная часть)
      child: Container(
        // Отступы снаружи (чтобы коробка не прилипала к краям экрана или другим коробкам)
        margin: const EdgeInsets.all(15.0),
        
        // Внешний вид (украшательства)
        decoration: BoxDecoration(
          color: ourColor, // Красим в тот цвет, который мы выбрали
          borderRadius: BorderRadius.circular(10.0), // Скругляем углы, чтобы не были острыми
        ),
        
        // Кладем внутрь тот виджет (текст/иконку), который передали в начале
        child: ourWidget,
      ),
    );
  }
}