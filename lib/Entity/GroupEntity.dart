class GroupEntity {
  String? tablewaregroupId;
  String? tablewaregroupName;
  String? tablewaregroupStatus;
  String? totalprice;

  GroupEntity(
      {this.tablewaregroupId,
        this.tablewaregroupName,
        this.tablewaregroupStatus,
        this.totalprice});

  GroupEntity.fromJson(Map<String, dynamic> json) {
    tablewaregroupId = json['tablewaregroupId'];
    tablewaregroupName = json['tablewaregroupName'];
    tablewaregroupStatus = json['tablewaregroupStatus'];
    totalprice = json['totalprice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tablewaregroupId'] = this.tablewaregroupId;
    data['tablewaregroupName'] = this.tablewaregroupName;
    data['tablewaregroupStatus'] = this.tablewaregroupStatus;
    data['totalprice'] = this.totalprice;
    return data;
  }
}