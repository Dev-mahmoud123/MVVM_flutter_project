
import 'package:test_app/entities/snack_bar_entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/network/api/banners/banners_service.dart';
import 'package:test_app/network/api/categories/categories_services.dart';
import 'package:test_app/network/api/contact/contact_service.dart';
import 'package:test_app/network/api/favourite/favourite_service.dart';
import 'package:test_app/network/api/home/home_data_service.dart';
import 'package:test_app/network/api/products/products_service.dart';
import 'package:test_app/network/api/user/auth_services.dart';
import 'package:test_app/view_models/auth/auth_view_model.dart';
import 'package:test_app/view_models/banners_view_model/banners_view_model.dart';
import 'package:test_app/view_models/category_view_model/category_view_model.dart';
import 'package:test_app/view_models/contact_view_model/contact_view_model.dart';
import 'package:test_app/view_models/favourite_view_model/favourite_view_model.dart';
import 'package:test_app/view_models/home_view_model/home_data_view_model.dart';
import 'package:test_app/view_models/products_view_model/products_view_model.dart';
import 'package:test_app/view_models/splash_view_model/splash_view_model.dart';

/// Snack bar provider
final snackBarStateProvider = StateProvider<SnackBarEntity>(
        (_) => SnackBarEntity.initial(),
);

/// Loading provider
final loadingStateProvider = StateProvider<bool>((_) => false);

/// Login Services Provider
final authServiceProvider = Provider<AuthService>((ref) => AuthService());

/// Login View Provider
final authViewModelProvider = ChangeNotifierProvider<AuthViewModel>((ref) => AuthViewModel(ref.read));



/// Splash View Provider
final splashProvider = ChangeNotifierProvider<SplashScreenViewModel>((_) => SplashScreenViewModel());



/// Home data Providers
final homeServiceProvider = Provider<HomeDataServices>((ref) => HomeDataServices());
final homeViewModelProvider = ChangeNotifierProvider<HomeDataViewModel>((ref) => HomeDataViewModel(ref.read));


/// Contacts data Providers
final contactServiceProvider = Provider<ContactService>((ref) => ContactService());
final contactViewModelProvider = ChangeNotifierProvider<ContactsViewModel>((ref) => ContactsViewModel(ref.read));


/// Favourite data Providers
final favouriteServiceProvider = Provider<FavouriteService>((ref) => FavouriteService());
final favouriteViewModelProvider = ChangeNotifierProvider<FavouriteViewModel>((ref) => FavouriteViewModel(ref.read));



/// Category data Providers
final categoryServiceProvider = Provider<CategoriesServices>((ref) => CategoriesServices());
final categoryViewModelProvider = ChangeNotifierProvider<CategoryViewModel>((ref) => CategoryViewModel(ref.read));


/// Products data Providers
final productServiceProvider = Provider<ProductsService>((ref) => ProductsService());
final productViewModelProvider = ChangeNotifierProvider<ProductsViewModel>((ref) => ProductsViewModel(ref.read));

/// Banners data Providers
final bannersServiceProvider = Provider<BannersServices>((ref) => BannersServices());
final bannersViewModelProvider = ChangeNotifierProvider<BannersViewModel>((ref) => BannersViewModel(ref.read));