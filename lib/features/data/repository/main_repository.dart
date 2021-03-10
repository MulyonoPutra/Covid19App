import 'package:covid19/features/data/models/main_model.dart';

abstract class MainRepository {
  Future<List<Model>> getAllData();
}