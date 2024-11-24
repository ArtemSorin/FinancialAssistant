import 'package:flutter/material.dart';
import 'package:tinkoff/data/models/category_model.dart';
import 'package:tinkoff/data/models/transaction_model.dart';
import '../widgets/category_info.dart';
import '../widgets/shopping_list.dart';
import '../../domain/usecases/get_category.dart';
import '../../domain/usecases/get_transaction.dart';
import '../../data/repositories/category_repository.dart';
import '../../data/repositories/transaction_repository.dart';
import '../../data/themes/colors.dart';

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
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Покупка'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCircle(myDate),
          const SizedBox(height: 30),
          const SizedBox(height: 16),
          CategoryInfo(category: category),
          const SizedBox(height: 16),
          const ShoppingList(),
        ],
      ),
    );
  }

  Widget _buildCircle(DateTime transactionDate) {
    final formattedDate = DateFormat('dd MMMM, HH:mm').format(transactionDate);

    return Column(
      children: [
        Text(
          formattedDate,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 50),
        Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: yellow,
                shape: BoxShape.circle,
              ),
            ),
            const Icon(
              Icons.shopping_cart,
              size: 48,
              color: Colors.white,
            ),
          ],
        ),
        const SizedBox(height: 8),
        const Text(
          'Название компании',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 4),
        Text(
          'Детальная информация',
          style: TextStyle(fontSize: 14, color: grey),
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
