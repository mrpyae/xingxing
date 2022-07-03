class OrganizationEntity {
  String? organizationId;
  String? organizationName;
  String? openinghour;
  String? closinghour;
  String? orginazationstatus;
  String? organizationaddress;
  String? latitude;
  String? longitude;
  String? organizationcontact;

  OrganizationEntity(
      {this.organizationId,
        this.organizationName,
        this.openinghour,
        this.closinghour,
        this.orginazationstatus,
        this.organizationaddress,
        this.latitude,
        this.longitude,
        this.organizationcontact});

  OrganizationEntity.fromJson(Map<String, dynamic> json) {
    organizationId = json['organizationId'];
    organizationName = json['organizationName'];
    openinghour = json['openinghour'];
    closinghour = json['closinghour'];
    orginazationstatus = json['orginazationstatus'];
    organizationaddress = json['organizationaddress'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    organizationcontact = json['organizationcontact'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['organizationId'] = this.organizationId;
    data['organizationName'] = this.organizationName;
    data['openinghour'] = this.openinghour;
    data['closinghour'] = this.closinghour;
    data['orginazationstatus'] = this.orginazationstatus;
    data['organizationaddress'] = this.organizationaddress;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['organizationcontact'] = this.organizationcontact;
    return data;
  }
}