import 'dart:convert';

import 'package:covid19/core/error/exceptions.dart';
import 'package:covid19/features/data/models/main_model.dart';
import 'package:http/http.dart' as http;
import 'package:meta/meta.dart';


abstract class CovidAppRemoteDataSource {
  Future<MainModel> getAllData();
}

class CovidAppRemoteDataSourceImpl implements CovidAppRemoteDataSource {
  


  @override
  Future<MainModel> getAllData() =>
      _getDataFromUrl('https://api.kawalcorona.com/indonesia/provinsi');

  Future<MainModel> _getDataFromUrl(String url) async {
    final response = await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
    );

    if (response.statusCode == 200) {
      return MainModel.fromJson(json.decode(response.body));
    } else {
      throw ServerException();
    }
  }
}
