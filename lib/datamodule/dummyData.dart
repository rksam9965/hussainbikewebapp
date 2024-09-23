class Item {
  String? name;
  String? salesman;
  String? phoneCode;
  String? customer;
  String? mobileNumber;
  String? deliverDate;
  String? receiveDate;
  String? driverDetails;
  String? bikeNumber;
  String? diagnosis;
  String? estimateCharges;
  String? address;
  String? outstanding;
  String? phoneNumber;
  String? email;
  String? vat;
  String? selectCustomer;
  String? selectDriver;
  String? selectWeek;

  Item(
      {this.name,
      this.salesman,
      this.phoneCode,
      this.customer,
      this.mobileNumber,
      this.driverDetails,
      this.receiveDate,
      this.bikeNumber,
      this.diagnosis,
      this.estimateCharges,
      this.address,
      this.outstanding,
      this.deliverDate,
      this.phoneNumber,
      this.email,
      this.vat,
      this.selectCustomer,
      this.selectDriver,
      this.selectWeek});
}

class Item1 {
  String? code;
  String? printName;
  String? qty;
  String? price;

  Item1({this.code, this.printName, this.qty, this.price});
}
