import 'package:flutter/material.dart';
import '../../data/models/transaction_model.dart';

class TransactionInfo extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionInfo({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(transaction.title, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${transaction.amount} ${transaction.currency}'),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Справка'),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                _buildCardIcon(transaction.cardNumber, transaction.cardType),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardIcon(String cardNumber, String cardType) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Text(cardNumber, style: const TextStyle(color: Colors.white)),
            const SizedBox(width: 8),
            Text(cardType, style: const TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
