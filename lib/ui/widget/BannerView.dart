import 'package:first_flutter/model/BannerResp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerView extends StatefulWidget {
  List<BannerInfo> itemData;

  BannerView(this.itemData);

  @override
  State<StatefulWidget> createState() {
    return new BannerState();
  }
}

//return Container(
////          decoration: BoxDecoration(
////            borderRadius: BorderRadius.all(
////              Radius.circular(10.0),
////            ),
////          ),
//child: Image.network(
//widget.itemData[index].imagePath,
//height: 180,
//fit: BoxFit.fill,
//),
//height: 180,
//width: MediaQuery.of(context).size.width,
//);

class BannerState extends State<BannerView> {
  @override
  Widget build(BuildContext context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return ClipRRect(
          child: Image.network(
            widget.itemData[index].imagePath,
            fit: BoxFit.fill,
            height: 200,
          ),
          borderRadius: BorderRadius.circular(10.0),
        );
      },
      itemCount: widget.itemData.length,
      autoplay: true,
      viewportFraction: 0.8,
      scale: 0.9,
    );
  }
}
