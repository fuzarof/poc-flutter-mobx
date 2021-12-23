import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

GetIt inject = GetIt.I;

void setUpDI() {
  sharedModule();
  dataModule();
  presentationModule();
}

void sharedModule() {
  // inject.registerLazySingleton<IConfigurationHelper>(() => ConfigurationHelper());
  inject.registerLazySingleton<Dio>(() => Dio());
}

void dataModule() {
  // inject.registerFactory<IOnBoardingRepository>(() => OnBoardingRepository(inject.get()));
}

void presentationModule() {
  // inject.registerLazySingleton<NicknameEmailPasswordController>(() => NicknameEmailPasswordController(inject.get(), inject.get()));
}
