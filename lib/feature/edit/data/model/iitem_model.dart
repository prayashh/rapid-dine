class ItemModel {
  final String id;
  final String itemName;
  final String description;
  final double price;
  final bool hidden;
  final String category;
  final String imageUrl;
  final String imageId;
  final String createdAt;
  final String updatedAt;

  ItemModel({
    required this.id,
    required this.itemName,
    required this.description,
    required this.price,
    required this.hidden,
    required this.category,
    required this.imageUrl,
    required this.imageId,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ItemModel.fromJson(Map<String, dynamic> json) {
    return ItemModel(
      id: json['_id'],
      itemName: json['itemName'],
      description: json['description'],
      price: json['price'].toDouble(),
      hidden: json['hidden'],
      category: json['category'],
      imageUrl: json['image']['imageUrl'],
      imageId: json['image']['imageId'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'itemName': itemName,
      'description': description,
      'price': price,
      'hidden': hidden,
      'category': category,
      'image': {
        'imageUrl': imageUrl,
        'imageId': imageId,
      },
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }
}
