class ProductListData {
  num? id;
  String? title;
  num? price;
  String? category;
  String? description;
  String? image;
  num? totalInBucket;

  ProductListData(
      {this.id,
        this.title,
        this.price,
        this.totalInBucket,
        this.category,
        this.description,
        this.image});

  ProductListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    price = json['price'];
    category = json['category'];
    description = json['description'];
    image = json['image'];
    totalInBucket = json['totalInBucket'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['price'] = price;
    data['category'] = category;
    data['description'] = description;
    data['image'] = image;
    data['totalInBucket'] = totalInBucket;
    return data;
  }
}