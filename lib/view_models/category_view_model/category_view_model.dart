import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/entities/snack_bar_entity.dart';
import 'package:test_app/model/categories/categories_model.dart';
import 'package:test_app/providers/providers.dart';


class CategoryViewModel extends ChangeNotifier{
  final Reader reader;

  CategoryViewModel(this.reader);

  // ignore: missing_return
  Future<CategoriesModel> loadCategories() async {

    final categoryServicesProvider = reader(categoryServiceProvider);
    final snackBarProvider = reader(snackBarStateProvider);
    final loadingProvider = reader(loadingStateProvider);

    final result = await categoryServicesProvider.fetchAllCategories();

    loadingProvider.state = false;

    if (result.status) {
      snackBarProvider.state = SnackBarEntity.success(message: "Success");
      return  result;
    } else {
      snackBarProvider.state = SnackBarEntity.error(message: "Fails");
    }

  }

}