import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:yeniumut/model/city_model.dart';
import 'package:yeniumut/service/database_service.dart';

class HomePageController extends GetxController {
  CityModel? currentCity = CityModel();
  late List<CityModel> allCities;

  @override
  void onInit() async {
    allCities = await DatabaseService().getAllCityData()!;
    debugPrint('all citiessss : 1 ve 2 : ${allCities[0]} --- ${allCities[1]}');
    allCities.sort(
      (a, b) => b.gencnufus!.compareTo(a.gencnufus!),
    );
    debugPrint(
        'all citiessss after sorting: 1 ve 2 : ${allCities[0]} --- ${allCities[1]}');
    debugPrint('city controller ${allCities.length}');
    super.onInit();
  }

  setData(String cityName, String id) async {
    if (id != '63' &&
        id != '01' &&
        id != '02' &&
        id != '06' &&
        id != '07' &&
        id != '16' &&
        id != '34' &&
        id != '35' &&
        id != '42') {
      debugPrint('gelen veriler $cityName - $id');
      await FirebaseFirestore.instance.collection('Turkey').doc(id).set(
        {
          'id': id,
          'gencnufus': 0,
          'gencsuclu': 0,
          'ilkokulmezunu': 0,
          'isim': cityName,
          'lisemezunu': 0,
          'nufus': 0,
          'okulyok': 0,
          'ortaokulmezunu': 0,
          'univeustumezunu': 0,
          'yetiskinnufus': 0,
          'yetiskinsuclu': 0,
        },
      );
    } else {
      debugPrint('bu veriler zaten eklenmiş');
    }
  }

  changeCityData(String name) {
    debugPrint('name $name');
    for (var city in allCities) {
      debugPrint('city name ${city.isim}');
      if (city.isim == name) {
        debugPrint('eşleşme : ${city.isim} --- $name');
        currentCity = city;
        debugPrint(
            'current city $currentCity -- ${currentCity!.gencsuclu! / currentCity!.gencnufus!}');
        update();
        break;
      } else {
        currentCity = CityModel(
          gencnufus: 0,
          gencsuclu: 0,
          ilkokulmezunu: 0,
          isim: '',
          lisemezunu: 0,
          nufus: 0,
          okulyok: 0,
          ortaokulmezunu: 0,
          univeustumezunu: 0,
          yetiskinnufus: 0,
          yetiskinsuclu: 0,
        );
        update();
      }
    }
  }
}
