import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:yeniumut/model/city_model.dart';
import 'package:yeniumut/model/education_model.dart';

class AllCityData extends StatelessWidget {
  List<CityModel>? allCityData;
  AllCityData({super.key, this.allCityData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF2F4858),
      body: Padding(
        padding: const EdgeInsets.all(0.0),
        child: Center(
          child: SingleChildScrollView(
            child: DataTable(
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
              columns: const [
                DataColumn(
                    label: Expanded(
                      child: Text(
                        'Şehir',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    tooltip: 'denme1'),
                DataColumn(
                    label: Text(
                      'Nufüs',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    tooltip: 'denme2'),
                DataColumn(
                    label: Expanded(
                      child: Text(
                        'Yetiskin Nufüs',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    tooltip: 'denme3'),
                DataColumn(
                    label: Expanded(
                      child: Text(
                        'Yetişkin Suçlu',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    tooltip: 'denme4'),
                DataColumn(
                    label: Expanded(
                      child: Text(
                        'Genç Nufüs',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    tooltip: 'denme5'),
                DataColumn(
                    label: Expanded(
                      child: Text(
                        'Genç Suçlu',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    tooltip: 'denme6'),
                DataColumn(
                    label: Expanded(
                      child: Text(
                        'Okul Yok',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    tooltip: 'denme7'),
                DataColumn(
                    label: Expanded(
                      child: Text(
                        'İlkokul Mezunu',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    tooltip: 'denme8'),
                DataColumn(
                    label: Expanded(
                      child: Text(
                        'Ortaokul Mezunu',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    tooltip: 'denme9'),
                DataColumn(
                    label: Expanded(
                      child: Text(
                        'Lise Mezunu',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    tooltip: 'denme10'),
                DataColumn(
                    label: Expanded(
                      child: Text(
                        'Üniversite Mezunu',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    tooltip: 'denme11'),
              ],
              rows: allCityData!
                  .map(
                    (data) => DataRow(
                      cells: [
                        DataCell(InkWell(
                          onTap: () async {
                            var result = await FirebaseFirestore.instance
                                .collection('Turkey')
                                .doc(data.id)
                                .collection('egitim')
                                .doc('ilkokul')
                                .get();

                            var result1 = await FirebaseFirestore.instance
                                .collection('Turkey')
                                .doc(data.id)
                                .collection('egitim')
                                .doc('lise')
                                .get();
                            var result2 = await FirebaseFirestore.instance
                                .collection('Turkey')
                                .doc(data.id)
                                .collection('egitim')
                                .doc('okulyok')
                                .get();
                            var result3 = await FirebaseFirestore.instance
                                .collection('Turkey')
                                .doc(data.id)
                                .collection('egitim')
                                .doc('ortaokul')
                                .get();

                            var a = EducationModel.fromJson(result.data()!);
                            debugPrint('aaaaaaaaaaa $a');
                            var b = EducationModel.fromJson(result1.data()!);

                            var c = EducationModel.fromJson(result2.data()!);
                            var d = EducationModel.fromJson(result3.data()!);

                            var e = await FirebaseFirestore.instance
                                .collection('Turkey')
                                .doc(data.id)
                                .collection('ekonomi')
                                .doc('fakir')
                                .get();

                            var f = await FirebaseFirestore.instance
                                .collection('Turkey')
                                .doc(data.id)
                                .collection('ekonomi')
                                .doc('orta')
                                .get();
                            var g = await FirebaseFirestore.instance
                                .collection('Turkey')
                                .doc(data.id)
                                .collection('ekonomi')
                                .doc('zengin')
                                .get();

                            Get.dialog(AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(50),
                                side: BorderSide(
                                  color: Colors.white,
                                  width: 3,
                                ),
                              ),
                              insetPadding: EdgeInsets.all(0),
                              contentPadding: EdgeInsets.all(0),
                              content: Container(
                                height: Get.height * 0.7,
                                width: Get.width * 0.8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xFF2F4858),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    dataTable(a, b, c, d),
                                  ],
                                ),
                              ),
                            ));

                            // debugPrint('uzunluk : ${result.}');
                          },
                          child: Ink(
                            child: Text(
                              data.isim ?? 'Veri Yok',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        )),
                        DataCell(Text(
                          '${data.nufus ?? 'Veri Yok'}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                        DataCell(Text(
                          '${data.yetiskinnufus ?? 'Veri Yok'}',
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        )),
                        DataCell(Text(
                          '${data.yetiskinsuclu ?? 'Veri Yok'}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                        DataCell(Text(
                          '${data.gencnufus ?? 'Veri Yok'}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                        DataCell(Text(
                          '${data.gencsuclu ?? 'Veri Yok'}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                        DataCell(Text(
                          '${data.okulyok == 0 ? 0 : data.okulyok ?? 'Veri Yok'}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                        DataCell(Text(
                          '${data.ilkokulmezunu ?? 'Veri Yok'}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                        DataCell(Text(
                          '${data.ortaokulmezunu ?? 'Veri Yok'}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                        DataCell(Text(
                          '${data.lisemezunu ?? 'Veri Yok'}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                        DataCell(Text(
                          '${data.univeustumezunu ?? 'Veri Yok'}',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        )),
                      ],
                    ),
                  )
                  .toList(),
            ),
          ),
        ),
      ),
    );
  }

  DataTable dataTable(
    EducationModel a,
    EducationModel b,
    EducationModel c,
    EducationModel d,
  ) {
    return DataTable(
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
      columns: const [
        DataColumn(
          label: Text(
            'Eğitim',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Cinsel Suç',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Dolandırıcılık',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Gasp',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Hırsızlık',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Kaçakçılık',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Öldürme',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Uyuşturucu',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        DataColumn(
          label: Text(
            'Yaralama',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
      rows: [
        rows('İlkokul', a),
        rows('Ortaokul', d),
        rows('lise', b),
        rows('Okul yok', c),
      ],
    );
  }

  DataRow rows(String tur, EducationModel a) {
    return DataRow(
      cells: [
        DataCell(
          Text(
            tur,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        DataCell(
          Text(
            '${a.cinselsuclar ?? 'Veri Yok'}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        DataCell(
          Text(
            '${a.dolandiricilik ?? 'Veri Yok'}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        DataCell(
          Text(
            '${a.gasp ?? 'Veri Yok'}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        DataCell(
          Text(
            '${a.hirsizlik ?? 'Veri Yok'}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        DataCell(
          Text(
            '${a.kacakcilik ?? 'Veri Yok'}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        DataCell(
          Text(
            '${a.oldurme ?? 'Veri Yok'}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        DataCell(
          Text(
            '${a.uyusturucu ?? 'Veri Yok'}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        DataCell(
          Text(
            '${a.yaralama ?? 'Veri Yok'}',
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }

  Future getData() async {
    var result = await FirebaseFirestore.instance.collection('Turkey').get();
  }
}
