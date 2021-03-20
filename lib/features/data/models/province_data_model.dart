// To parse this JSON data, do
//
//     final dataProvince = dataProvinceFromJson(jsonString);

import 'dart:convert';

List<DataProvince> dataProvinceFromJson(String str) => List<DataProvince>.from(json.decode(str).map((x) => DataProvince.fromJson(x)));

String dataProvinceToJson(List<DataProvince> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DataProvince {
    DataProvince({
        this.attributes,
    });

    Attributes attributes;

    factory DataProvince.fromJson(Map<String, dynamic> json) => DataProvince(
        attributes: Attributes.fromJson(json["attributes"]),
    );

    Map<String, dynamic> toJson() => {
        "attributes": attributes.toJson(),
    };
}

class Attributes {
    Attributes({
        this.fid,
        this.kodeProvi,
        this.provinsi,
        this.kasusPosi,
        this.kasusSemb,
        this.kasusMeni,
    });

    int fid;
    int kodeProvi;
    String provinsi;
    int kasusPosi;
    int kasusSemb;
    int kasusMeni;

    factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
        fid: json["FID"],
        kodeProvi: json["Kode_Provi"],
        provinsi: json["Provinsi"],
        kasusPosi: json["Kasus_Posi"],
        kasusSemb: json["Kasus_Semb"],
        kasusMeni: json["Kasus_Meni"],
    );

    Map<String, dynamic> toJson() => {
        "FID": fid,
        "Kode_Provi": kodeProvi,
        "Provinsi": provinsi,
        "Kasus_Posi": kasusPosi,
        "Kasus_Semb": kasusSemb,
        "Kasus_Meni": kasusMeni,
    };
}
