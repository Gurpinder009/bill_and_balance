class ReceiptModel {
  final String id;
  final String date;
  final double amount;
  final String category;
  final String? merchant;
  final String? notes;
  final String? imagePath;
  final bool isShared;
  final String? sharedData;
  final String createdAt;
  final String updatedAt;

  ReceiptModel({
    required this.id,
    required this.date,
    required this.amount,
    required this.category,
    this.merchant,
    this.notes,
    this.imagePath,
    this.isShared = false,
    this.sharedData,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Convert Receipt object → SQLite Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'date': date,
      'amount': amount,
      'category': category,
      'merchant': merchant,
      'notes': notes,
      'image_path': imagePath,
      'is_shared': isShared ? 1 : 0,
      'shared_data': sharedData,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  /// Convert SQLite Map → Receipt object
  factory ReceiptModel.fromMap(Map<String, dynamic> map) {
    return ReceiptModel(
      id: map['id'] as String,
      date: map['date'] as String,
      amount: (map['amount'] as num).toDouble(),
      category: map['category'] as String,
      merchant: map['merchant'] as String?,
      notes: map['notes'] as String?,
      imagePath: map['image_path'] as String?,
      isShared: map['is_shared'] == 1,
      sharedData: map['shared_data'] as String?,
      createdAt: map['created_at'] as String,
      updatedAt: map['updated_at'] as String,
    );
  }
}
