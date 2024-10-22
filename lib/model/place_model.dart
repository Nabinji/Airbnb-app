// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> savePlacesToFirebase() async {
  final CollectionReference ref =
      FirebaseFirestore.instance.collection("myAppCpollection");
  for (final Place place in listOfPlace) {
    final String id =
        DateTime.now().toIso8601String() + Random().nextInt(1000).toString();
    ref.doc("das");
    await ref.doc(id).set(place.toMap());
  }
}

class Place {
  final String title;
  bool isActive;
  final String image;
  final double rating;
  final String date;
  final int price;
  final String address;
  final String vendor;
  final String vendorProfession;
  final String vendorProfile;
  final int review;
  final String bedAndBathroom;
  final int yearOfHostin;
  final double latitude;
  final double longitude;
  final List<String> imageUrls;

  Place(
      {required this.title,
      required this.isActive,
      required this.image,
      required this.rating,
      required this.date,
      required this.price,
      required this.address,
      required this.vendor,
      required this.vendorProfession,
      required this.vendorProfile,
      required this.review,
      required this.bedAndBathroom,
      required this.yearOfHostin,
      required this.latitude,
      required this.longitude,
      required this.imageUrls});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'isActive': isActive,
      'image': image,
      'rating': rating,
      'date': date,
      'price': price,
      'address': address,
      'vendor': vendor,
      'vendorProfession': vendorProfession,
      'vendorProfile': vendorProfile,
      'review': review,
      'bedAndBathroom': bedAndBathroom,
      'yearOfHostin': yearOfHostin,
      'latitude': latitude,
      'longitude': longitude,
      'imageUrls': imageUrls,
    };
  }
}

final List<Place> listOfPlace = [
  Place(
    isActive: true,
    title: "Nice small bedroom in a nice small house",
    image:
        "https://www.momondo.in/himg/b1/a8/e3/revato-1172876-6930557-765128.jpg",
    rating: 4.85,
    review: 126,
    bedAndBathroom: "1 bed . Shared bathroom",
    date: "Nov 11-16",
    price: 38,
    address: "Kathmandu, Nepal",
    vendor: "Marianne",
    vendorProfession: "Retired",
    yearOfHostin: 10,
    vendorProfile:
        "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
    latitude: 27.7293,
    longitude: 85.3343,
    imageUrls: [
      "https://www.momondo.in/himg/b1/a8/e3/revato-1172876-6930557-765128.jpg",
      "https://media.timeout.com/images/105162711/image.jpg",
      "https://www.telegraph.co.uk/content/dam/Travel/hotels/2023/september/one-and-only-cape-town-product-image.jpg",
      "https://www.theindiahotel.com/extra-images/banner-01.jpg",
    ],
  ),
  Place(
    isActive: false,
    title: "Cosy room in fabulous condo!",
    image:
        "https://www.telegraph.co.uk/content/dam/Travel/hotels/2023/september/one-and-only-cape-town-product-image.jpg",
    rating: 4.55,
    date: "Oct 01-06",
    review: 26,
    yearOfHostin: 6,
    bedAndBathroom: "1 double bed . Shared bathroom",
    price: 88,
    address: "Cape Town, South Africa",
    vendor: "Tracey",
    vendorProfession: "Holistic therapist",
    vendorProfile:
        "https://www.perfocal.com/blog/content/images/size/w960/2021/01/Perfocal_17-11-2019_TYWFAQ_100_standard-3.jpg",
    latitude: -33.922,
    longitude: 18.4231,
    imageUrls: [
      "https://www.telegraph.co.uk/content/dam/Travel/hotels/2023/september/one-and-only-cape-town-product-image.jpg",
      "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/de/f7/c3/standard-room.jpg?w=1200&h=-1&s=1",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTuMkI1MoQDzLBF-prjIp6kyXpccVol16bsew&s"
    ],
  ),
  Place(
    isActive: true,
    title: "Bright room in nice apartment bas faron",
    image: "https://www.theindiahotel.com/extra-images/banner-01.jpg",
    rating: 4.77,
    date: "Oct 10-16",
    price: 34,
    address: "Mumbai, India",
    yearOfHostin: 4,
    review: 160,
    bedAndBathroom: "1 bed . Shared bathroom",
    vendor: "Ole",
    vendorProfession: "Consultant",
    vendorProfile:
        "https://shotkit.com/wp-content/uploads/bb-plugin/cache/cool-profile-pic-matheus-ferrero-landscape-6cbeea07ce870fc53bedd94909941a4b-zybravgx2q47.jpeg",
    latitude: 19.0760,
    longitude: 72.8777,
    imageUrls: [
      "https://www.theindiahotel.com/extra-images/banner-01.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRgCXf3HATaGRx4_GtvzW8FVnYfXKRQMuRzOg&s",
      "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/de/f7/c3/standard-room.jpg?w=1200&h=-1&s=1",
      "https://radissonhotels.iceportal.com/image/radisson-hotel-kathmandu/exterior/16256-114182-f75152296_3xl.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ1P0AxSntzNAgs2_Qnl1IJCb2EebN82-KbPg&s",
    ],
  ),
  Place(
    isActive: true,
    title: "Connect with your heart to this magical place",
    image:
        "https://lyon.intercontinental.com/wp-content/uploads/sites/6/2019/11/Superior-Room-cEric-Cuvillier-2.jpg",
    rating: 4.33,
    date: "Dec 17-22",
    price: 76,
    address: "Lyon, France",
    yearOfHostin: 8,
    review: 236,
    bedAndBathroom: "2 queen beds . Shared bathroom",
    vendor: "Benedicte",
    vendorProfession: "Teacher",
    vendorProfile:
        "https://media.istockphoto.com/id/1300512215/photo/headshot-portrait-of-smiling-ethnic-businessman-in-office.webp?b=1&s=170667a&w=0&k=20&c=TXCiY7rYEvIBd6ibj2bE-VbJu0rRGy3MlHwxt2LHt9w=",
    latitude: 45.7640,
    longitude: 4.8357,
    imageUrls: [
      "https://lyon.intercontinental.com/wp-content/uploads/sites/6/2019/11/Superior-Room-cEric-Cuvillier-2.jpg",
      "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0e/de/f7/c3/standard-room.jpg?w=1200&h=-1&s=1",
      "https://www.grandhotelnepal.com/images/slideshow/3arzB-grand4.jpg",
    ],
  ),
  Place(
    isActive: false,
    title: "En-Suite @ Sunrise Beach",
    image: "https://media.timeout.com/images/105162711/image.jpg",
    rating: 4.90,
    date: "Jan 26-29",
    price: 160,
    review: 292,
    yearOfHostin: 10,
    bedAndBathroom: "1 double bed . Dedicated bathroom",
    address: "Rome, Italy",
    vendor: "Leva",
    vendorProfession: "Teacher",
    vendorProfile:
        "https://media.istockphoto.com/id/1476171646/photo/young-woman-ready-for-job-business-concept.webp?b=1&s=170667a&w=0&k=20&c=oegktY4Hijr4wOelujTp81I0BJPjD6Q-lb5BpwOj0kA=",
    latitude: 41.8967,
    longitude: 12.4822,
    imageUrls: [
      "https://media.timeout.com/images/105162711/image.jpg",
      "https://www.momondo.in/himg/b1/a8/e3/revato-1172876-6930557-765128.jpg",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR_Kz2H05mZVaPIZWVbXRADEASKvBCLJv4oeg&s",
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRctRmBUpKa5HWwWKaL9TeVTZNHfabImL8cLQ&s",
    ],
  ),
];
