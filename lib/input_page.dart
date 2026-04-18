// 5
// 1. ИМПОРТЫ: Подключаем нужные инструменты (библиотеки и свои файлы)
import 'package:bmi_calculator/bottom_button.dart'; // Кнопка "Рассчитать" внизу
import 'package:bmi_calculator/calculate_bmi.dart'; // Логика расчетов (математика)
import 'package:bmi_calculator/constants.dart'; // Цвета и стили текста (чтобы всё было красиво)
import 'package:bmi_calculator/icon_column_widget.dart'; // Иконка + текст внутри карточки
import 'package:bmi_calculator/my_container.dart'; // Наша кастомная "коробка" (карточка)
import 'package:bmi_calculator/result_page.dart'; // Страница, куда мы перейдем после расчета
import 'package:bmi_calculator/round_button.dart'; // Маленькие круглые кнопки (+ и -)
import 'package:flutter/material.dart'; // Главная библиотека Flutter (дизайн)
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; // Библиотека крутых иконок

// Перечисляем полы: Мужской и Женский. Чтобы программа не путалась.
enum Gender { maleGender, femaleGender }

// Главный класс экрана. StatefulWidget значит, что данные на экране БУДУТ меняться.
class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => InputPageState();
}

class InputPageState extends State<InputPage> {
  // --- НАШИ ПЕРЕМЕННЫЕ (Склад данных) ---
  Gender? gender; // Переменная для пола (сначала пустая)
  int height = 180; // Начальный рост (180 см)
  int weight = 60; // Начальный вес (60 кг)
  int age = 25; // Начальный возраст (25 лет)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Шапка приложения
      appBar: AppBar(
        title: const Text('HEALTHY'), // Текст сверху
      ),
      // Тело приложения (всё, что под шапкой)
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch, // Растянуть всё по ширине
        children: [
          // 1-Й РЯД: Выбор пола
          Expanded(
            child: Row(
              children: <Widget>[
                // КАРТОЧКА МУЖЧИНЫ
                Expanded(
                  child: MyContainer(
                    // Если выбран мужской пол — цвет активный, иначе — тусклый
                    ourColor: gender == Gender.maleGender ? kActiveColor : kInactiveColor,
                    onpress: () {
                      setState(() {
                        gender = Gender.maleGender; // Меняем пол и ПЕРЕРИСОВЫВАЕМ экран
                      });
                    },
                    ourWidget: const IconColumnWidget(
                      ourfontIcon: FontAwesomeIcons.person,
                      ourText: 'MALE',
                    ),
                  ),
                ),
                // КАРТОЧКА ЖЕНЩИНЫ
                Expanded(
                  child: MyContainer(
                    ourColor: gender == Gender.femaleGender ? kActiveColor : kInactiveColor,
                    onpress: () {
                      setState(() {
                        gender = Gender.femaleGender; // Меняем пол на женский
                      });
                    },
                    ourWidget: const IconColumnWidget(
                      ourfontIcon: FontAwesomeIcons.personDress,
                      ourText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ),
          // 2-Й РЯД: Выбор роста (ползунок)
          Expanded(
            child: MyContainer(
              ourColor: kAllColor,
              ourWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('HEIGHT', style: kStyles), // Надпись РОСТ
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic, // Чтобы текст стоял ровно на одной линии
                    children: [
                      Text(height.toString(), style: kBigText), // Число роста
                      const Text('CM', style: kStyles), // Сантиметры
                    ],
                  ),
                  // ПОЛЗУНОК (Slider)
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: kWhiteColor, // Цвет полоски
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0), // Размер кругляшка
                        thumbColor: kBottomColor, // Цвет кругляшка
                        overlayColor: const Color(0x29eb1555)), // Цвет тени при нажатии
                    child: Slider(
                        value: height.toDouble(),
                        max: 220, // Макс. рост
                        min: 50,  // Мин. рост
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round(); // Обновляем число, когда двигаем ползунок
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          // 3-Й РЯД: Вес и Возраст
          Expanded(
            child: Row(
              children: <Widget>[
                // БЛОК ВЕСА
                Expanded(
                  child: MyContainer(
                    ourColor: kAllColor,
                    ourWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: kStyles),
                        Text(weight.toString(), style: kBigText),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Кнопка Плюс
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              fabOnpress: () {
                                setState(() { weight++; }); // Увеличиваем вес
                              },
                            ),
                            const SizedBox(width: 10.0), // Отступ между кнопками
                            // Кнопка Минус
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              fabOnpress: () {
                                setState(() { weight--; }); // Уменьшаем вес
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                // БЛОК ВОЗРАСТА
                Expanded(
                  child: MyContainer(
                    ourColor: kAllColor,
                    ourWidget: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE', style: kStyles),
                        Text(age.toString(), style: kBigText),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RoundButton(
                              icon: FontAwesomeIcons.plus,
                              fabOnpress: () {
                                setState(() { age++; }); // Стареем на год
                              },
                            ),
                            const SizedBox(width: 10.0),
                            RoundButton(
                              icon: FontAwesomeIcons.minus,
                              fabOnpress: () {
                                setState(() { age--; }); // Молодеем
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          // НИЖНЯЯ КНОПКА: РАССЧИТАТЬ
          BottomButton(
            text: 'CALCULATE',
            tap: () {
              // Создаем "калькулятор", передаем ему наш вес и рост
              CalculateBmi calc = CalculateBmi(weight: weight, height: height);

              // Прыгаем на страницу с результатами
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return OurResultPage(
                      resultString: calc.ourBmiResultText(), // Текст (Норма, Ожирение и т.д.)
                      resultNumber: calc.dotheCalculation(), // Само число (например, 24.5)
                      resultExplain: calc.interpretation(), // Совет (Кушай меньше или молодец)
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}