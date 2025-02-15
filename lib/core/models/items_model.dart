class Item {
  String itemId;
  String name;
  int quantity;
  double price;
  String category;

  Item({
    required this.itemId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.category,
  });

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      itemId: map['itemId'],
      name: map['name'],
      quantity: map['quantity'],
      price: map['price'],
      category: map['category'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'itemId': itemId,
      'name': name,
      'quantity': quantity,
      'price': price,
      'category': category,
    };
  }
}
