import 'package:city_picker_from_map/city_picker_from_map.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yeniumut/view/all_city_data.dart';
import 'package:yeniumut/viewModel/home_page_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  City? selectedCity;
  String cityName = '';
  final GlobalKey<CityPickerMapState> _mapKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      init: HomePageController(),
      builder: (ctrl) => Scaffold(
        backgroundColor: Color(0xFF2F4858),
        appBar: AppBar(
          backgroundColor: Colors.greenAccent,
          actions: [
            GestureDetector(
              onTap: () => Get.to(AllCityData(
                allCityData: ctrl.allCities,
              )),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Tüm Şehirler',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            )
          ],
          title: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                    //border: Border.all(width: 2),
                    borderRadius: BorderRadius.circular(150)),
                child: Image.asset(
                  'assets/icon.png',
                  height: 70,
                  width: 70,
                  fit: BoxFit.fitHeight,
                ),
              ),
              const Text('Yeni Umut'),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.4,
              ),
              Text(cityName),
            ],
          ),
          elevation: 0,
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: cityName == ''
                    ? MediaQuery.of(context).size.width * 0.25
                    : MediaQuery.of(context).size.width * 0.18,
              ),
              InteractiveViewer(
                scaleEnabled: true,
                panEnabled: true,
                constrained: true,
                child: CityPickerMap(
                  key: _mapKey,
                  width: double.infinity,
                  height: double.infinity,
                  map: Maps.TURKEY,
                  onChanged: (city) async {
                    await ctrl.setData(city!.title, city.id.split('-')[1]);
                    // await ctrl.changeCityData(city!.title);
                    setState(() {
                      selectedCity = city;
                      cityName = city.title;
                      debugPrint('şehir id : ${city.title}');
                      debugPrint('şehir id : ${city.id.split('-')[1]}');
                    });
                  },
                  actAsToggle: true,
                  dotColor: const Color(0xFF27677B),
                  selectedColor: const Color(0xFF28CEB1),
                  strokeColor: Colors.white,
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.05),
              if (cityName != '')
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DataTable(
                      showBottomBorder: true,
                      border: TableBorder(
                        top: const BorderSide(
                          color: Color(0xFF28CEB1),
                        ),
                        left: const BorderSide(
                          color: Color(0xFF28CEB1),
                        ),
                        right: const BorderSide(
                          color: Color(0xFF28CEB1),
                        ),
                        bottom: const BorderSide(
                          color: Color(0xFF28CEB1),
                        ),
                        horizontalInside: const BorderSide(
                          color: Color(0xFF28CEB1),
                        ),
                        verticalInside: const BorderSide(
                          color: Color(0xFF28CEB1),
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      columns: [
                        const DataColumn(
                          label: Text(
                            'Şehir',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            cityName,
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                      rows: [
                        DataRow(
                          cells: [
                            DataCell(
                              Text(
                                'Nüfus',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                ctrl.currentCity!.nufus == 0
                                    ? 'Veri yok'
                                    : ctrl.currentCity!.nufus.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            const DataCell(
                              Text(
                                'Nüfus(18 yaş altı)',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                ctrl.currentCity!.nufus == 0
                                    ? 'Veri yok'
                                    : ctrl.currentCity!.gencnufus.toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            const DataCell(
                              Text(
                                'İşlenen Suç Sayısı',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                ctrl.currentCity!.nufus == 0
                                    ? 'Veri yok'
                                    : ctrl.currentCity!.yetiskinsuclu
                                        .toString(),
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        DataRow(
                          cells: [
                            const DataCell(
                              Text(
                                'İşlenen Çocuk Suç Sayısı',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                ctrl.currentCity!.nufus == 0
                                    ? 'Veri yok'
                                    : ctrl.currentCity!.gencsuclu
                                        .toString(), // '${}',
                                style: const TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}
