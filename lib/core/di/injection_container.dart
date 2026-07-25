import 'package:get_it/get_it.dart'; // 1. get_it import කරන්න
import 'package:product_catalogue_application/features/products/presentation/cubit/favorite_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/network/api_helper.dart';
import '../../core/network/mock_api_helper.dart';
import '../../core/storage/app_shared.dart';
import '../../features/products/data/datasources/products_remote_data_source.dart';
import '../../features/products/data/datasources/products_remote_data_source_impl.dart';
import '../../features/products/data/repositories/product_repository_impl.dart';
import '../../features/products/domain/repositories/product_repository.dart';
import '../../features/products/presentation/bloc/product_bloc.dart'; // 2. ProductBloc import කරන්න
import '../../services/favourites_storage_service.dart';

final sl = GetIt.instance;

Future<void> setupDependencies() async {
  //SharedPreferences
  final prefs = await SharedPreferences.getInstance();
  sl.registerLazySingleton<AppShared>(() => AppShared(prefs));

  //Local Storage Service
  sl.registerLazySingleton<FavouritesStorageService>(
    () => FavouritesStorageService(appShared: sl()),
  );

  //Network API Helper Setup
  sl.registerLazySingleton<ApiHelper>(() => MockAPIHelper());

  //Remote Data Source Setup
  sl.registerLazySingleton<ProductsRemoteDataSource>(
    () => ProductsRemoteDataSourceImpl(apiHelper: sl()),
  );

  //Product Repository Setup
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(
      remoteDataSource: sl(),
      favouritesStorageService: sl(),
    ),
  );

  //ProductBloc
  sl.registerFactory<ProductBloc>(() => ProductBloc(productRepository: sl()));

  //Cubit
  sl.registerFactory(() => FavoriteCubit(repository: sl()));
}
