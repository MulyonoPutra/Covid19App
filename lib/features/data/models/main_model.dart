import 'dart:convert';

List<MainModel> mainModelFromJson(String str) => List<MainModel>.from(json.decode(str).map((x) => MainModel.fromJson(x)));

String mainModelToJson(List<MainModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class MainModel {
    MainModel({
        this.name,
        this.positif,
        this.sembuh,
        this.meninggal,
        this.dirawat,
    });

    String name;
    String positif;
    String sembuh;
    String meninggal;
    String dirawat;

    factory MainModel.fromJson(Map<String, dynamic> json) => MainModel(
        name: json["name"],
        positif: json["positif"],
        sembuh: json["sembuh"],
        meninggal: json["meninggal"],
        dirawat: json["dirawat"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "positif": positif,
        "sembuh": sembuh,
        "meninggal": meninggal,
        "dirawat": dirawat,
    };
}
