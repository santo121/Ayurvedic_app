class EnrollResponseModel {
  bool? status;
  String? message;
  String? token;
  bool? isSuperuser;
  UserDetails? userDetails;

  EnrollResponseModel(
      {this.status,
      this.message,
      this.token,
      this.isSuperuser,
      this.userDetails});

  EnrollResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    token = json['token'];
    isSuperuser = json['is_superuser'];
    userDetails = json['user_details'] != null
        ? UserDetails.fromJson(json['user_details'])
        : null;
  }


}

class UserDetails {
  int? id;
  dynamic lastLogin;
  String? name;
  String? phone;
  String? address;
  String? mail;
  String? username;
  String? password;
  String? passwordText;
  int? admin;
  bool? isAdmin;
  bool? isActive;
  String? createdAt;
  String? updatedAt;
  dynamic branch;

  UserDetails(
      {this.id,
      this.lastLogin,
      this.name,
      this.phone,
      this.address,
      this.mail,
      this.username,
      this.password,
      this.passwordText,
      this.admin,
      this.isAdmin,
      this.isActive,
      this.createdAt,
      this.updatedAt,
      this.branch});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    lastLogin = json['last_login'];
    name = json['name'];
    phone = json['phone'];
    address = json['address'];
    mail = json['mail'];
    username = json['username'];
    password = json['password'];
    passwordText = json['password_text'];
    admin = json['admin'];
    isAdmin = json['is_admin'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    branch = json['branch'];
  }


}
