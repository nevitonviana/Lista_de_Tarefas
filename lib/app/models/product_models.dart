class ProductModels {
  final int? id;
  final String name;
  final String barcode;
  final String date;
  final String option;
  final String? isDowngrade;
  final String? amount;
  final String? description;

  ProductModels({
    this.id,
    required this.name,
    required this.barcode,
    required this.date,
    required this.option,
    this.isDowngrade = 'false',
    this.amount,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'barcode': barcode,
      'date': date,
      'option': option,
      'isDowngrade': isDowngrade,
      'amount': amount,
      'description': description,
    };
  }

  factory ProductModels.fromMap(Map<String, dynamic> map) {
    return ProductModels(
      id: map['id'],
      name: map['name'],
      barcode: map['barcode'],
      date: map['date'],
      option: map['option'],
      isDowngrade: map['isDowngrade'],
      amount: map['amount'],
      description: map['description'],
    );
  }

  ProductModels copyWith({
    int? id,
    String? name,
    String? barcode,
    String? date,
    String? option,
    String? isDowngrade,
    String? amount,
    String? description,
  }) {
    return ProductModels(
      id: id ?? this.id,
      name: name ?? this.name,
      barcode: barcode ?? this.barcode,
      date: date ?? this.date,
      option: option ?? this.option,
      isDowngrade: isDowngrade ?? this.isDowngrade,
      amount: amount ?? this.amount,
      description: description ?? this.description,
    );
  }
}
