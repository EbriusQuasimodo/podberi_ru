
class PromoCodesCategoryFiltersModel {
  final List<PromoCodesAllCategoriesFilters> promoCodesAllCategories;

  PromoCodesCategoryFiltersModel({required this.promoCodesAllCategories});
}

class PromoCodesAllCategoriesFilters {
  final String category;
  final String imagePath;

  PromoCodesAllCategoriesFilters({
    required this.category,
    required this.imagePath,
  });
}