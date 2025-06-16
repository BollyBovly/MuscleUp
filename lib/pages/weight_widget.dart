import 'package:flutter/material.dart';
import 'package:musleapp/api/api_server.dart';
import 'package:musleapp/design/colors.dart';
import 'package:musleapp/services/training_controller.dart';

class WeightInputWidget extends StatefulWidget {
  final String task;

  const WeightInputWidget({super.key, required this.task});

  @override
  State<StatefulWidget> createState() {
    return _WeightInputWidgetState();
  }
}

class _WeightInputWidgetState extends State<WeightInputWidget> {
  final TextEditingController _weightController = TextEditingController();

  void _submitWeight() {
    // Получаем вес из текстового поля
    int? weight = int.tryParse(_weightController.text);

    if (weight != null) {
      // Вызываем метод ApiService.addUser BodyWeight с введенным весом
      ApiService.addUserBodyWeight(weight);
      _weightController.clear();
    } else {
      // Обработка ошибки, если введенное значение не является числом
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Пожалуйста, введите корректный вес.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    int? weight;
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
              // Центрируем текст
              child: Text(
                widget.task == 'ex-weight'
                    ? 'Отмечай прогресс в упражнении'
                    : 'Не забывай отслеживать свой вес!',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ), // Стиль текста
                textAlign: TextAlign.center, // Выравнивание текста по центру
              ),
            ),
            Container(
              width:
                  MediaQuery.of(context).size.width *
                  0.9, // 70% от ширины экрана
              margin: EdgeInsets.only(top: 20),
              child: TextField(
                controller: _weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Введите вес (кг)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(
                      10.0,
                    ), // Скругленные углы
                  ),
                ),
              ),
            ),
            SizedBox(height: 30), // Отступ между полем ввода и кнопкой
            ElevatedButton(
              onPressed:
                  () => {
                    if (widget.task == 'self-weight')
                      {_submitWeight()}
                    else if (widget.task == 'ex-weight')
                      {
                        weight = int.tryParse(_weightController.text),

                        if (weight != null)
                          {
                            // Вызываем метод ApiService.addUser BodyWeight с введенным весом
                            ApiService.addProgress(
                              TrainingController.ex_index + 18,
                              weight!,
                            ),
                            _weightController.clear(),
                          }
                        else
                          {
                            // Обработка ошибки, если введенное значение не является числом
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  'Пожалуйста, введите корректный вес.',
                                ),
                              ),
                            ),
                          },
                      },
                  }, //временное решение, потом нужно вернуть /start
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFFFFFFF),
                minimumSize: Size(100, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 20,
              ),
              child: Text(
                'Обновить вес',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: textButtonColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
