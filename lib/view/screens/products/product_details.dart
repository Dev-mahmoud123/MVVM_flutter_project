import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/model/products/product_details_model.dart';
import 'package:test_app/providers/providers.dart';
import 'package:test_app/view/widgets/loading_widget.dart';


class ProductDetails extends StatelessWidget {

  int id;
  ProductDetails(this.id);

  @override
  Widget build(BuildContext context) {
    print("id: $id");
    return Scaffold(
      appBar: AppBar(
        title: Text("Product Details"),
      ),
      body: FutureBuilder(
        future: context.read(productViewModelProvider).loadProductsDetails(id),
        builder: (context,snapshot){
          ProductDetailsModel productDetails = snapshot.data;

          if (snapshot.connectionState == ConnectionState.waiting) {
            return LoadingWidget();
          }

          return Container(
            child: Center(
              child: Text(productDetails.data.name ?? "dd"),
            ),
          );
        },
      ),
    );
  }
}
