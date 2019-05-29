class ArticleListResp {
//  "curPage": 2,
//  "datas": [],
//  "offset": 20,
//  "over": false,
//  "pageCount": 306,
//  "size": 20,
//  "total": 6113

  int total;
  int pageCount;
  int curPage;
  int size;
  List<ArticleInfo> datas;

  ArticleListResp.fromParams(
      {this.total, this.pageCount, this.curPage, this.size, this.datas});

  ArticleListResp.fromJson(json) {
    total = json['total'];
    curPage = json['curPage'];
    pageCount = json['pageCount'];
    size = json['size'];
    datas = json['datas'] == null ? null : [];
    for (var item in datas == null ? [] : json['datas']) {
      datas.add(item == null ? null : new ArticleInfo.fromJson(item));
    }
  }

  @override
  String toString() {
    return 'ArticleListResp{total: $total, pageCount: $pageCount, curPage: $curPage, size: $size, datas: $datas}';
  }
}

class ArticleInfo {
//  "apkLink": "",
//  "author": "郭霖",
//  "chapterId": 409,
//  "chapterName": "郭霖",
//  "collect": false,
//  "courseId": 13,
//  "desc": "",
//  "id": 7974,
//  "link": "https://mp.weixin.qq.com/s/pttfFzkAO5MnwscXDX-dDw",
//  "niceDate": "2019-02-22",
//  "publishTime": 1550764800000,
//  "superChapterId": 408,
//  "superChapterName": "公众号",
//  "tags": [
//  {
//  "name": "公众号",
//  "url": "/wxarticle/list/409/1"
//  }
//  ],
//  "title": "Airbnb开源框架，真响应式架构&mdash;&mdash;MvRx",
//  "type": 0,

  String author;
  int chapterId;
  String chapterName;
  bool collect;
  int courseId;
  String desc;
  int id;
  String link;
  int publishTime;
  int superChapterId;
  String superChapterName;
  String niceDate;
  int type;
  String title;
  List<TagsInfo> tags;

  ArticleInfo.fromParams(
      {this.author,
      this.chapterId,
      this.chapterName,
      this.collect,
      this.courseId,
      this.desc,
      this.id,
      this.link,
      this.publishTime,
      this.superChapterId,
      this.superChapterName,
      this.niceDate,
      this.type,
      this.title,
      this.tags});

  ArticleInfo.fromJson(json) {
    author = json['author'];
    chapterId = json['chapterId'];
    chapterName = json['chapterName'];
    collect = json['collect'];
    courseId = json['courseId'];
    id = json['id'];
    desc = json['desc'];
    link = json['link'];
    publishTime = json['publishTime'];
    superChapterId = json['superChapterId'];
    superChapterName = json['superChapterName'];
    niceDate = json['niceDate'];
    type = json['type'];
    title = json['title'];
    tags = json['tags'] == null ? null : [];
    for (var item in tags == null ? [] : json['tags']) {
      tags.add(item == null ? null : new TagsInfo.fromJson(item));
    }
  }

  @override
  String toString() {
    return 'ArticleInfo{author: $author, chapterId: $chapterId, chapterName: $chapterName, collect: $collect, courseId: $courseId, desc: $desc, id: $id, link: $link, publishTime: $publishTime, superChapterId: $superChapterId, superChapterName: $superChapterName, niceDate: $niceDate, type: $type, title: $title, tags: $tags}';
  }

}

class TagsInfo {
  String name;
  String url;

  TagsInfo.fromParams({this.name, this.url});

  TagsInfo.fromJson(json) {
    name = json['name'];
    url = json['url'];
  }

  @override
  String toString() {
    return 'TagsInfo{name: $name, url: $url}';
  }
}
