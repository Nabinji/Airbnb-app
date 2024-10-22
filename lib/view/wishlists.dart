import 'package:airbnb_app_ui/Provider/favorite_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Wishlists extends StatelessWidget {
  const Wishlists({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = FavoriteProvider.of(context);
    final favoriteItems = provider.favorites;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    "Edit",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                const Text(
                  "Wishlists",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                  const SizedBox(height: 5),
                favoriteItems.isEmpty
                    ? const Text(
                        "No Favorites items yet",
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    : SizedBox(
                        height: MediaQuery.of(context).size.height * 0.68,
                        child: GridView.builder(
                          itemCount: favoriteItems.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 8,mainAxisSpacing: 8
                            ),
                            itemBuilder: (context, index) {
                              String favorite = favoriteItems[index];
                              return FutureBuilder(
                                  future: FirebaseFirestore.instance
                                      .collection("myAppCpollection")
                                      .doc(favorite)
                                      .get(),
                                  builder: (context, snapShot) {
                                    if (snapShot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const Center(
                                        child: CircularProgressIndicator(),
                                      );
                                    }
                                    if (!snapShot.hasData ||
                                        snapShot.data == null) {
                                      return const Center(
                                        child: Text("Error loading favorites"),
                                      );
                                    }
                                    var favoriteItems = snapShot.data!;
                                    return Stack(
                                      children: [
                                        // image of favorite items
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            image: DecorationImage(
                                              fit: BoxFit.cover,
                                              image: NetworkImage(
                                                favoriteItems['image'],
                                              ),
                                            ),
                                          ),
                                        ),
                                        // favorite icon in the top right corner
                                        const Positioned(
                                          top: 8,
                                          right: 8,
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                          ),
                                        ),
                                        // title of favorite items
                                        Positioned(
                                            bottom: 8,
                                            left: 8,
                                            right: 8,
                                            child: Container(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              padding: const EdgeInsets.all(4),
                                              child: Text(
                                                favoriteItems['title'],
                                                style: const TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                      ],
                                    );
                                  });
                            }),
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
