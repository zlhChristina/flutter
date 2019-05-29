class BannerResp {
  List<BannerInfo> data;

  BannerResp.fromParams(this.data);

  BannerResp.fromJson(value) {
    data = value == null ? null : [];
    for (var bannerItem in data == null ? [] : value) {
      data.add(bannerItem == null ? null : new BannerInfo.fromJson(bannerItem));
    }
  }

  @override
  String toString() {
    return 'BannerResp{data: $data}';
  }
}

class BannerInfo {
//  "desc": "一起来做个App吧",
//  "id": 10,
//  "imagePath": "http://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png",
//  "isVisible": 1,
//  "order": 3,
//  "title": "一起来做个App吧",
//  "type": 0,
//  "url": "http://www.wanandroid.com/blog/show/2"

  String desc;
  String imagePath;
  String title;
  String url;
  int id;
  int isVisible;
  int order;
  int type;

  BannerInfo.fromParams(
      {this.desc,
      this.imagePath,
      this.title,
      this.url,
      this.id,
      this.isVisible,
      this.order,
      this.type});

  BannerInfo.fromJson(json) {
    desc = json['desc'];
    imagePath = json['imagePath'];
    title = json['title'];
    url = json['url'];
    id = json['id'];
    isVisible = json['isVisible'];
    order = json['order'];
    type = json['type'];
  }

  @override
  String toString() {
    return 'BannerInfo{desc: $desc, imagePath: $imagePath, title: $title, url: $url, id: $id, isVisible: $isVisible, order: $order, type: $type}';
  }
}
