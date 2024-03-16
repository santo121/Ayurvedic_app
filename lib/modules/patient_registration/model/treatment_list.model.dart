class TreatmentListModel {
  bool? status;
  String? message;
  List<Treatments>? treatments;

  TreatmentListModel({this.status, this.message, this.treatments});

  TreatmentListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['treatments'] != null) {
      treatments = <Treatments>[];
      json['treatments'].forEach((v) {
        treatments!.add(Treatments.fromJson(v));
      });
    }
  }


}

class Treatments {
  int? id;
  List<Branches>? branches;
  String? name;
  String? duration;
  String? price;
  bool? isActive;
  String? createdAt;
  String? updatedAt;

  Treatments(
      {this.id,
      this.branches,
      this.name,
      this.duration,
      this.price,
      this.isActive,
      this.createdAt,
      this.updatedAt});

  Treatments.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['branches'] != null) {
      branches = <Branches>[];
      json['branches'].forEach((v) {
        branches!.add(Branches.fromJson(v));
      });
    }
    name = json['name'];
    duration = json['duration'];
    price = json['price'];
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }


}

class Branches {
  int? id;
  String? name;
  int? patientsCount;
  String? location;
  String? phone;
  String? mail;
  String? address;
  String? gst;
  bool? isActive;

  Branches(
      {this.id,
      this.name,
      this.patientsCount,
      this.location,
      this.phone,
      this.mail,
      this.address,
      this.gst,
      this.isActive});

  Branches.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    patientsCount = json['patients_count'];
    location = json['location'];
    phone = json['phone'];
    mail = json['mail'];
    address = json['address'];
    gst = json['gst'];
    isActive = json['is_active'];
  }

}
