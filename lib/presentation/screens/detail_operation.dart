import 'package:flutter/material.dart';
import 'package:tinkoff/data/models/category_model.dart';
import 'package:tinkoff/data/models/transaction_model.dart';
import '../widgets/transaction_info.dart';
import '../widgets/category_info.dart';
import '../widgets/shopping_list.dart';
import '../../domain/usecases/get_category.dart';
import '../../domain/usecases/get_transaction.dart';
import '../../data/repositories/category_repository.dart';
import '../../data/repositories/transaction_repository.dart';

import 'package:intl/intl.dart';

class DetailOperationScreen extends StatefulWidget {
  const DetailOperationScreen({super.key});

  @override
  DetailOperationScreenState createState() => DetailOperationScreenState();
}

class DetailOperationScreenState extends State<DetailOperationScreen> {
  late GetCategoryUseCase getCategoryUseCase;
  late GetTransactionUseCase getTransactionUseCase;
  late TransactionModel transaction;
  late CategoryModel category;

  @override
  void initState() {
    super.initState();
    final categoryRepository = CategoryRepository();
    final transactionRepository = TransactionRepository();
    getCategoryUseCase = GetCategoryUseCase(categoryRepository);
    getTransactionUseCase = GetTransactionUseCase(transactionRepository);

    category = getCategoryUseCase.execute();
    transaction = getTransactionUseCase.execute();
  }

  @override
  Widget build(BuildContext context) {
    DateTime myDate = DateTime.now();

    return Scaffold(
      backgroundColor: Color(0xF6F6F6F6),
      appBar: AppBar(
        title: const Text('Покупка'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCircle(myDate),
          const SizedBox(height: 30),
          //TransactionInfo(transaction: transaction),
          const SizedBox(height: 16),
          CategoryInfo(category: category),
          const SizedBox(height: 16),
          const ShoppingList(),
        ],
      ),
    );
  }

  Widget _buildCircle(DateTime transactionDate) {
    // Добавили параметр transactionDate
    final formattedDate = DateFormat('dd MMMM, HH:mm')
        .format(transactionDate); // Форматируем дату

    return Column(
      children: [
        Text(
          formattedDate, // Выводим отформатированную дату
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 50),
        Container(
          width: 100,
          height: 100,
          decoration: const BoxDecoration(
            color: Colors.yellow,
            shape: BoxShape.circle,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Название компании',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        const Text(
          'Детальная информация',
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        const SizedBox(height: 8),
        const Text(
          '-5000 ₽',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
