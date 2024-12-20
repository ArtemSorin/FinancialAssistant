import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:tinkoff/domain/usecases/get_transactions.dart';
import 'package:tinkoff/data/repositories/transaction_repository.dart';
import 'package:tinkoff/presentation/screens/detail_operation.dart';
import 'package:tinkoff/presentation/screens/main_page.dart';
import 'package:tinkoff/presentation/widgets/transaction_card.dart';

import '../../data/themes/colors.dart';

class HomeScreen extends StatefulWidget {
  final GetTransactions getTransactions;

  HomeScreen({super.key})
      : getTransactions = GetTransactions(TransactionRepository());

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String selectedPeriod = 'Мес';

  void _onPeriodSelected(String period) {
    setState(() {
      selectedPeriod = period;
    });
  }

  @override
  Widget build(BuildContext context) {
    final transactions = widget.getTransactions.execute();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MainScreen(),
              ),
            );
          },
        ),
        title: const Text(
          'Финассистент',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: background,
        elevation: 0,
      ),
      backgroundColor: background,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Круговая диаграмма
              Center(
                child: SizedBox(
                  height: 250,
                  child: PieChart(
                    PieChartData(
                      sections: [
                        PieChartSectionData(
                          color: const Color(0xFFEC407A),
                          value: 50,
                          radius: 40,
                        ),
                        PieChartSectionData(
                          color: const Color(0xFF9FA8DA),
                          value: 30,
                          radius: 40,
                        ),
                        PieChartSectionData(
                          color: const Color(0xFFFFC107),
                          value: 20,
                          radius: 40,
                        ),
                      ],
                      centerSpaceRadius: 50,
                      sectionsSpace: 3,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Кнопки временных периодов
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  _buildTimePeriodButton('Нед'),
                  const SizedBox(width: 8),
                  _buildTimePeriodButton('Мес'),
                  const SizedBox(width: 8),
                  _buildTimePeriodButton('Год'),
                ],
              ),
              const SizedBox(height: 40),
              // Секция "Бюджет"
              const Text(
                'Бюджет',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  border: Border.all(color: grey),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      '0 ₽',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.calculate, color: Colors.grey.shade600),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    backgroundColor: const Color.fromARGB(255, 243, 211, 51),
                  ),
                  child: const Text(
                    'Выбрать дату',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: _buildFinancialContainer(
                      'Траты',
                      0.7,
                      '45 678 ₽',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: _buildFinancialContainer(
                      'Сбережения',
                      0.3,
                      '72 456 ₽',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: _buildIdeaContainer(
                      title:
                          'Зарабатывайте с процентов по накопительному счету',
                      description:
                          'Для этого откройте свой первый накопительный счет',
                      buttonText: 'Открыть счет',
                      context: context,
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MainScreen(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    // Действие кнопки
                  },
                  style: TextButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    backgroundColor: Colors.grey.shade200,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Показать все идеи',
                    style: TextStyle(color: blue, fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'История операций',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Операция +',
                      style: TextStyle(color: Colors.black),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 10),
              ..._buildTransactionHistory(transactions, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTimePeriodButton(String period) {
    final isSelected = period == selectedPeriod;

    return GestureDetector(
      onTap: () => _onPeriodSelected(period),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          period,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildFinancialContainer(
      String label, double percentage, String amount) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.grey.shade300, blurRadius: 5),
        ],
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            amount,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            label,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
          ),
          const SizedBox(height: 20),
          Container(
            height: 8,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(15),
            ),
            child: FractionallySizedBox(
              alignment: Alignment.centerLeft,
              widthFactor: percentage,
              child: Container(
                color: yellow,
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> _buildTransactionHistory(
      List transactions, BuildContext context) {
    return [
      _buildTransactionSection('Сегодня', transactions, context),
      const SizedBox(height: 10),
      _buildTransactionSection('Вчера', transactions, context),
      const SizedBox(height: 10),
      _buildTransactionSection('20 ноября', transactions, context),
    ];
  }

  Widget _buildTransactionSection(
      String date, List transactions, BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          date,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        ...transactions.map((transaction) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const DetailOperationScreen(),
                ),
              );
            },
            child: TransactionItem(transaction: transaction),
          );
        })
      ],
    );
  }

  Widget _buildIdeaContainer({
    required BuildContext context,
    required String title,
    required String description,
    required String buttonText,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [Color(0xFFE3F2FD), Color(0xFFBBDEFB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            description,
            style: const TextStyle(fontSize: 14, color: Colors.black54),
          ),
          const SizedBox(height: 16),
          Align(
            alignment: Alignment.centerLeft,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.33,
              child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  backgroundColor: const Color(0xFF2196F3),
                ),
                child: Text(
                  buttonText,
                  style: const TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
