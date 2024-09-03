import 'package:airbnb_app_ui/components/google_map.dart';
import 'package:airbnb_app_ui/components/icon_button.dart';
import 'package:airbnb_app_ui/components/star_rating.dart';
import 'package:airbnb_app_ui/model/place_model.dart';
import 'package:another_carousel_pro/another_carousel_pro.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatefulWidget {
  final Place place;
  const PlaceDetailScreen({super.key, required this.place});

  @override
  State<PlaceDetailScreen> createState() => _PlaceDetailScreenState();
}

class _PlaceDetailScreenState extends State<PlaceDetailScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        // physics: AlwaysScrollableScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            imageAndIcons(size, context),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 25,
                vertical: 20,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.place.title,
                    maxLines: 2,
                    style: const TextStyle(
                        fontSize: 25,
                        height: 1.2,
                        fontWeight: FontWeight.bold,
                        overflow: TextOverflow.ellipsis),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    "Room in ${widget.place.address}",
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    widget.place.bedAndBathroom,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            widget.place.isActive == true
                ? ratingAndStar()
                : ratingAndStarFalse(),
            SizedBox(
              height: size.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(),
                  propertyList(
                    size,
                    "https://static.vecteezy.com/system/resources/previews/018/923/486/original/diamond-symbol-icon-png.png",
                    "This is a rare find",
                    "${widget.place.vendor}'s place is usually fully booked.",
                  ),
                  const Divider(),
                  propertyList(
                    size,
                    widget.place.vendorProfile,
                    "Stay with ${widget.place.vendor}",
                    "Superhost . ${widget.place.yearOfHostin} years hosting",
                  ),
                  const Divider(),
                  propertyList(
                      size,
                      "https://cdn-icons-png.flaticon.com/512/6192/6192020.png",
                      "Room in a rental unit",
                      "Your own room in a home, pluse access\nto shared spaces."),
                  propertyList(
                      size,
                      "https://cdn0.iconfinder.com/data/icons/co-working/512/coworking-sharing-17-512.png",
                      "Shared common spaces",
                      "You'll share parts of the home with the host,"),
                  propertyList(
                      size,
                      "https://img.pikbest.com/element_our/20230223/bg/102f90fb4dec6.png!w700wp",
                      "Shared bathroom",
                      "Your'll share the bathroom with others."),
                  const Divider(),
                  SizedBox(height: size.height * 0.02),
                  const Text(
                    "About this place",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
                  const Divider(),
                  SizedBox(height: size.height * 0.02),
                  const Text(
                    "Where you'll be",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    widget.place.address,
                    style: const TextStyle(fontSize: 18),
                  ),
                  SizedBox(
                    height: 400,
                    width: size.width,
                    child: GoogleMapFlutter(place: widget.place),
                  ),
                  const SizedBox(height: 100),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomSheet: mybottomSheet(size),
    );
  }

  Container mybottomSheet(Size size) {
    return Container(
      height: size.height * 0.1,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(
          color: Colors.black12,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  text: "\$${widget.place.price} ",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18,
                  ),
                  children: const <TextSpan>[
                    TextSpan(
                      text: "night",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.place.date,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          ),
          SizedBox(width: size.width * 0.3),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 35,
              vertical: 15,
            ),
            decoration: BoxDecoration(
              color: Colors.pink,
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text(
              "Reserve",
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Padding propertyList(Size size, image, title, subtitle) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15),
      child: Row(
        children: [
          const Divider(),
          CircleAvatar(
            backgroundColor: Colors.white,
            backgroundImage: NetworkImage(image),
            radius: 29,
          ),
          SizedBox(
            width: size.width * 0.05,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  subtitle,
                  softWrap:
                      true, // Ensures the text wraps when it reaches the end of the available space
                  overflow:
                      TextOverflow.visible, // Prevents truncation or ellipsis
                  style: TextStyle(
                    fontSize: size.width * 0.0346,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Padding ratingAndStarFalse() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.star),
          const SizedBox(width: 5),
          Text(
            "${widget.place.rating.toString()} . ",
            style: const TextStyle(
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "${widget.place.review.toString()}reviews",
            style: const TextStyle(
                fontSize: 17,
                decoration: TextDecoration.underline,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }

  Container ratingAndStar() {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 13,
        vertical: 5,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 8,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black26,
        ),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Text(
                widget.place.rating.toString(),
                style: const TextStyle(
                  height: 1,
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              StarRating(
                rating: widget.place.rating.toDouble(),
              )
            ],
          ),
          Stack(
            children: [
              Image.network(
                "https://wallpapers.com/images/hd/golden-laurel-wreathon-teal-background-k5791qxis5rtcx7w-k5791qxis5rtcx7w.png",
                height: 50,
                width: 130,
                color: Colors.amber,
              ),
              const Positioned(
                left: 35,
                child: Text(
                  "Guest\nfavorite",
                  style: TextStyle(
                    height: 1.2,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                widget.place.review.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 17,
                ),
              ),
              const Text(
                "Reviews",
                style: TextStyle(
                  height: 0.7,
                  color: Colors.black,
                  decoration: TextDecoration.underline,
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Stack imageAndIcons(Size size, BuildContext context) {
    final int totalSlides = widget.place.imageUrls.length;
    return Stack(
      children: [
        SizedBox(
          height: size.height * 0.35,
          child: AnotherCarousel(
            images:
                widget.place.imageUrls.map((url) => NetworkImage(url)).toList(),
            showIndicator: false, // Hide the default dot indicator
            dotBgColor: Colors.transparent,
            onImageChange: (previousIndex, currentIndex) {
              setState(() {
                _currentIndex = currentIndex;
              });
            },
            autoplay: true,
            boxFit: BoxFit.cover,
          ),
        ),
        Positioned(
          bottom: 10,
          right: 20,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: Colors.black45),
            child: Text(
              '${_currentIndex + 1} / $totalSlides',
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
                color:
                    Colors.white, // Ensure visibility on different backgrounds
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const MyIconButton(icon: Icons.arrow_back_ios_new)),
                SizedBox(width: size.width * 0.55),
                const MyIconButton(icon: Icons.share_outlined),
                const SizedBox(width: 20),
                const MyIconButton(icon: Icons.favorite_border),
              ],
            ),
          ),
        )
      ],
    );
  }
}
