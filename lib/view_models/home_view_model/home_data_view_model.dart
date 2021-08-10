import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/entities/snack_bar_entity.dart';
import 'package:test_app/model/home/home_data_model.dart';
import 'package:test_app/providers/providers.dart';


class HomeDataViewModel extends ChangeNotifier{
  final Reader reader;

  HomeDataViewModel(this.reader);

  Future<HomeDataModel> loadHomeData() async {

    final homeServicesProvider = reader(homeServiceProvider);
    final snackBarProvider = reader(snackBarStateProvider);
    final loadingProvider = reader(loadingStateProvider);

    final result = await homeServicesProvider.fetchHomeData();

    loadingProvider.state = false;

    if (result.status) {
      snackBarProvider.state = SnackBarEntity.success(message: "Success");
      return  result;
    } else {
      snackBarProvider.state = SnackBarEntity.error(message: "Fails");
    }

  }

}