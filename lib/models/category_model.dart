class CategoryModel {
  final String id;
  final String name;
  final String type;
  final String createdAt;

  CategoryModel({
    required this.id,
    required this.name,
    required this.type,
    required this.createdAt,
  });

  /// Convert CategoryModel → SQLite Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'created_at': createdAt,
    };
  }

  /// Convert SQLite Map → CategoryModel
  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      id: map['id'] as String,
      name: map['name'] as String,
      type: map['type'] as String,
      createdAt: map['created_at'] as String,
    );
  }
}
