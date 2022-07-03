class GroupItemEntity {
  String? itemgroupId;
  String? itemId;
  String? tablewaregroupId;
  String? quantity;
  String? rentalprice;

  GroupItemEntity(
      {this.itemgroupId,
        this.itemId,
        this.tablewaregroupId,
        this.quantity,
        this.rentalprice});

  GroupItemEntity.fromJson(Map<String, dynamic> json) {
    itemgroupId = json['itemgroupId'];
    itemId = json['itemId'];
    tablewaregroupId = json['tablewaregroupId'];
    quantity = json['quantity'];
    rentalprice = json['rentalprice'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['itemgroupId'] = this.itemgroupId;
    data['itemId'] = this.itemId;
    data['tablewaregroupId'] = this.tablewaregroupId;
    data['quantity'] = this.quantity;
    data['rentalprice'] = this.rentalprice;
    return data;
  }
}