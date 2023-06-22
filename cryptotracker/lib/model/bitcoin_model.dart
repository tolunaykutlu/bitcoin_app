class BitcoinMockModel {
  String name;
  String price;
  String image;
  String id;

  BitcoinMockModel({ required this.name,required this.price,required this.image,required this.id});

  BitcoinMockModel.fromJson(
      Map<String, dynamic> json, this.name, this.price, this.image, this.id) {
    name = json['name'] ??"name";
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
}
