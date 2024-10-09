class CreateJobModule {
  final String? message;
  final CreateJobEntry? job;

  CreateJobModule({
    this.message,
    this.job,
  });

  factory CreateJobModule.fromJson(Map<String, dynamic> json) {
    return CreateJobModule(
      message: json['message'],
      job: json['job'] != null ? CreateJobEntry.fromJson(json['job']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'job': job?.toJson(),
    };
  }
}

class CreateJobEntry {
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
  final String? id;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  CreateJobEntry({
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
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CreateJobEntry.fromJson(Map<String, dynamic> json) {
    return CreateJobEntry(
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
      id: json['_id'],
      createdAt:
          json['createdAt'] != null ? DateTime.parse(json['createdAt']) : null,
      updatedAt:
          json['updatedAt'] != null ? DateTime.parse(json['updatedAt']) : null,
      v: json['__v'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
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
      '_id': id,
      'createdAt': createdAt?.toIso8601String(),
      'updatedAt': updatedAt?.toIso8601String(),
      '__v': v,
    };
  }
}
