import 'dart:convert';

class ProductModel {
  String id;
  final String material;
  final String height;
  final String image;
  final String model;
  final String price;
  final String width;
  final String size;
  final String description;
  ProductModel({
    required this.id,
    required this.material,
    required this.height,
    required this.image,
    required this.model,
    required this.price,
    required this.width,
    required this.size,
    required this.description,
  });

  ProductModel copyWith({
    String? id,
    String? material,
    String? height,
    String? image,
    String? model,
    String? price,
    String? width,
    String? size,
    String? description,
  }) {
    return ProductModel(
      id: id ?? this.id,
      material: material ?? this.material,
      height: height ?? this.height,
      image: image ?? this.image,
      model: model ?? this.model,
      price: price ?? this.price,
      width: width ?? this.width,
      size: size ?? this.size,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'material': material});
    result.addAll({'height': height});
    result.addAll({'image': image});
    result.addAll({'model': model});
    result.addAll({'price': price});
    result.addAll({'width': width});
    result.addAll({'size': size});
    result.addAll({'description': description});

    return result;
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      id: map['id'] ?? '',
      material: map['material'] ?? '',
      height: map['height'] ?? '',
      image: map['image'] ?? '',
      model: map['model'] ?? '',
      price: map['price'] ?? '',
      width: map['width'] ?? '',
      size: map['size'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ProductModel(id: $id, material: $material, height: $height, image: $image, model: $model, price: $price, width: $width, size: $size, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ProductModel &&
        other.id == id &&
        other.material == material &&
        other.height == height &&
        other.image == image &&
        other.model == model &&
        other.price == price &&
        other.width == width &&
        other.size == size &&
        other.description == description;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        material.hashCode ^
        height.hashCode ^
        image.hashCode ^
        model.hashCode ^
        price.hashCode ^
        width.hashCode ^
        size.hashCode ^
        description.hashCode;
  }
}
