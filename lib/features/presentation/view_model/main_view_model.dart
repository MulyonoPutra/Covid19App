import 'package:covid19/features/data/data_source/remote_data_source.dart';
import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  
  String _positif = '';

  String _sembuh = '';

  String _meninggal = '';

  String _dirawat = '';

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
}
