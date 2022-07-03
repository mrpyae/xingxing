class UserEntity {
  String? userId;
  String? userName;
  String? address;
  String? userStatus;
  String? createdDate;
  String? userType;
  String? salary;
  String? loginId;
  String? contactNumber;
  String? organizationId;
  String? password;

  UserEntity(
      {this.userId,
        this.userName,
        this.address,
        this.userStatus,
        this.createdDate,
        this.userType,
        this.salary,
        this.loginId,
        this.contactNumber,
        this.organizationId,
        this.password});

  UserEntity.fromJson(Map<String, dynamic> json) {
    userId = json['UserId'];
    userName = json['userName'];
    address = json['address'];
    userStatus = json['userStatus'];
    createdDate = json['createdDate'];
    userType = json['userType'];
    salary = json['salary'];
    loginId = json['loginId'];
    contactNumber = json['contactNumber'];
    organizationId = json['organizationId'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserId'] = this.userId;
    data['userName'] = this.userName;
    data['address'] = this.address;
    data['userStatus'] = this.userStatus;
    data['createdDate'] = this.createdDate;
    data['userType'] = this.userType;
    data['salary'] = this.salary;
    data['loginId'] = this.loginId;
    data['contactNumber'] = this.contactNumber;
    data['organizationId'] = this.organizationId;
    data['password'] = this.password;
    return data;
  }
}