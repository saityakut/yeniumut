class CityModel {
  String? id;
  int? gencnufus;
  int? gencsuclu;
  int? ilkokulmezunu;
  String? isim;
  int? lisemezunu;
  int? nufus;
  int? okulyok;
  int? ortaokulmezunu;
  int? univeustumezunu;
  int? yetiskinnufus;
  int? yetiskinsuclu;

  CityModel({
    this.id,
    this.gencnufus,
    this.gencsuclu,
    this.ilkokulmezunu,
    this.isim,
    this.lisemezunu,
    this.nufus,
    this.okulyok,
    this.ortaokulmezunu,
    this.univeustumezunu,
    this.yetiskinnufus,
    this.yetiskinsuclu,
  });

  CityModel.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'],
        gencnufus = json['gencnufus'],
        gencsuclu = json['gencsuclu'],
        ilkokulmezunu = json['ilkokulmezunu'],
        isim = json['isim'],
        lisemezunu = json['lisemezunu'],
        nufus = json['nufus'],
        okulyok = json['okulyok'],
        ortaokulmezunu = json['ortaokulmezunu'],
        univeustumezunu = json['univeustumezunu'],
        yetiskinnufus = json['yetiskinnufus'],
        yetiskinsuclu = json['yetiskinsuclu'];

  @override
  String toString() {
    // TODO: implement toString
    return 'CityModel{gencnufus: $gencnufus , gencsuclu:$gencsuclu,ilkokulmezunu:$ilkokulmezunu,isim:$isim,lisemezunu:$lisemezunu,nufus:$nufus,okulyok:$okulyok,ortaokulmezunu:$ortaokulmezunu,univeustumezunu:$univeustumezunu,yetiskinnufus:$yetiskinnufus,yetiskinsuclu:$yetiskinsuclu';
  }
}
