class ProductModels {
  final int? id;
  final String name;
  final String barcode;
  final String date;
  final String option;
  final String? description;

  ProductModels({
    required this.id,
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
      id: map['id'] ,
      name: map['name'] as String,
      barcode: map['barcode'] as String,
      date: map['date'] as String,
      option: map['option'] as String,
      description: map['description'] as String,
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
