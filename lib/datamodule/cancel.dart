class JobResponseCancel {
  final String status;
  final String message;
  final JobDataCancel data;

  JobResponseCancel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory JobResponseCancel.fromJson(Map<String, dynamic> json) {
    return JobResponseCancel(
      status: json['status'],
      message: json['message'],
      data: JobDataCancel.fromJson(json['data']),
    );
  }
}

class JobDataCancel {
  final JobCancel job;

  JobDataCancel({
    required this.job,
  });

  factory JobDataCancel.fromJson(Map<String, dynamic> json) {
    return JobDataCancel(
      job: JobCancel.fromJson(json['job']),
    );
  }
}

class JobCancel {
  final String id;
  final String salesMan;
  final String phoneCode;
  final DateTime receiveDate;
  final DateTime deliveryDate;
  final String customer;
  final String mobileNumber;
  final String driverDetails;
  final String bikeNumber;
  final String diagnosis;
  final String estimatedCharges;
  final String outstanding;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  JobCancel({
    required this.id,
    required this.salesMan,
    required this.phoneCode,
    required this.receiveDate,
    required this.deliveryDate,
    required this.customer,
    required this.mobileNumber,
    required this.driverDetails,
    required this.bikeNumber,
    required this.diagnosis,
    required this.estimatedCharges,
    required this.outstanding,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  factory JobCancel.fromJson(Map<String, dynamic> json) {
    return JobCancel(
      id: json['_id'],
      salesMan: json['salesMan'],
      phoneCode: json['phoneCode'],
      receiveDate: DateTime.parse(json['receiveDate']),
      deliveryDate: DateTime.parse(json['deliveryDate']),
      customer: json['customer'],
      mobileNumber: json['mobileNumber'],
      driverDetails: json['driverDetails'],
      bikeNumber: json['bikeNumber'],
      diagnosis: json['diagnosis'],
      estimatedCharges: json['estimatedCharges'],
      outstanding: json['outstanding'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      version: json['__v'],
    );
  }
}
