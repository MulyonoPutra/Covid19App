import 'package:covid19/features/data/data_source/remote_data_source.dart';
import 'package:covid19/features/data/models/province_data_model.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  String _positif = '';

  String _sembuh = '';

  String _meninggal = '';

  String _dirawat = '';

  List<DataProvince> _provinsi = [];

  String _provinsiData = '';

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  List<DataProvince> get getProvinsi => _provinsi;
  void setProvinsi(List value) {
    _provinsi = value;
    notifyListeners();
  }

  String get getProvinsiData => _provinsiData;
  void setProvinsiData(String value) {
    _provinsiData = value;
    notifyListeners();
  }

  String get getPositif => _positif;
  void setPositif(String value) {
    _positif = value;
    notifyListeners();
  }

  String get getSembuh => _sembuh;
  void setSembuh(String value) {
    _sembuh = value;
    notifyListeners();
  }

  String get getMeninggal => _meninggal;
  void setMeninggal(String value) {
    _meninggal = value;
    notifyListeners();
  }

  String get getDirawat => _dirawat;
  void setDirawat(String value) {
    _dirawat = value;
    notifyListeners();
  }

  getAllDataIndonesia() async {
    CovidAppRemoteDataSource().getAllData().then((value) {
      _positif = value?.first?.positif;
      _sembuh = value?.first?.sembuh;
      _meninggal = value?.first?.meninggal;
      _dirawat = value?.first?.dirawat;
      notifyListeners();
    });
  }

  getDataProvinsiIndonesia() async {
    CovidAppRemoteDataSource().getDataProvinsi().then((value) {
      _isLoading = true;
      _provinsi = value;
      print(_provinsi.map((e) => e.attributes.toJson()).toList());
    });
    notifyListeners();
  }
}
