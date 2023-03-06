import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:sample_app/core/api_services/api_service.dart';
import 'package:sample_app/core/network/network_info.dart';
import 'package:dio/dio.dart';
import 'package:sample_app/features/album_details/data/data_sources/album_details_data_source.dart';
import 'package:sample_app/features/album_details/data/repository/album_detail_repositories_impl.dart';
import 'package:sample_app/features/album_details/domain/repositories/album_details_repository.dart';
import 'package:sample_app/features/album_details/domain/usecase/album_details_use_case.dart';
import 'package:sample_app/features/album_details/presentaion/bloc/album_details_bloc.dart';
import 'package:sample_app/features/main_album/data/data_sources/main_album_data_sources.dart';
import 'package:sample_app/features/main_album/data/repositories/main_album_repositories_impl.dart';
import 'package:sample_app/features/main_album/domain/repositories/main_album_repositories.dart';
import 'package:sample_app/features/main_album/domain/usecase/main_album_use_case.dart';
import 'package:sample_app/features/main_album/domain/usecase/search_album_use_case.dart';
import 'package:sample_app/features/main_album/presentation/bloc/main_album_bloc.dart';

final sl = GetIt.instance;

init() async {
  //!---- Feature----Signup user
  authenticateUser();

  //!----Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //!----External
  sl.registerLazySingleton(() => InternetConnectionChecker());
  //sl.registerLazySingleton<ApiService>(() => ApiService(sl()));
}

void authenticateUser() {
  // sl() or sl.call() -> get it instance is Callabale class starts looking for all the registered types
  // mobileValidator is of type MobileValidator, it will resolve this and instantiate it for us
  //bloc
  sl.registerFactory(() => MainAlbumBloc(
        mainAlbumUseCase: sl(),
        searchAlbumUseCase: sl(),
      ));
  sl.registerFactory(() => AlbumDetailsBloc(
        detailsUseCase: sl(),
      ));
  // sl.registerFactory(() => MainAlbumBloc(
  //       mainAlbumUseCase: sl(),
  //     ));
  // Use cases - don't have anything to clean or change of state, so we can register as singleton
  sl.registerLazySingleton(() => MainAlbumUseCase(sl()));
  sl.registerLazySingleton(() => AlbumDetailsUseCase(sl()));
  sl.registerLazySingleton(() => SearchAlbumUseCase(sl()));

  // Repository
  sl.registerLazySingleton<MainAlbumRepository>(
      () => MainAlbumRepositoriesImpl(mainAlbumDataSources: sl()));

  sl.registerLazySingleton<AlbumDetailsRepository>(
      () => AlbumDetailsRepositoryImpl(albumDetailsDataSource: sl()));

  // Data sources

  sl.registerLazySingleton<MainAlbumDataSources>(
      () => MainAlbumDataSourcesImpl(ApiService(Dio())));

  sl.registerLazySingleton<AlbumDetailsDataSource>(
      () => AlbumDetailsDataSourceImpl(ApiService(Dio())));
}
