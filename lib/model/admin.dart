class Admin {
  int? aId;
  final String? name;
  final String? phoneNum;
  final String? joinDate;
  final String? password;

  Admin({
     this.aId,
     this.name,
     this.phoneNum,
     this.joinDate,
    this.password
  });

  factory Admin.fromJson(Map<String, dynamic> json) {
    return Admin(
      aId: json['a_id'],
      name: json['name'],
      phoneNum: json['phone_num'],
      joinDate:json['join_date'],
      password: json['password']
    );
  }
}
