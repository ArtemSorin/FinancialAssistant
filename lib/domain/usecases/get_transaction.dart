import '../../data/repositories/transaction_repository.dart';
import '../../data/models/transaction_model.dart';

class GetTransactionUseCase {
  final TransactionRepository repository;

  GetTransactionUseCase(this.repository);

  TransactionModel execute() {
    return repository.getTransaction();
  }
}
