import 'package:flutter/material.dart';
import 'package:test_app/providers/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/utils/helper_functions.dart';

class LoadingAndAlertWidget extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {

    final loadingProvider = watch(loadingStateProvider);
    final snackBarProvider = watch(snackBarStateProvider);

    if (snackBarProvider.state.showSnackBar) {
      HelperFunctions.showSnackBar(
        context: context,
        snackBarEntity: snackBarProvider.state,
      );
    }
    return loadingProvider.state
        ?
    Stack(
            children: [
              Container(
                color: Colors.black12,
              ),
              AlertDialog(
                scrollable: true,
                content: Row(
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      width: 20,
                    ),
                    Text('جاري التحميل ...'),
                  ],
                ),
              ),
            ],
          )
        : SizedBox.shrink();
  }
}
