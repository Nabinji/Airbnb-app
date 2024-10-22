// ignore_for_file: avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProvider extends ChangeNotifier {
  // we hae also save the favorite items in firebase and display it in nex time
  // it is not loast until user remove from favoite
  List<String> _favoriteIds = [];
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  List<String> get favorites => _favoriteIds;
  
  FavoriteProvider() {
    loadFavorite();
  }

  // toggle favorites states
  void toggleFavorite(DocumentSnapshot place) async {
    String placeId = place.id;
    if (_favoriteIds.contains(placeId)) {
      _favoriteIds.remove(placeId);
      await _removeFavorite(placeId); // remove grom favorite
    } else {
      _favoriteIds.add(placeId);
      await _addFavorites(placeId); // add to favorite
    }
    notifyListeners();
  }

  // check if a place is afavorited
  bool isExist(DocumentSnapshot place) {
    return _favoriteIds.contains(place.id);
  }

  // add favorites items to firestore
  Future<void> _addFavorites(String placeId) async {
    try {
      // create the userFavorite collection and add items as favorites in firestore
      await firebaseFirestore
          .collection("userFavorites")
          .doc(placeId)
          .set({'isFavorite': true});
    } catch (e) {
      print(e.toString());
    }
  }

  // remove favorites items from friestore
  Future<void> _removeFavorite(String placeId) async {
    try {
      // create the userFavorite collection and add items as favorites in firestore
      await firebaseFirestore.collection("userFavorites").doc(placeId).delete();
    } catch (e) {
      print(e.toString());
    }
  }

  // load favorites itesm from firestore (if user make some items favorite then load this items)
  Future<void> loadFavorite() async {
    try {
      QuerySnapshot snapshot =
          await firebaseFirestore.collection("userFavorites").get();
      _favoriteIds = snapshot.docs.map((doc) => doc.id).toList();
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }

  // Static method to access the provider from any context
  static FavoriteProvider of(BuildContext context, {bool listen = true}) {
    return Provider.of<FavoriteProvider>(
      context,
      listen: listen,
    );
  }
}
