import 'package:flutter/material.dart';
import 'package:product_catalogue_application/app/product_catalogue.dart';
import 'package:product_catalogue_application/core/di/injection_container.dart';
import 'package:product_catalogue_application/core/storage/app_shared.dart';

late AppShared appShared;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupDependencies();
  runApp(const ProductCatalogue());
}
