String formatCurrency(String amount) {
  try {
    double value = double.parse(amount);
    return value
        .toStringAsFixed(2)
        .replaceAllMapped(
          RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
          (Match m) => '${m[1]},',
        );
  } catch (e) {
    return amount; // Return original if parsing fails
  }
}
