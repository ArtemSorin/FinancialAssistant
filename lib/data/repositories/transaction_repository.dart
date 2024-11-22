import 'package:tinkoff/data/models/transaction_model.dart';

class TransactionRepository {
  List<TransactionModel> getTransactions() {
    return [
      TransactionModel(
          title: 'Магазин продуктов',
          date: '13 ноября, 8:34 AM',
          amount: '-68.03',
          currency: '12',
          cardNumber: '',
          cardType: '',
          isIncome: false),
      TransactionModel(
          title: 'McDonald\'s',
          date: '9 ноября, 3:52 PM',
          amount: '-21.55',
          currency: '12',
          cardNumber: '',
          cardType: '',
          isIncome: false),
      TransactionModel(
          title: 'Зарплата',
          date: '5 ноября, 9:00 AM',
          amount: '1500.00',
          currency: '12',
          cardNumber: '',
          cardType: '',
          isIncome: true),
      TransactionModel(
          title: 'Зарплата',
          date: '5 ноября, 9:00 AM',
          amount: '1500.00',
          currency: '12',
          cardNumber: '',
          cardType: '',
          isIncome: true),
      TransactionModel(
          title: 'Зарплата',
          date: '5 ноября, 9:00 AM',
          amount: '1500.00',
          currency: '12',
          cardNumber: '',
          cardType: '',
          isIncome: true),
      TransactionModel(
          title: 'Зарплата',
          date: '5 ноября, 9:00 AM',
          amount: '1500.00',
          currency: '12',
          cardNumber: '',
          cardType: '',
          isIncome: true),
    ];
  }

  TransactionModel getTransaction() {
    return TransactionModel(
      title: 'Покупка по карте',
      date: '2024-11-21',
      amount: '-5000',
      currency: '12',
      cardNumber: '',
      cardType: '',
      isIncome: false,
    );
  }
}
