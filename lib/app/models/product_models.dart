class ProductModels {
  final int? id;
  final String name;
  final String barcode;
  final String date;
  final String option;
  final String? description;

  ProductModels({
    this.id,
    required this.name,
    required this.barcode,
    required this.date,
    required this.option,
    this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'barcode': barcode,
      'date': date,
      'option': option,
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
      description: map['description'],
    );
  }

  ProductModels copyWith({
    int? id,
    String? name,
    String? barcode,
    String? date,
    String? option,
    String? description,
  }) {
    return ProductModels(
      id: id ?? this.id,
      name: name ?? this.name,
      barcode: barcode ?? this.barcode,
      date: date ?? this.date,
      option: option ?? this.option,
      description: description ?? this.description,
    );
  }
}
