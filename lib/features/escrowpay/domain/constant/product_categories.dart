class ProductCategories {
  static const String foodBeverages = 'food_beverages';
  static const String electronics = 'electronics';
  static const String fashion = 'fashion';
  static const String homeGarden = 'home_garden';
  static const String sportsOutdoors = 'sports_outdoors';
  static const String beautyHealth = 'beauty_health';
  static const String toysGames = 'toys_games';
  static const String booksMedia = 'books_media';
  static const String automotive = 'automotive';
  static const String transport = 'transport';
  static const String services = 'services';
  static const String other = 'other';

  static const List<CategoryItem> categories = [
    CategoryItem(value: foodBeverages, label: 'Food & Beverages'),
    CategoryItem(value: electronics, label: 'Electronics'),
    CategoryItem(value: fashion, label: 'Fashion & Apparel'),
    CategoryItem(value: homeGarden, label: 'Home & Garden'),
    CategoryItem(value: sportsOutdoors, label: 'Sports & Outdoors'),
    CategoryItem(value: beautyHealth, label: 'Beauty & Health'),
    CategoryItem(value: toysGames, label: 'Toys & Games'),
    CategoryItem(value: booksMedia, label: 'Books & Media'),
    CategoryItem(value: automotive, label: 'Automotive'),
    CategoryItem(value: transport, label: 'Transport'),
    CategoryItem(value: services, label: 'Services'),
    CategoryItem(value: other, label: 'Other'),
  ];
}

class CategoryItem {
  final String value;
  final String label;

  const CategoryItem({required this.value, required this.label});
}
