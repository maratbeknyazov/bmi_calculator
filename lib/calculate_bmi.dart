// 4
import 'dart:math';

// Создаем "чертеж" или "рецепт" под названием CalculateBmi. 
// Он будет хранить данные человека и считать его индекс массы тела (ИМТ).
class CalculateBmi {
  
  // Когда мы создаем этот объект, нам ОБЯЗАТЕЛЬНО (required) нужно дать ему вес и рост.
  CalculateBmi({required this.weight, required this.height});

  final int height; // Переменная для хранения роста (целое число)
  final int weight; // Переменная для хранения веса (целое число)
  
  // late означает: "Я создам эту коробку для результата чуть позже, когда проведу расчет"
  late double _bmi;

  // Функция, которая делает саму математику
  String dotheCalculation() {
    // Формула ИМТ: Вес поделить на (Рост в метрах в квадрате)
    // Делим рост на 100, чтобы перевести сантиметры в метры.
    // pow(..., 2) — это возведение во вторую степень (квадрат).
    _bmi = weight / pow(height / 100, 2);
    
    // Возвращаем результат в виде текста, округлив до одной цифры после запятой (например, "24.5")
    return _bmi.toStringAsFixed(1);
  }

  // Функция, которая выдает короткий вердикт (заголовок)
  String ourBmiResultText() {
    if (_bmi >= 25) {
      return 'OverWeight'; // Если ИМТ 25 и больше — "Перебор"
    } else if (_bmi > 18) {
      return 'Normal';     // Если больше 18 (и меньше 25) — "Красавчик, норма"
    } else {
      return 'UnderWeight'; // Если 18 и меньше — "Маловато будет"
    }
  }

  // Функция, которая дает добрый (или не очень) совет
  String interpretation() {
    if (_bmi > 25) {
      // Если жирок давит
      return 'Your body weight is higher than Normal, try and Excersice more';
    } else if (_bmi > 18) {
      // Если всё четко
      return 'Your Body weight is normal, Weldone';
    } else {
      // Если пора зайти в бургерную
      return 'You have a lower body weight, try and eat more';
    }
  }
}