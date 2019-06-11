import 'package:first_flutter/constant/Constant.dart';
import 'package:first_flutter/model/ArticleListResp.dart';
import 'package:first_flutter/model/BannerResp.dart';
import 'package:first_flutter/ui/widget/ArticleItem.dart';
import 'package:first_flutter/util/HttpUtil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  List<BannerInfo> bannerData = [];
  List<ArticleInfo> articleList = [];
  ScrollController _scrollController = ScrollController();
  int _page = 0;
  var _pageCount = 0;

  @override
  void initState() {
    super.initState();
    getBanner();
    getList();
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          _pageCount > _page) {
        getList();
      }
    });
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
    return ListView.builder(
      itemBuilder: (context, index) {
        if (index == 0) {
          return Container(
            child: bannerData.isEmpty ? Container() : bannerView(),
            height: 200,
            width: MediaQuery.of(context).size.width,
          );
        }
        if (index + 1 == articleList.length) {
          return getMoreWidget();
        } else {
          return ArticleItem(articleList[index]);
        }
      },
      controller: _scrollController,
      itemCount: articleList.length,
    );
  }

  Widget bannerView() {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return new Stack(
          alignment: Alignment.bottomLeft,
          fit: StackFit.expand,
          children: <Widget>[
            new Image.network(
              bannerData[index].imagePath,
              height: 180,
              fit: BoxFit.fill,
            ),
            new Align(
              alignment: FractionalOffset.bottomLeft,
              child: new Container(
                color: const Color(0x44000000),
                padding: const EdgeInsets.fromLTRB(10.0, 10, 0, 10),
                child: new Text(bannerData[index].title,
                    style: new TextStyle(color: Colors.white, fontSize: 15.0)),
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ],
        );
      },
      itemCount: bannerData.length,
      autoplay: true,
    );
  }

  void getList() {
    HttpUtil.requestGer(Constant.ARTICLE_LIST + "$_page/json").then((data) {
      if (data != null) {
        ArticleListResp articleListResp = ArticleListResp.fromJson(data);
        _page++;
        _pageCount = articleListResp.pageCount;
        setState(() {
          articleList.addAll(articleListResp.datas);
        });
      }
    });
  }

  Widget getMoreWidget() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              '加载中...',
              style: TextStyle(fontSize: 16.0),
            ),
            CircularProgressIndicator(
              strokeWidth: 1.0,
            ),
          ],
        ),
      ),
    );
  }
}
