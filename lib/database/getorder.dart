

class GetOrder {
  List<Data>? data;

  GetOrder({this.data});

  GetOrder.fromJson(Map<String, dynamic> json) {
    if (json['Data'] != null) {
      data = <Data>[];
      json['Data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['Data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? order_no;
  String? product_name;

  Data({this.order_no, this.product_name});

  Data.fromJson(Map<String, dynamic> json) {
    order_no = json['order_no'];
    product_name = json['product_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_no'] = this.order_no;
    data['product_name'] = this.product_name;
    return data;
  }
}

