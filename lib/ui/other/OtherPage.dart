import 'package:first_flutter/constant/Constant.dart';
import 'package:first_flutter/model/BannerResp.dart';
import 'package:first_flutter/resource/MyString.dart';
import 'package:first_flutter/ui/widget/BannerView.dart';
import 'package:first_flutter/util/HttpUtil.dart';
import 'package:flutter/material.dart';

class Other extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new OtherState();
  }
}

class OtherState extends State<Other> {
  List<BannerInfo> bannerData = [];
  List<String> nameList = [];
  List<IconData> iconList = [];

  @override
  void initState() {
    super.initState();
    getBanner();
    nameList.add(MyString.wanAndroid);
    nameList.add(MyString.github);
    nameList.add(MyString.zhy);
    nameList.add(MyString.app);
    nameList.add(MyString.video);
    nameList.add(MyString.updateTitle);
    iconList.add(Icons.layers);
    iconList.add(Icons.ac_unit);
    iconList.add(Icons.tv);
    iconList.add(Icons.text_format);
    iconList.add(Icons.local_movies);
    iconList.add(Icons.update);
  }

  void getBanner() {
    HttpUtil.requestGer(Constant.BANNER).then((data) {
      if (data != null) {
        BannerResp bannerResp = BannerResp.fromJson(data);
        setState(() {
          bannerData = bannerResp.data;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> widgetList = new List();
    for (int i = 0; i < iconList.length; i++) {
      widgetList.add(gridItem(iconList[i], nameList[i]));
    }
    return Column(
      children: <Widget>[
        bannerData.isEmpty
            ? Container()
            : Container(
                child: BannerView(bannerData),
                height: 200,
                margin: EdgeInsets.only(top: 10, bottom: 10),
              ),
        Container(
          child: new GridView.count(
            children: widgetList,
            crossAxisCount: 3,
            mainAxisSpacing: 10.0,
            primary: false,
            childAspectRatio: 13 / 6,
          ),
          height: 160,
          margin:EdgeInsets.only(top: 10) ,
        ),
      ],
    );
  }

  Widget gridItem(icon, name, {imgUrl}) {
    return FlatButton(
      child: Column(
        children: <Widget>[
          CircleAvatar(
            radius: 20.0,
            child: Icon(icon, color: Colors.white),
            backgroundColor: Colors.brown,
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 6.0),
          ),
          Text(name)
        ],
      ),
    );
  }
}
