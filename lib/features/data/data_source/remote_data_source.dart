import 'dart:convert';

import 'package:covid19/features/data/models/global_data_model.dart';
import 'package:covid19/features/data/models/main_model.dart';
import 'package:covid19/features/data/models/province_data_model.dart';
import 'package:covid19/features/data/models/vaccine_model.dart';
import 'package:covid19/features/data/repository/main_repository.dart';
import 'package:http/http.dart' as http;

class CovidAppRemoteDataSource extends MainRepository {
  final endpoint = 'https://api.kawalcorona.com/indonesia';

  Future<List<Model>> getAllData() async {
    final Map<String, String> _baseHeader = {
      'Content-Type': 'application/json; charset=UTF-8',
    };

    final response = await http.get(
      endpoint,
      headers: _baseHeader,
    );

    if (response.statusCode == 200) {
      final MainModel res =
          MainModel.fromJson({'result': jsonDecode(response.body)});
      return res.result;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<DataProvince>> getDataProvinsi() async {
    var response =
        await http.get('https://api.kawalcorona.com/indonesia/provinsi');
    if (response.statusCode == 200) {
      final List<DataProvince> res = dataProvinceFromJson(response.body);
      print(res.map((e) => e.attributes.toJson()).toList());
      return res;
    } else {
      throw Exception('Failed');
    }
  }

  Future<List<GlobalDataModel>> getGlobalData() async {
    var response =
        await http.get('https://covid19.mathdro.id/api/confirmed');
    if (response.statusCode == 200) {
      final List<GlobalDataModel> res = globalDataModelFromJson(response.body);
      //print(res.map((e) => e.attributes.toJson()).toList());
      print(res.map((e) => e.countryRegion));
      return res;
    } else {
      throw Exception('Failed');
    }
  }

  Future<VaccineTargetModel> getVaccineTarget() async {
    var response =
        await http.get('https://vaksincovid19-api.now.sh/api/vaksin');

    if (response.statusCode == 200) {
      final VaccineTargetModel res =
          VaccineTargetModel.fromJson(jsonDecode(response.body));
      return res;
    } else {
      throw Exception('Failed');
    }
  }
}
