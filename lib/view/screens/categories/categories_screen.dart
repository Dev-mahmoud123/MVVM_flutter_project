import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/model/categories/categories_model.dart';
import 'package:test_app/providers/providers.dart';
import 'package:test_app/utils/enums.dart';
import 'package:test_app/utils/page_router.dart';
import 'package:test_app/view/screens/products/products-screen.dart';
import 'package:test_app/view/widgets/loading_alert_widget.dart';
import 'package:test_app/view/widgets/loading_widget.dart';

import 'banners.dart';


class CategoriesScreen extends StatefulWidget {
  static const route = 'favourite-screen';

  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text("الاقسام"),
            leading: IconButton(
              icon: Icon(Icons.exit_to_app),
              onPressed: (){
                context.read(authViewModelProvider).logout(context);
              },
            ),
          ),

          body: SingleChildScrollView(
            child: Stack(
              children: [
                FutureBuilder(
                  future: context.read(categoryViewModelProvider).loadCategories(),
                  builder: (context, snapshot) {

                    CategoriesModel categoriesModel = snapshot.data;

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingWidget();
                    }
                    return Column(
                      children: [
                        BannersWidget(),
                        Container(
                          padding: EdgeInsets.all(16),
                          child: GridView.builder(
                            itemCount: categoriesModel.data.categories.length,
                            shrinkWrap: true,
                            primary: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              childAspectRatio: 1,
                            ),
                            itemBuilder: (context, index) {
                              return ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: GestureDetector(
                                  onTap: () {
                                    PageRouter.pushScreen(
                                      context: context,
                                      transition: AppTransition.bottom_to_top,
                                      screen: ProductsScreen(categoriesModel.data.categories[index]),
                                    );
                                  },
                                  child: GridTile(
                                    child: Stack(
                                      children: [
                                        Image.network(categoriesModel.data.categories[index].image)
                                      ],
                                    ),
                                    footer: GridTileBar(
                                      backgroundColor: Colors.black87,
                                      title: Text(
                                        categoriesModel.data.categories[index].name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
                LoadingAndAlertWidget(),
              ],
            ),
          )
      ),
    );
  }
}
