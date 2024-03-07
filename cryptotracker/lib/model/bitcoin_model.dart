class BitcoinMockModel {
  String name;
  String price;
  String image;
  String id;

  BitcoinMockModel({
    required this.name,
    required this.price,
    required this.image,
    required this.id,
  });

  BitcoinMockModel.fromJson(
      Map<String, dynamic> json, this.name, this.price, this.image, this.id) {
    name = json['name'] ?? "name";
    price = json['price'] ?? "price";
    image = json['image'] ?? "iimage";
    id = json['id'] ?? "id";
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['id'] = id;
    return data;
  }

  BitcoinMockModel copyWith({
    String? name,
    String? price,
    String? image,
    String? id,
  }) {
    return BitcoinMockModel(
      name: name ?? this.name,
      price: price ?? this.price,
      image: image ?? this.image,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'price': price,
      'image': image,
      'id': id,
    };
  }

  factory BitcoinMockModel.fromMap(Map<String, dynamic> map) {
    return BitcoinMockModel(
      name: map['name'] as String,
      price: map['price'] as String,
      image: map['image'] as String,
      id: map['id'] as String,
    );
  }

  @override
  String toString() {
    return 'BitcoinMockModel(name: $name, price: $price, image: $image, id: $id)';
  }

  @override
  bool operator ==(covariant BitcoinMockModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.price == price &&
        other.image == image &&
        other.id == id;
  }

  @override
  int get hashCode {
    return name.hashCode ^ price.hashCode ^ image.hashCode ^ id.hashCode;
  }
}
