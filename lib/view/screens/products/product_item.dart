import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';
import 'package:test_app/model/products/products_model.dart';
import 'package:test_app/providers/providers.dart';
import 'package:test_app/utils/enums.dart';
import 'package:test_app/utils/page_router.dart';
import 'package:test_app/view/screens/products/product_details.dart';


class ProductItem extends StatefulWidget {

  ProductsModel productsModel;
  int index;
  ProductItem(this.productsModel, this.index);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        PageRouter.pushScreen(
            context: context,
            screen: ProductDetails(widget.productsModel.data.products[widget.index].id),
            transition: AppTransition.right_to_left);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: GridTile(
          child: Stack(
            children: [
              Image.network(
                  widget.productsModel.data.products[widget.index].image),
              Positioned(
                top: 10,
                left: 10,
                child: Column(
                  children: [
                    Consumer(
                      builder: (context, watch, child) {
                        return IconButton(
                            onPressed: () {
                              widget.productsModel.data.products[widget.index]
                                      .inFavorites =
                                  !widget.productsModel.data
                                      .products[widget.index].inFavorites;

                              watch(favouriteViewModelProvider)
                                  .addAndDeleteFromFavourites(widget
                                      .productsModel
                                      .data
                                      .products[widget.index]
                                      .id);
                            },
                            icon: (widget.productsModel.data
                                    .products[widget.index].inFavorites)
                                ? Icon(
                                    Icons.favorite,
                                    color: Colors.red,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    color: Colors.black,
                                  ));
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              widget.productsModel.data.products[widget.index].name,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
