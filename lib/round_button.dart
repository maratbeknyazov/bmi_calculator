// 3.3
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

// Он StatelessWidget, потому что сама кнопка не меняет свой вид «внутри» себя, 
// она просто делает то, что ей скажут.
class RoundButton extends StatelessWidget {
  
  // Это «конструктор». Сюда мы передаем данные, когда хотим создать кнопку.
  // Мы ТРЕБУЕМ (required), чтобы нам дали иконку и функцию, которая сработает при нажатии.
  const RoundButton({Key? key, required this.icon, required this.fabOnpress})
      : super(key: key);

  // Это «ячейки памяти» для хранения того, что нам передали:
  final IconData icon;       // Тут лежит иконка (например, плюс или минус)
  final VoidCallback fabOnpress; // Тут лежит команда (что делать, если на кнопку нажали)

  @override
  Widget build(BuildContext context) {
    // Используем RawMaterialButton — это «сырая» заготовка кнопки, 
    // которую можно настроить как угодно с нуля.
    return RawMaterialButton(
      // Настраиваем форму кнопки
      shape: RoundedRectangleBorder(
        // Делаем края закругленными (радиус 10.0)
        borderRadius: BorderRadius.circular(10.0),
      ),
      // Устанавливаем жесткие размеры кнопки (чтобы она не растягивалась)
      constraints: const BoxConstraints.tightFor(
        width: 56.0,  // Ширина — 56 пикселей
        height: 56.0, // Высота — 56 пикселей
      ),
      // Цвет заливки кнопки (темно-серый)
      fillColor: const Color(0xff4c4f5e),
      // Тень кнопки (чем выше число, тем сильнее кнопка «парит» над экраном)
      elevation: 60.0,
      // При нажатии выполняем ту самую команду, которую передали в конструктор
      onPressed: fabOnpress,
      // «Ребенок» кнопки — то, что находится внутри нее (в нашем случае это иконка)
      child: Icon(
        icon,           // Сама картинка иконки
        color: kWhiteColor, // Белый цвет иконки (берем из констант)
      ),
    );
  }
}