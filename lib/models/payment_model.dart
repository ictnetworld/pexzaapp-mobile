class AuthPayment {
  String authorizationUrl;
  String accessCode;
  String reference;

  AuthPayment({this.authorizationUrl, this.accessCode, this.reference});

  AuthPayment.fromJson(Map<String, dynamic> json) {
    authorizationUrl = json['authorization_url'];
    accessCode = json['access_code'];
    reference = json['reference'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['authorization_url'] = this.authorizationUrl;
    data['access_code'] = this.accessCode;
    data['reference'] = this.reference;
    return data;
  }
}

class PaymentStat {
  Dstat dstat;
  String status;

  PaymentStat({this.dstat, this.status});

  PaymentStat.fromJson(Map<String, dynamic> json) {
    dstat = json['data'] != null ? new Dstat.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.dstat != null) {
      data['data'] = this.dstat.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Dstat {
  Stats stats;
  String status;

  Dstat({this.stats, this.status});

  Dstat.fromJson(Map<String, dynamic> json) {
    stats = json['data'] != null ? new Stats.fromJson(json['data']) : null;
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.stats != null) {
      data['data'] = this.stats.toJson();
    }
    data['status'] = this.status;
    return data;
  }
}

class Stats {
  LastPayment lastPayment;
  String timeTillNextPayment;

  Stats({this.lastPayment, this.timeTillNextPayment});

  Stats.fromJson(Map<String, dynamic> json) {
    lastPayment = json['last_payment'] != null
        ? new LastPayment.fromJson(json['last_payment'])
        : null;
    timeTillNextPayment = json['time_till_next_payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.lastPayment != null) {
      data['last_payment'] = this.lastPayment.toJson();
    }
    data['time_till_next_payment'] = this.timeTillNextPayment;
    return data;
  }
}

class LastPayment {
  int id;
  String userId;
  String duration;
  String amount;
  String signature;
  String assignmentId;
  String createdAt;
  String updatedAt;

  LastPayment(
      {this.id,
      this.userId,
      this.duration,
      this.amount,
      this.signature,
      this.assignmentId,
      this.createdAt,
      this.updatedAt});

  LastPayment.fromJson(Map<String, dynamic> json) {
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

class PayPalAuth {
  Link link;

  PayPalAuth({this.link});

  PayPalAuth.fromJson(Map<String, dynamic> json) {
    link = json['link'] != null ? new Link.fromJson(json['link']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.link != null) {
      data['link'] = this.link.toJson();
    }
    return data;
  }
}

class Link {
  String href;
  String rel;
  String method;

  Link({this.href, this.rel, this.method});

  Link.fromJson(Map<String, dynamic> json) {
    href = json['href'];
    rel = json['rel'];
    method = json['method'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['href'] = this.href;
    data['rel'] = this.rel;
    data['method'] = this.method;
    return data;
  }
}
