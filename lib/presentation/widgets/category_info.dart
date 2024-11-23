import 'package:flutter/material.dart';
import 'package:tinkoff/data/models/category_model.dart';

class CategoryInfo extends StatelessWidget {
  final CategoryModel category;

  const CategoryInfo({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Категория',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      builder: (BuildContext context) {
                        return Container(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _buildTopBar(), // Добавленный прямоугольник сверху
                              const SizedBox(height: 24), // Увеличенный отступ
                              _buildCategoryOption(
                                title: 'Обязательные затраты',
                                description:
                                    'Важные расходы, без которых не обойтись.\nАренда/продукты/транспорт',
                                value: 'required',
                                groupValue: category.title,
                                onChanged: (value) {
                                  // Обработка изменения значения
                                },
                              ),
                              const SizedBox(height: 24), // Увеличенный отступ
                              _buildCategoryOption(
                                title: 'Желаемые покупки',
                                description:
                                    'Если не уделять внимание своим желаниям, повышается риск импульсивных покупок',
                                value: 'desired',
                                groupValue: category.title,
                                onChanged: (value) {
                                  // Обработка изменения значения
                                },
                              ),
                              const SizedBox(height: 24),
                            ],
                          ),
                        );
                      },
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                  child: const Text('Изменить'),
                ),
              ],
            ),
            const SizedBox(height: 16), // Увеличенный отступ
            Text(
              category.description,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 24), // Увеличенный отступ
            LinearProgressIndicator(
              value: category.percentageSpent,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow),
              backgroundColor: Colors.grey[300],
              minHeight: 8,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopBar() {
    return Center(
      child: Container(
        width: 40,
        height: 6,
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }

  Widget _buildCategoryOption({
    required String title,
    required String description,
    required String value,
    required String groupValue,
    required ValueChanged<String?> onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold), // Увеличенный шрифт
              ),
            ),
            CustomRadio<String>(
              value: value,
              groupValue: groupValue,
              onChanged: onChanged,
            ),
          ],
        ),
        const SizedBox(height: 8), // Увеличенный отступ
        Text(
          description,
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

class CustomRadio<T> extends StatelessWidget {
  final T value;
  final T groupValue;
  final ValueChanged<T?> onChanged;

  const CustomRadio({
    super.key,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(value);
      },
      child: Container(
        width: 24,
        height: 24,
        decoration: BoxDecoration(
          border: Border.all(
            color: value == groupValue ? Colors.blue : Colors.yellow,
            width: 3,
          ),
          borderRadius: BorderRadius.circular(5),
        ),
        child: value == groupValue
            ? Center(
                child: Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
