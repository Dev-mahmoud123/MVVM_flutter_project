import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/entities/snack_bar_entity.dart';
import 'package:test_app/model/products/product_details_model.dart';
import 'package:test_app/model/products/products_model.dart';
import 'package:test_app/providers/providers.dart';



class ProductsViewModel extends ChangeNotifier{
  final Reader reader;

  ProductsViewModel(this.reader);

  // ignore: missing_return
  Future<ProductsModel> loadProductsByCategory(int id) async {

    final productsServicesProvider = reader(productServiceProvider);
    final snackBarProvider = reader(snackBarStateProvider);
    final loadingProvider = reader(loadingStateProvider);

    final result = await productsServicesProvider.fetchProductsByCategoryId(id);

    loadingProvider.state = false;

    if (result.status) {
      snackBarProvider.state = SnackBarEntity.success(message: "Products Loaded Successfully");
      return result;

    } else {
      snackBarProvider.state = SnackBarEntity.error(message: "Fails");
    }

  }

  // ignore: missing_return
  Future<ProductDetailsModel> loadProductsDetails(int id) async {

    final productsServicesProvider = reader(productServiceProvider);
    final snackBarProvider = reader(snackBarStateProvider);
    final loadingProvider = reader(loadingStateProvider);

    final result = await productsServicesProvider.fetchProductsDetails(id);

    loadingProvider.state = false;

    if (result.status) {
      snackBarProvider.state = SnackBarEntity.success(message: "Product Details Loaded");
      return result;

    } else {
      snackBarProvider.state = SnackBarEntity.error(message: result.message);
    }

  }


}