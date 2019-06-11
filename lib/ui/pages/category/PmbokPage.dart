import 'package:first_flutter/model/ArticleListResp.dart';
import 'package:first_flutter/model/CategoryResp.dart';
import 'package:first_flutter/ui/pages/category/PmbokListPage.dart';
import 'package:flutter/material.dart';

class PmboxPage extends StatefulWidget {
  CategoryInfo itemData;

  PmboxPage(this.itemData);

  @override
  State<StatefulWidget> createState() {
    return PmboxState();
  }
}

class PmboxState extends State<PmboxPage> with SingleTickerProviderStateMixin {
  TabController tabController;
  List<Tab> tabs = new List();
  List<ArticleInfo> articleList = [];
  Map<String, Object> map = new Map();

  @override
  void initState() {
    super.initState();
    //遍历添加tab
    for (var value in widget.itemData.children) {
      tabs.add(new Tab(text: value.name));
    }
    //创建TabController对象
    tabController = new TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.itemData.name),
      ),
      body: DefaultTabController(
        length: widget.itemData.children.length,
        child: Scaffold(
          body: new Scaffold(
            appBar: TabBar(
              tabs: tabs,
              controller: tabController,
              labelColor: Theme.of(context).accentColor,
              unselectedLabelColor: Colors.black,
              indicatorColor: Theme.of(context).accentColor,
              isScrollable: true,
            ),
            body: new TabBarView(
              children: widget.itemData.children.map((dynamic itemData) {
                var id = itemData.id;
                return PmbokListPage(id);
              }).toList(),
              controller: tabController,
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
