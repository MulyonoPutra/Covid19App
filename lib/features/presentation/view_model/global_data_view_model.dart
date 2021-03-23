import 'package:covid19/features/data/data_source/remote_data_source.dart';
import 'package:covid19/features/data/models/global_data_model.dart';
import 'package:flutter/material.dart';

class GlobalDataViewModel extends ChangeNotifier {
  // Properties
  String _countryRegion = '';

  int _confirmed = 0;

  int _recovered = 0;

  int _deaths = 0;

  int _active = 0;

  List<GlobalDataModel> _global = [];

  bool _isLoading = false;

  // Just Getter, No Setter
  List<GlobalDataModel> get getGlobalList => _global;

  int get getConfirmed => _confirmed;

  int get getRecovered => _recovered;

  int get getDeaths => _deaths;

  int get getActive => _active;

  String get getCountryRegion => _countryRegion;
  
  bool get isLoading => _isLoading;

  getAllGlobalData() async {
    CovidAppRemoteDataSource().getGlobalData().then((value) {
      _isLoading = true;
      _global = value.toList();
      notifyListeners();
    });
  }
}
