import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/model/contact/contact_model.dart';
import 'package:test_app/providers/providers.dart';
import 'package:test_app/view/widgets/loading_alert_widget.dart';
import 'package:test_app/view/widgets/loading_widget.dart';


class ContactView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact View"),
      ),
      body: Stack(
        children: [
          FutureBuilder(
            future: context.read(contactViewModelProvider).loadContactsData(),
            builder: (context,snapshot){
              ContactModel contactModel = snapshot.data;
              if(snapshot.connectionState == ConnectionState.waiting)
              {
                return LoadingWidget();
              }
              return Column(
                children: [
                  Text("${contactModel.data.contactData[1].value}"),
                  Image.network(contactModel.data.contactData[1].image)
                ],
              );
            },
          ),
          LoadingAndAlertWidget(),
        ],
      ),
    );
  }
}
