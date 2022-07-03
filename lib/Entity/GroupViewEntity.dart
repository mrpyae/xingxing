class GroupViewEntity {
  String? tablewaregroupId;
  String? tablewaregroupName;
  String? tablewaregroupStatus;
  String? totalprice;
  List<Items>? items;

  GroupViewEntity(
      {this.tablewaregroupId,
        this.tablewaregroupName,
        this.tablewaregroupStatus,
        this.totalprice,
        this.items});

  GroupViewEntity.fromJson(Map<String, dynamic> json) {
    tablewaregroupId = json['tablewaregroupId'];
    tablewaregroupName = json['tablewaregroupName'];
    tablewaregroupStatus = json['tablewaregroupStatus'];
    totalprice = json['totalprice'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['tablewaregroupId'] = this.tablewaregroupId;
    data['tablewaregroupName'] = this.tablewaregroupName;
    data['tablewaregroupStatus'] = this.tablewaregroupStatus;
    data['totalprice'] = this.totalprice;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? itemgroupId;
  String? itemId;
  String? tablewaregroupId;
  String? quantity;
  String? rentalprice;
  String? itemname;
  String? itemStatus;
  String? itemPhoto;
  Null? itemremark;
  String? createdDate;
  String? penalityfee;
  String? unitprice;

  Items(
      {this.itemgroupId,
        this.itemId,
        this.tablewaregroupId,
        this.quantity,
        this.rentalprice,
        this.itemname,
        this.itemStatus,
        this.itemPhoto,
        this.itemremark,
        this.createdDate,
        this.penalityfee,
        this.unitprice});

  Items.fromJson(Map<String, dynamic> json) {
    itemgroupId = json['itemgroupId'];
    itemId = json['itemId'];
    tablewaregroupId = json['tablewaregroupId'];
    quantity = json['quantity'];
    rentalprice = json['rentalprice'];
    itemname = json['itemname'];
    itemStatus = json['itemStatus'];
    itemPhoto = json['itemPhoto'];
    itemremark = json['itemremark'];
    createdDate = json['createdDate'];
    penalityfee = json['penalityfee'];
    unitprice = json['unitprice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemgroupId'] = this.itemgroupId;
    data['itemId'] = this.itemId;
    data['tablewaregroupId'] = this.tablewaregroupId;
    data['quantity'] = this.quantity;
    data['rentalprice'] = this.rentalprice;
    data['itemname'] = this.itemname;
    data['itemStatus'] = this.itemStatus;
    data['itemPhoto'] = this.itemPhoto;
    data['itemremark'] = this.itemremark;
    data['createdDate'] = this.createdDate;
    data['penalityfee'] = this.penalityfee;
    data['unitprice'] = this.unitprice;
    return data;
  }
}