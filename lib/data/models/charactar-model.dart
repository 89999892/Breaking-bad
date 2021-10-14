
class Character {
  int charId;
  String name;
  String birthday;
  List<String> occupation;
  String img;
  String status;
  List<int> appearance;
  String nickname;
  String portrayed;
  List<Null> betterCallSaulAppearance;

  Character(
      {this.charId,
        this.name,
        this.birthday,
        this.occupation,
        this.img,
        this.status,
        this.appearance,
        this.nickname,
        this.portrayed,
        this.betterCallSaulAppearance});

  Character.fromJson(Map<String, dynamic> json) {
    charId = json['char_id'];
    name = json['name'];
    birthday = json[' birthday'];
    occupation = json['occupation'].cast<String>();
    img = json['img'];
    status = json['status'];
    appearance = json['appearance'].cast<int>();
    nickname = json['nickname'];
    portrayed = json['portrayed'];

  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['char_id'] = this.charId;
    data['name'] = this.name;
    data[' birthday'] = this.birthday;
    data['occupation'] = this.occupation;
    data['img'] = this.img;
    data['status'] = this.status;
    data['appearance'] = this.appearance;
    data['nickname'] = this.nickname;
    data['portrayed'] = this.portrayed;

    return data;
  }
}