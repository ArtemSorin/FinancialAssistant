class TransactionModel {
  final String title;
  final String date;
  final String amount;
  final String currency;
  final String cardNumber;
  final String cardType;
  final bool isIncome;

  TransactionModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.currency,
    required this.cardNumber,
    required this.cardType,
    required this.isIncome,
  });
}
