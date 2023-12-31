import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../util/db/entity/house.dart';

class HouseDataProviderService extends ChangeNotifier {
  late final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  int _homeInformationIndex = 0;
  int get homeInformationIndex => _homeInformationIndex;

  Map<String, House> houses = {};

  HouseDataProviderService();

  void changeHomeInformationIndex(int index) {
    _homeInformationIndex = index;
    notifyListeners();
  }

  Future<void> loadHouseData() async {
    QuerySnapshot querySnapshot = await _firestore.collection('house').get();
    for (var doc in querySnapshot.docs) {
      House house = House.fromDocumentSnapshot(doc);
      houses[house.id] = house;
    }
    notifyListeners();
  }
}
