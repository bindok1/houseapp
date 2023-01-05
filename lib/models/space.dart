
class Space {
  int? id;
  String? name;
  late String imageUrl;
  int? price;
  String? city;
  String? country;
  late int rating;
  String? address;
  String? phone;
  String? mapUrl;
  late List photos;
  late int numberOfKitchens;
  late int numberOfCupboards;
  late int numberOfBedrooms;

  Space(
      {required this.id,
      required this.name,
      required this.imageUrl,
      required this.price,
      required this.city,
      required this.rating,
      required this.country,
      required this.address,
      required this.phone,
      required this.photos,
      required this.mapUrl,
      required this.numberOfCupboards,
      required this.numberOfKitchens,
      required this.numberOfBedrooms});

//consume api
  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json['country'];
    imageUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    address = json['address'];
    photos = json['photos'];
    phone = json['phone'];
    mapUrl = json['map_url'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
    numberOfKitchens = json['number_of_kitchens'];
  }
}
