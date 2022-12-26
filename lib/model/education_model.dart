class EducationModel {
  int? cinselsuclar;
  int? dolandiricilik;
  int? gasp;
  int? hirsizlik;
  int? kacakcilik;
  int? uyusturucu;
  int? yaralama;
  int? oldurme;

  EducationModel({
    this.cinselsuclar,
    this.dolandiricilik,
    this.gasp,
    this.hirsizlik,
    this.kacakcilik,
    this.uyusturucu,
    this.yaralama,
    this.oldurme,
  });

  EducationModel.fromJson(Map<String, dynamic> json)
      : cinselsuclar = json['cinselsuclar'],
        dolandiricilik = json['dolandiricilik'],
        gasp = json['gasp'],
        hirsizlik = json['hirsizlik'],
        kacakcilik = json['kacakcilik'],
        uyusturucu = json['uyusturucu'],
        oldurme = json['oldurme'],
        yaralama = json['yaralama'];

  @override
  String toString() {
    // TODO: implement toString
    return 'EducationModel{cinselsuclar: $cinselsuclar , dolandiricilik:$dolandiricilik,gasp:$gasp,hirsizlik:$hirsizlik,kacakcilik:$kacakcilik,uyusturucu:$uyusturucu,yaralama:$yaralama,';
  }
}
