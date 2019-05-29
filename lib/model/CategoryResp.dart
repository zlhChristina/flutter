
class CategoryResp {
  List<CategoryInfo> data;

  CategoryResp.fromParams(this.data);

  CategoryResp.fromJson(value) {
    data = value == null ? null : [];
    for (var bannerItem in data == null ? [] : value) {
      data.add(bannerItem == null ? null : new CategoryInfo.fromJson(bannerItem));
    }
  }

  @override
  String toString() {
    return 'CategoryResp{data: $data}';
  }
}

class CategoryInfo {

//  "courseId": 13,
//  "id": 150,
//  "name": "开发环境",
//  "order": 1,
//  "parentChapterId": 0,
//  "userControlSetTop": false,
//  "visible": 1
//  "children": []

  int courseId;
  int id;
  int order;
  int parentChapterId;
  int visible;
  String name;
  bool userControlSetTop;
  List<CategoryInfo> children;

  CategoryInfo.fromParams(this.courseId, this.id, this.order, this.parentChapterId,
      this.visible, this.name, this.userControlSetTop, this.children);

  CategoryInfo.fromJson(json) {
    order = json['order'];
    parentChapterId = json['parentChapterId'];
    visible = json['visible'];
    name = json['name'];
    courseId = json['courseId'];
    id = json['id'];
    userControlSetTop = json['userControlSetTop'];
    children = json['children'] == null ? null : [];
    for (var item in children == null ? [] : json['children']) {
      children.add(item == null ? null : new CategoryInfo.fromJson(item));
    }
  }

  @override
  String toString() {
    return 'CategoryInfo{courseId: $courseId, id: $id, order: $order, parentChapterId: $parentChapterId, visible: $visible, name: $name, userControlSetTop: $userControlSetTop, children: $children}';
  }
}

class CategoryItem {

//  "children": [],
//  "courseId": 13,
//  "id": 60,
//  "name": "Android Studio相关",
//  "order": 1000,
//  "parentChapterId": 150,
//  "userControlSetTop": false,
//  "visible": 1

  int courseId;
  int id;
  int order;
  int parentChapterId;
  int visible;
  String name;
  bool userControlSetTop;
  List<String> children;


  CategoryItem.fromParams(this.courseId, this.id, this.order, this.parentChapterId,
      this.visible, this.name, this.userControlSetTop, this.children);

  CategoryItem.fromJson(json) {
    order = json['order'];
    parentChapterId = json['parentChapterId'];
    visible = json['visible'];
    name = json['name'];
    courseId = json['courseId'];
    id = json['id'];
    userControlSetTop = json['userControlSetTop'];
  }

  @override
  String toString() {
    return 'CategoryItem{courseId: $courseId, id: $id, order: $order, parentChapterId: $parentChapterId, visible: $visible, name: $name, userControlSetTop: $userControlSetTop, children: $children}';
  }


}
