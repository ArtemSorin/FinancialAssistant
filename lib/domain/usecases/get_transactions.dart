import 'package:tinkoff/data/repositories/transaction_repository.dart';
import 'package:tinkoff/data/models/transaction_model.dart';

class GetTransactions {
  final TransactionRepository repository;

  GetTransactions(this.repository);

  List<TransactionModel> execute() {
    return repository.getTransactions();
  }
}
