import 'package:first_flutter/constant/Constant.dart';
import 'package:first_flutter/model/ArticleListResp.dart';
import 'package:first_flutter/model/CategoryResp.dart';
import 'package:first_flutter/ui/widget/ArticleItem.dart';
import 'package:first_flutter/util/HttpUtil.dart';
import 'package:flutter/material.dart';

class PmbokListPage extends StatefulWidget {
  int id;

  PmbokListPage(id) {
    this.id = id;
  }

  @override
  State<StatefulWidget> createState() {
    return PmbokListPageState();
  }
}

class PmbokListPageState extends State<PmbokListPage>
    with AutomaticKeepAliveClientMixin {
  List<ArticleInfo> articleList = [];
  int _page = 0;
  var _pageCount = 0;
  ScrollController _scrollController = ScrollController();
  Map<String, Object> map = new Map();

  @override
  void initState() {
    super.initState();
    getList();
    //创建TabController对象
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
              _scrollController.position.maxScrollExtent &&
          _pageCount > _page) {
        getList();
      }
    });
  }

  void getList() {
    map['cid'] = widget.id;
    HttpUtil.requestGer(Constant.TREE_ARTICLE + "$_page/json", params: map)
        .then((data) {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          if (index + 1 == articleList.length) {
            return getMoreWidget();
          } else {
            return ArticleItem(articleList[index]);
          }
        },
        controller: _scrollController,
        itemCount: articleList.length,
      ),
      margin: EdgeInsets.only(bottom: 10),
    );
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

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
