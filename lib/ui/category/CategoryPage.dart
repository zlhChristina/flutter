import 'package:first_flutter/constant/Constant.dart';
import 'package:first_flutter/model/CategoryResp.dart';
import 'package:first_flutter/resource/MyColors.dart';
import 'package:first_flutter/ui/category/PmbokPage.dart';
import 'package:first_flutter/util/HttpUtil.dart';
import 'package:flutter/material.dart';

class Category extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CategoryState();
  }
}

class CategoryState extends State<Category> {
  List<CategoryInfo> categoryData = [];
  ScrollController _scrollController = ScrollController();

  void getCategory() {
    HttpUtil.requestGer(Constant.TREE).then((data) {
      if (data != null) {
        CategoryResp categoryResp = CategoryResp.fromJson(data);
        setState(() {
          categoryData = categoryResp.data;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    getCategory();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Container(
            child: categoryData.isEmpty ? Container() : getItem(index),
            height: 80,
            width: MediaQuery
                .of(context)
                .size
                .width,
          );
        },
        itemCount: categoryData.length,
        controller: _scrollController,
        primary: false,
      ),
      color: Color(0xF7F7F7),
      margin: EdgeInsets.only(bottom: 10),
    );
  }

  Widget getItem(index) {
    return GestureDetector(
      child: Container(
        child: Row(
          children: <Widget>[
            Expanded(
              child: Text(
                categoryData[index].name,
                style: TextStyle(color: Colors.black),
                maxLines: 1,
              ),
            ),
            Text("${categoryData[index].children.length}分类"),
            Icon(Icons.arrow_forward, color: MyColors.colorPrimary),
          ],
        ),
        padding: EdgeInsets.all(15),
        margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: new Border.all(color: Colors.grey, width: 1),
        ),
      ),
      onTap: () {
        Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
          return new PmboxPage(categoryData[index]);
        }));
      },
    );
  }
}
