import 'package:covid19/features/data/data_source/remote_data_source.dart';
import 'package:flutter/material.dart';

class VaccineDataViewModel extends ChangeNotifier {
  
  int _sumberDayaManusiaKesehatan = 0;

  int _lansia = 0;

  int _petugasPublik = 0;

  int _vaksinasi1 = 0;

  int _total = 0;

  // Just Getter, no Setter.
  int get getSumberDayaManusiaKesehatan => _sumberDayaManusiaKesehatan;
  int get getLansia => _lansia;
  int get getPetugasPublik => _petugasPublik;
  int get getVaksinasi => _vaksinasi1;
  int get getTotal => _total;

  getAllVaccineData() async {
    CovidAppRemoteDataSource().getVaccineTarget().then((value) {
      _sumberDayaManusiaKesehatan = value?.sasaranvaksinsdmk;
      _lansia = value?.sasaranvaksinlansia;
      _petugasPublik = value?.sasaranvaksinpetugaspublik;
      _vaksinasi1 = value?.vaksinasi1;
      _total = value?.totalsasaran;
      notifyListeners();
    });
  }
}
