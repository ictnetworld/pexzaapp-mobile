class PaymentHistory {
  List<History> history;
  String status;

  PaymentHistory({this.history, this.status});

  PaymentHistory.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      history = new List<History>();
      json['data'].forEach((v) {
        history.add(new History.fromJson(v));
      });
    }
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.history != null) {
      data['data'] = this.history.map((v) => v.toJson()).toList();
    }
    data['status'] = this.status;
    return data;
  }
}

class History {
  int id;
  String userId;
  String duration;
  String amount;
  String signature;
  String assignmentId;
  String createdAt;
  String updatedAt;

  History(
      {this.id,
      this.userId,
      this.duration,
      this.amount,
      this.signature,
      this.assignmentId,
      this.createdAt,
      this.updatedAt});

  History.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    duration = json['duration'];
    amount = json['amount'];
    signature = json['signature'];
    assignmentId = json['assignment_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['duration'] = this.duration;
    data['amount'] = this.amount;
    data['signature'] = this.signature;
    data['assignment_id'] = this.assignmentId;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}