import 'package:covid19/features/data/models/main_model.dart';
import 'package:covid19/features/data/models/provinsi_model.dart';

abstract class MainRepository {
  Future<List<Model>> getAllData();
  Future<List<Attributes>> getDataProvinsi();
}
