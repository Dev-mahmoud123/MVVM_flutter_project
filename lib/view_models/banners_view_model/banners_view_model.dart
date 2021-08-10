import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/entities/snack_bar_entity.dart';
import 'package:test_app/model/banners/banners_model.dart';
import 'package:test_app/providers/providers.dart';


class BannersViewModel extends ChangeNotifier{
  final Reader reader;

  BannersViewModel(this.reader);

  // ignore: missing_return
  Future<BannersModel> loadBanners() async {

    final bannersServicesProvider = reader(bannersServiceProvider);
    final snackBarProvider = reader(snackBarStateProvider);
    final loadingProvider = reader(loadingStateProvider);

    final result = await bannersServicesProvider.fetchAllBanners();

    loadingProvider.state = false;

    if (result.status) {
      snackBarProvider.state = SnackBarEntity.success(message: "Banners Loaded Successfully");
      return  result;
    } else {
      snackBarProvider.state = SnackBarEntity.error(message: "Fails");
    }

  }

}