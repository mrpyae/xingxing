class ItemEntity {
  String? itemId;
  String? itemname;
  String? itemStatus;
  String? itemPhoto;
  String? itemremark;
  String? createdDate;
  String? penalityfee;
  String? unitprice;

  ItemEntity(
      {this.itemId,
        this.itemname,
        this.itemStatus,
        this.itemPhoto,
        this.itemremark,
        this.createdDate,
        this.penalityfee,
        this.unitprice});

  ItemEntity.fromJson(Map<String, dynamic> json) {
    itemId = json['itemId'];
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
    data['itemId'] = this.itemId;
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