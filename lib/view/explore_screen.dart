import 'package:airbnb_app_ui/components/map_with_custon_info_windows.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:airbnb_app_ui/model/place_model.dart';
import 'package:airbnb_app_ui/view/place_detail_screen.dart';
import '../components/search_bar.dart';
import '../model/category.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  int selectedIndex = 0;
  bool _isSwitched = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const SearchBarAndFilter(),
            categoryItems(size),
            Expanded(
              child: SizedBox(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      displayTotalPrice(),
                      const SizedBox(height: 15),
                      ListView.builder(
                        padding: EdgeInsets.zero,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: listOfPlace.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          final place = listOfPlace[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>
                                        PlaceDetailScreen(place: place),
                                  ),
                                );
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: SizedBox(
                                          height: 360,
                                          width: double.infinity,
                                          child: AnotherCarousel(
                                            images: place.imageUrls
                                                .map((url) => NetworkImage(url))
                                                .toList(),
                                            dotSize: 6,
                                            indicatorBgPadding: 5.0,
                                            dotBgColor: Colors.transparent,
                                          ),
                                        ),
                                      ),
                                      Positioned(
                                        top: 20,
                                        left: 15,
                                        right: 15,
                                        child: Row(
                                          children: [
                                            place.isActive == true
                                                ? Container(
                                                    decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                        40,
                                                      ),
                                                    ),
                                                    child: const Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 15,
                                                        vertical: 5,
                                                      ),
                                                      child: Text(
                                                        "Guest favorite",
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                : SizedBox(
                                                    width: size.width * 0.3,
                                                  ),
                                            const Spacer(),
                                            const Stack(
                                              alignment: Alignment.center,
                                              children: [
                                                // White border
                                                Icon(
                                                  Icons
                                                      .favorite_outline_rounded,
                                                  size: 34.0,
                                                  color: Colors.white,
                                                ),
                                                Icon(
                                                  Icons.favorite,
                                                  size: 30.0,
                                                  color: Colors.black54,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      vendorProfile(place),
                                    ],
                                  ),
                                  SizedBox(height: size.height * 0.01),
                                  Row(
                                    children: [
                                      Text(
                                        place.address,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.black,
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(Icons.star),
                                      const SizedBox(width: 5),
                                      Text(
                                        place.rating.toString(),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "Stay with ${place.vendor} . ${place.vendorProfession}",
                                    style: const TextStyle(
                                      color: Colors.black54,
                                      fontSize: 16.5,
                                    ),
                                  ),
                                  Text(
                                    place.date,
                                    style: const TextStyle(
                                      fontSize: 16.5,
                                      color: Colors.black54,
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.007),
                                  RichText(
                                    text: TextSpan(
                                      text: "\$${place.price} ",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                        fontSize: 16,
                                      ),
                                      children: const <TextSpan>[
                                        TextSpan(
                                          text: "night",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.04),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: const MapWithCustonInfoWindows(),
    );
  }

  Positioned vendorProfile(Place place) {
    return Positioned(
      bottom: 11,
      left: 10,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(15),
              bottomRight: Radius.circular(15),
            ),
            child: Image.asset(
              "asset/images/book_cover.png",
              height: 60,
              width: 60,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: 10,
            left: 10,
            child: CircleAvatar(
              backgroundImage: NetworkImage(place.vendorProfile),
            ),
          )
        ],
      ),
    );
  }

  Padding displayTotalPrice() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black26,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Display total price",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 17,
                    ),
                  ),
                  Text(
                    "Includes all fees, before taxes",
                    style: TextStyle(
                      color: Colors.black54,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              Switch(
                inactiveThumbColor: Colors.white,
                inactiveTrackColor: Colors.grey,
                value: _isSwitched,
                onChanged: (value) {
                  setState(
                    () {
                      _isSwitched = value;
                    },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Stack categoryItems(Size size) {
    return Stack(
      children: [
        const Positioned(
          left: 0,
          right: 0,
          top: 80,
          child: Divider(
            color: Colors.black12,
          ),
        ),
        SizedBox(
          height: size.height * 0.12,
          child: ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.horizontal,
            itemCount: categoriesList.length,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.only(
                    top: 20,
                    right: 20,
                    left: 20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    children: [
                      Container(
                        height: 32,
                        width: 40,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Image.network(
                          categoriesList[index].image,
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.black45,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        categoriesList[index].title,
                        style: TextStyle(
                          fontSize: 13,
                          color: selectedIndex == index
                              ? Colors.black
                              : Colors.black45,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        height: 3,
                        width: 50,
                        color: selectedIndex == index
                            ? Colors.black
                            : Colors.transparent,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
