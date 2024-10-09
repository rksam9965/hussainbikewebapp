class JobUpdateResponse {
  final String? message;
  final JobUp? job;

  JobUpdateResponse({
    this.message,
    this.job,
  });

  factory JobUpdateResponse.fromJson(Map<String, dynamic> json) {
    return JobUpdateResponse(
      message: json['message'],
      job: json['job'] != null ? JobUp.fromJson(json['job']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'job': job?.toJson(),
    };
  }
}

class JobUp {
  final String? id;
  final String? salesMan;
  final String? phoneCode;
  final DateTime? receiveDate;
  final DateTime? deliveryDate;
  final String? customer;
  final String? mobileNumber;
  final String? driverDetails;
  final String? bikeNumber;
  final String? diagnosis;
  final String? estimatedCharges;
  final String? outstanding;
  final String? status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  JobUp({
    this.id,
    this.salesMan,
    this.phoneCode,
    this.receiveDate,
    this.deliveryDate,
    this.customer,
    this.mobileNumber,
    this.driverDetails,
    this.bikeNumber,
    this.diagnosis,
    this.estimatedCharges,
    this.outstanding,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory JobUp.fromJson(Map<String, dynamic> json) {
    return JobUp(
      id: json['_id'],
      salesMan: json['salesMan'],
      phoneCode: json['phoneCode'],
      receiveDate: json['receiveDate'] != null
          ? DateTime.parse(json['receiveDate'])
          : null,
      deliveryDate: json['deliveryDate'] != null
          ? DateTime.parse(json['deliveryDate'])
          : null,
      customer: json['customer'],
      mobileNumber: json['mobileNumber'],
      driverDetails: json['driverDetails'],
      bikeNumber: json['bikeNumber'],
      diagnosis: json['diagnosis'],
      estimatedCharges: json['estimatedCharges'],
      outstanding: json['outstanding'],
      status: json['status'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'salesMan': salesMan,
      'phoneCode': phoneCode,
      'receiveDate': receiveDate?.toIso8601String(),
      'deliveryDate': deliveryDate?.toIso8601String(),
      'customer': customer,
      'mobileNumber': mobileNumber,
      'driverDetails': driverDetails,
      'bikeNumber': bikeNumber,
      'diagnosis': diagnosis,
      'estimatedCharges': estimatedCharges,
      'outstanding': outstanding,
      'status': status,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
    };
  }
}
