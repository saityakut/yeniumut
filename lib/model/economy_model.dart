class EconomyModel {
  int? fakir;
  int? orta;
  int? zengin;

  EconomyModel({
    this.fakir,
    this.orta,
    this.zengin,
  });

  EconomyModel.fromJson(Map<dynamic, dynamic> json)
      : fakir = json['fakir'],
        orta = json['orta'],
        zengin = json['zengin'];

  @override
  String toString() {
    // TODO: implement toString
    return 'EdconomyModel{fakir: $fakir , orta:$orta,zengin:$zengin,';
  }
}
