// To parse this JSON data, do
//
//     final globalDataModel = globalDataModelFromJson(jsonString);

import 'dart:convert';

List<GlobalDataModel> globalDataModelFromJson(String str) =>
    List<GlobalDataModel>.from(
        json.decode(str).map((x) => GlobalDataModel.fromJson(x)));

String globalDataModelToJson(List<GlobalDataModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GlobalDataModel {
  GlobalDataModel({
    this.provinceState,
    this.countryRegion,
    this.lastUpdate,
    this.lat,
    this.long,
    this.confirmed,
    this.recovered,
    this.deaths,
    this.active,
    this.admin2,
    this.fips,
    this.combinedKey,
    this.incidentRate,
    this.peopleTested,
    this.peopleHospitalized,
    this.uid,
    this.iso3,
    this.iso2,
  });

  String provinceState;
  String countryRegion;
  int lastUpdate;
  double lat;
  double long;
  int confirmed;
  int recovered;
  int deaths;
  int active;
  String admin2;
  String fips;
  String combinedKey;
  double incidentRate;
  dynamic peopleTested;
  dynamic peopleHospitalized;
  int uid;
  String iso3;
  String iso2;

  factory GlobalDataModel.fromJson(Map<String, dynamic> json) =>
      GlobalDataModel(
        provinceState:
            json["provinceState"] == null ? null : json["provinceState"],
        countryRegion: json["countryRegion"],
        lastUpdate: json["lastUpdate"],
        lat: json["lat"] == null ? null : json["lat"].toDouble(),
        long: json["long"] == null ? null : json["long"].toDouble(),
        confirmed: json["confirmed"],
        recovered: json["recovered"] == null ? null : json["recovered"],
        deaths: json["deaths"],
        active: json["active"] == null ? null : json["active"],
        admin2: json["admin2"] == null ? null : json["admin2"],
        fips: json["fips"] == null ? null : json["fips"],
        combinedKey: json["combinedKey"],
        incidentRate: json["incidentRate"] == null
            ? null
            : json["incidentRate"].toDouble(),
        peopleTested: json["peopleTested"],
        peopleHospitalized: json["peopleHospitalized"],
        uid: json["uid"],
        iso3: json["iso3"] == null ? null : json["iso3"],
        iso2: json["iso2"] == null ? null : json["iso2"],
      );

  Map<String, dynamic> toJson() => {
        "provinceState": provinceState == null ? null : provinceState,
        "countryRegion": countryRegion,
        "lastUpdate": lastUpdate,
        "lat": lat == null ? null : lat,
        "long": long == null ? null : long,
        "confirmed": confirmed,
        "recovered": recovered == null ? null : recovered,
        "deaths": deaths,
        "active": active == null ? null : active,
        "admin2": admin2 == null ? null : admin2,
        "fips": fips == null ? null : fips,
        "combinedKey": combinedKey,
        "incidentRate": incidentRate == null ? null : incidentRate,
        "peopleTested": peopleTested,
        "peopleHospitalized": peopleHospitalized,
        "uid": uid,
        "iso3": iso3 == null ? null : iso3,
        "iso2": iso2 == null ? null : iso2,
      };
}
