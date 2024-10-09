class JobsResponse {
  final String? status;
  final int? results;
  final JobData? data;

  JobsResponse({
    this.status,
    this.results,
    this.data,
  });

  factory JobsResponse.fromJson(Map<String, dynamic> json) {
    return JobsResponse(
      status: json['status'],
      results: json['results'],
      data: json['data'] != null ? JobData.fromJson(json['data']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'results': results,
      'data': data?.toJson(),
    };
  }
}

class JobData {
  final List<Job>? jobs;

  JobData({
    this.jobs,
  });

  factory JobData.fromJson(Map<String, dynamic> json) {
    return JobData(
      jobs: json['jobs'] != null
          ? (json['jobs'] as List<dynamic>).map((e) => Job.fromJson(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'jobs': jobs?.map((e) => e.toJson()).toList(),
    };
  }
}

class Job {
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

  Job({
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
  });

  factory Job.fromJson(Map<String, dynamic> json) {
    return Job(
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
    };
  }
}
