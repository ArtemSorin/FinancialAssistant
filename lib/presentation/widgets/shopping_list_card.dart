import 'package:flutter/material.dart';

class ShoppingListCard extends StatelessWidget {
  const ShoppingListCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Список покупок', style: TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            const Text(
              'Добавьте чек - мы начислим кэшбэк и покажем\nздесь ваши покупки',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_scanner),
              label: const Text('Добавить чек'),
            ),
          ],
        ),
      ),
    );
  }
}
