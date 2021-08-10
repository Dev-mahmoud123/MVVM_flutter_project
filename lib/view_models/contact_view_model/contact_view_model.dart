import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/entities/snack_bar_entity.dart';
import 'package:test_app/model/contact/contact_model.dart';
import 'package:test_app/providers/providers.dart';


class ContactsViewModel extends ChangeNotifier{
  final Reader reader;

  ContactsViewModel(this.reader);

  // ignore: missing_return
  Future<ContactModel> loadContactsData() async {

    final contactsServicesProvider = reader(contactServiceProvider);
    final snackBarProvider = reader(snackBarStateProvider);
    final loadingProvider = reader(loadingStateProvider);

    final result = await contactsServicesProvider.fetchContact();

    loadingProvider.state = false;

    if (result.status) {
      snackBarProvider.state = SnackBarEntity.success(message: "Success");
      return  result;
    } else {
      snackBarProvider.state = SnackBarEntity.error(message: "Fails");
    }

  }

}