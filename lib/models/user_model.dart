class UserModel {
  String? userId;
  String? userName;
  String? email;
  String? phoneNumber;
  String? address;
  String? image;

  UserModel(
      {this.userId,
        this.userName,
        this.address,
        this.image,
        this.email
       });

  UserModel.fromJson(Map<dynamic, String> json) {
    userId = json['id'];
    userName = json['username'];
    address = json['address'];
    image = json['image'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['id'] = userId;
    data['username'] = userName;
    data['address'] = address;
    data['image'] = image;
    data['email']=email;
    return data;
  }
}

