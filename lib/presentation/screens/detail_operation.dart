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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Покупка'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildCircle(),
          const SizedBox(height: 16),
          TransactionInfo(transaction: transaction),
          const SizedBox(height: 16),
          CategoryInfo(category: category),
          const SizedBox(height: 16),
          const ShoppingList(),
        ],
      ),
    );
  }

  Widget _buildCircle() {
    return Container(
      width: 100,
      height: 100,
      decoration: const BoxDecoration(
        color: Colors.yellow,
        shape: BoxShape.circle,
      ),
    );
  }
}
