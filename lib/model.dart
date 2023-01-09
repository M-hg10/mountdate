class aylik {
  List<User>? user;

  aylik({this.user});

  aylik.fromJson(Map<String, dynamic> json) {
    if (json['user'] != null) {
      user = <User>[];
      json['user'].forEach((v) {
        user!.add(new User.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class User {
  String? zamanDamgasi;
  String? sttoplayici;
  double? miktar;
  String? yag;
  String? su;
  String? igneli;

  User(
      {this.zamanDamgasi,
        this.sttoplayici,
        this.miktar,
        this.yag,
        this.su,
        this.igneli});

  User.fromJson(Map<String, dynamic> json) {
    zamanDamgasi = json['zamanDamgasi'];
    sttoplayici = json['sttoplayici'];
    miktar = json['miktar'];
    yag = json['yag'];
    su = json['su'];
    igneli = json['igneli'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['zamanDamgasi'] = this.zamanDamgasi;
    data['sttoplayici'] = this.sttoplayici;
    data['miktar'] = this.miktar;
    data['yag'] = this.yag;
    data['su'] = this.su;
    data['igneli'] = this.igneli;
    return data;
  }
}
