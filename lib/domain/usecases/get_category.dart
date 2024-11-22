import '../../data/repositories/category_repository.dart';
import '../../data/models/category_model.dart';

class GetCategoryUseCase {
  final CategoryRepository repository;

  GetCategoryUseCase(this.repository);

  CategoryModel execute() {
    return repository.getCategory();
  }
}
