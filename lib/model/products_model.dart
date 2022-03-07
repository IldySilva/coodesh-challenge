class Product {
  var id;
  String? title;
  String? type;
  String? description;
  String? filename;
  int? height;
  int? width;
  String? photo_url;
  double? price;
  int? rating;
  DateTime ?upload_date;

  Product(
      {this.title,
        this.id,
        this.type,
        this.description,
        this.photo_url,
        this.filename,
        this.upload_date,
        this.height,
        this.width,
        this.price,
        this.rating});

  Product.fromJson(var documentId,Map<String, dynamic> json) {
    id=documentId;
    title = json['title'];
    type = json['type'];
    photo_url=json["photo_url"];
    upload_date=DateTime.parse(json["upload_date"]);
    description = json['description'];
    filename = json['filename'];
    height = json['height'];
    width = json['width'];
    price = json['price'];
    rating = json['rating'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['type'] = type;
    data['description'] = description;
    data['filename'] = filename;
    data['height'] = height;
    data["upload_date"]=upload_date?.toIso8601String();
    data['width'] = width;
    data['price'] = price;
    data['rating'] = rating;
    return data;
  }
}