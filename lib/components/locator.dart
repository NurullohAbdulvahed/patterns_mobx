import 'package:get_it/get_it.dart';
import 'package:mobx_dart/components/home/view_model/home_view_model.dart';
GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => HomeViewModel());
}