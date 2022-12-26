import 'package:city_picker_from_map/city_picker_from_map.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:yeniumut/model/city_model.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<CityModel>>? getAllCityData() async {
    List<CityModel> allCityData = [];
    try {
      var query = await _firestore.collection('Turkey').get();
      for (var item in query.docs) {
        debugPrint('city data ${item.data()}');
        var city = CityModel.fromJson(item.data());
        allCityData.add(city);
      }
      debugPrint('all city data ${allCityData.length}');
      return allCityData;
    } catch (e) {
      debugPrint('getallcity exception $e');
      return Future.value([]);
    }
  }
}
