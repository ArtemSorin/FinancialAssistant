import 'package:flutter/material.dart';
import '../../data/models/category_model.dart';

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
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.blue,
                    textStyle: const TextStyle(fontSize: 14),
                  ),
                  child: const Text('Изменить'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              category.description,
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 12),
            LinearProgressIndicator(
              value: category.percentageSpent,
              valueColor: AlwaysStoppedAnimation<Color>(Colors.yellow[700]!),
              backgroundColor: Colors.grey[300],
              minHeight: 8,
            ),
          ],
        ),
      ),
    );
  }
}
