import 'package:first_flutter/model/ArticleListResp.dart';
import 'package:first_flutter/ui/AppNavigator.dart';
import 'package:first_flutter/ui/res/AppColors.dart';
import 'package:flutter/material.dart';

class ArticleItem extends StatefulWidget {
  ArticleInfo itemData;

  ArticleItem(this.itemData);

  @override
  State<StatefulWidget> createState() {
    return new ArticleView();
  }
}

class ArticleView extends State<ArticleItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text('作者： '),
                  Expanded(
                    child: Text(
                      widget.itemData.author,
                      style: TextStyle(color: Colors.red),
                      maxLines: 1,
                    ),
                  ),
                  new GestureDetector(
                    child: new Icon(Icons.favorite_border),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 5, 5, 5),
                child: Text(
                  widget.itemData.title,
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Row(
                children: <Widget>[
                  widget.itemData.tags.isNotEmpty
                      ? GestureDetector(
                          child: Container(
                            child: Text(
                              widget.itemData.tags[0].name,
                              style: TextStyle(color: Colors.green),
                            ),
                            decoration: BoxDecoration(
                              border:
                                  new Border.all(color: Colors.green, width: 1),
                            ),
                            padding: EdgeInsets.fromLTRB(3, 1, 3, 1),
                            margin: EdgeInsets.fromLTRB(0, 0, 10, 0),
                          ),
                        )
                      : Text(''),
                  Text("分类："),
                  Expanded(
                    child: Text(
                      "${widget.itemData.superChapterName}/${widget.itemData.chapterName}",
                      style: TextStyle(color: Colors.black),
                      maxLines: 1,
                    ),
                  ),
                  Text('发布时间：'),
                  Text(
                    widget.itemData.niceDate,
                    style: TextStyle(color: Colors.black),
                  )
                ],
              )
            ],
            crossAxisAlignment: CrossAxisAlignment.start,
          ),
          padding: EdgeInsets.all(20),
        ),
        onTap: () {
          AppNavigator.toArticleDetailPage(context);
        },
      ),
      elevation: 4.0,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
      color: AppColors.colorWhite,
    );
  }
}
