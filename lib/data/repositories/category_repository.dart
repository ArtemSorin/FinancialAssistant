import '../models/category_model.dart';

class CategoryRepository {
  CategoryModel getCategory() {
    return CategoryModel(
      title: 'Категория',
      description: 'Обязательные расходы\n2% трат в этой категории',
      percentageSpent: 0.2,
    );
  }
}
