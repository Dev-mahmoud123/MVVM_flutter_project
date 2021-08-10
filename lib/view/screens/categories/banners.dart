import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test_app/model/banners/banners_model.dart';
import 'package:test_app/providers/providers.dart';
import 'package:test_app/view/widgets/loading_widget.dart';



class BannersWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: context.read(bannersViewModelProvider).loadBanners(),
      builder: (context,snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return LoadingWidget();
        }
        BannersModel bannersModel = snapshot.data;
        return Container(
          height: 200.0,
          child: Carousel(
            images: bannersModel.data.map((image) {
              return CachedNetworkImage(
                imageUrl: '${image.image}',
                width: double.infinity,
                fit: BoxFit.cover,
                placeholder: (context , url) => Center(child: CircularProgressIndicator()),
                errorWidget: (context , url , error) => Icon(Icons.error),
              );
            }).toList(),
            dotSize: 4.0,
            dotSpacing: 15.0,
            dotColor: Colors.white,
            indicatorBgPadding: 5.0,
            dotBgColor: Colors.purple.withOpacity(0.5),
            borderRadius: true,
          ),
        );
      },
    );
  }
}
