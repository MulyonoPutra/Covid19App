import 'package:covid19/core/error/failures.dart';
import 'package:covid19/features/data/models/main_model.dart';
import 'package:dartz/dartz.dart';

abstract class MainRepository {
  Future<Either<Failure, MainModel>> getAllData();
}