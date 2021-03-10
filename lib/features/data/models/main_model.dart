class MainModel {
  List<Model> result;

  MainModel({this.result});

  MainModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <Model>[];
      json['result'].forEach((v) {
        result.add(new Model.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.result != null) {
      data['result'] = this.result.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Model {
  String name;
  String positif;
  String sembuh;
  String meninggal;
  String dirawat;

  Model({this.name, this.positif, this.sembuh, this.meninggal, this.dirawat});

  Model.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    positif = json['positif'];
    sembuh = json['sembuh'];
    meninggal = json['meninggal'];
    dirawat = json['dirawat'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['positif'] = this.positif;
    data['sembuh'] = this.sembuh;
    data['meninggal'] = this.meninggal;
    data['dirawat'] = this.dirawat;
    return data;
  }
}