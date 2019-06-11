import 'package:flutter/material.dart';

class BaseListView extends StatefulWidget {
  final listData;
  final listItemView;

  const BaseListView({this.listData, this.listItemView}) : super();

  @override
  State createState() => new BaseListViewState();
}

class BaseListViewState extends State<BaseListView> {
  bool isLoading = false; //是否正在加载中
  int pageIndex = 0;
  ScrollController _scrollController = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return new ListView.builder(
      itemBuilder: null,
      itemCount: widget.listData.len,
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
}
