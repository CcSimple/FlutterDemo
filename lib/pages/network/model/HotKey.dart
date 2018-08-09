// 搜索热词 返回json
class HotKeyModel {
  final int errorCode;
  final String errorMsg;
  final List data;
  const HotKeyModel({this.errorCode,this.errorMsg,this.data});
}
class HotKey {
  final int id;
  final String link;
  final String name;
  final int order;
  final int visible;
  const HotKey({this.id,this.link,this.name,this.order,this.visible});
  HotKey.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        link = json['link'],
        name = json['name'],
        order = json['order'],
        visible = json['visible'];

  Map<String, dynamic> toJson() =>
      {
        'id': id,
        'link': link,
        'name': name,
        'order': order,
        'visible': visible
      };
}