//langkah membuat model
//buat class//
//masukan tipe data
class City {
  int id;
  String name;
  String imageUrl;
  //menambahkan kota favorit
  bool? isPopular;

//buat constructor
  City(
      {required this.id,
      required this.imageUrl,
      required this.name,
       this.isPopular});
}
