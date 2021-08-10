import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/model/favourite/favourite_model.dart';
import 'package:test_app/providers/providers.dart';
import 'package:test_app/view/widgets/loading_alert_widget.dart';
import 'package:test_app/view/widgets/loading_widget.dart';

class FavouriteScreen extends StatefulWidget {
  static const route = 'favourite-screen';

  @override
  _FavouriteScreenState createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
          appBar: AppBar(
            title: Text("المفضلة"),
          ),
          body: Stack(
            children: [
              RefreshIndicator(
                onRefresh: () async {},
                child: FutureBuilder(
                  future:
                      context.read(favouriteViewModelProvider).loadFavourites(),
                  builder: (context, snapshot) {
                    FavouriteModel favouriteModel = snapshot.data;

                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return LoadingWidget();
                    }
                    return favouriteModel.data.favouriteData.length == 0
                        ? Center(
                            child: Image.asset(
                              'assets/images/empty.png',
                              fit: BoxFit.contain,
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.all(16),
                            child: GridView.builder(
                              itemCount:
                                  favouriteModel.data.favouriteData.length,
                              shrinkWrap: true,
                              primary: true,
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20,
                                childAspectRatio: 1,
                              ),
                              itemBuilder: (context, index) {
                                return ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: GestureDetector(
                                    onTap: () {},
                                    child: GridTile(
                                      child: Stack(
                                        children: [
                                          CachedNetworkImage(
                                            imageUrl: favouriteModel
                                                .data
                                                .favouriteData[index]
                                                .product
                                                .image,
                                            placeholder: (context, url) =>
                                                Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Icon(Icons.error),
                                            fadeInCurve: Curves.easeIn,
                                            fadeOutDuration:
                                                Duration(milliseconds: 1000),
                                            fit: BoxFit.cover,
                                          ),
                                          Positioned(
                                            top: 10,
                                            left: 10,
                                            child: Column(
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  icon: Icon(
                                                      Icons.add_shopping_cart),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                      footer: GridTileBar(
                                        backgroundColor: Colors.black87,
                                        title: Text(
                                          favouriteModel
                                              .data
                                              .favouriteData[index]
                                              .product
                                              .name,
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
                          );
                  },
                ),
              ),
              LoadingAndAlertWidget(),
            ],
          )),
    );
  }
}
