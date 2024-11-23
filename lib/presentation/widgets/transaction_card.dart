import 'package:flutter/material.dart';
import 'package:tinkoff/data/models/transaction_model.dart';

class TransactionItem extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionItem({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const CircleAvatar(
        backgroundColor: Color.fromARGB(255, 243, 211, 51),
        child: Icon(Icons.shopping_cart, color: Colors.white),
      ),
      title: Text(transaction.title),
      subtitle: Text(transaction.date),
      trailing: Text(
        transaction.amount,
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: Colors.grey,
        ),
      ),
    );
  }
}
