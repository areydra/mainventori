class ProductListControllerError {
  late bool code;
  late bool name;
  late bool category;
  late bool supplier;
  late bool buyingPrice;
  late bool quantity;
  late bool unit;
  late bool dateIn;
  late bool minStock;

  ProductListControllerError({
    required this.code,
    required this.name,
    required this.category,
    required this.supplier,
    required this.buyingPrice,
    required this.quantity,
    required this.unit,
    required this.dateIn,
    required this.minStock,
  });
}
