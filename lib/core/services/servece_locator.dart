import 'package:dalel/core/database/cache/cache_helper.dart';
import 'package:get_it/get_it.dart';

//! here we use singleTon to create one object that we can use it when we use in all project
//! because if we create object when we use that will stored in memeory that make memory increase and performance decrease

final getIt = GetIt.instance;

void setupServiceLocator() {
  getIt.registerSingleton<CacheHelper>(CacheHelper());
}
