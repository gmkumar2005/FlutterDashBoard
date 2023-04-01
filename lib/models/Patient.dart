// PatientID. Name. Age. Gender. DateOfAdmission
// Slno. PatientID. Diagnosis. Treatment. DateOfTreatment. Cost

class Patient {
  final String? patientid, name, gender, dateofadmission;
  final int? age;

  Patient(
      {this.patientid, this.name, this.age, this.gender, this.dateofadmission});

  Patient.fromJson(Map<String, dynamic> json)
      : patientid = json['patientid'],
        name = json['name'],
        age = json['age'],
        gender = json['gender'],
        dateofadmission = json['dateofadmission'];

  Map<String, dynamic> toJson() => {
        'patientid': patientid,
        'name': name,
        'age': age,
        'gender': gender,
        'dateofadmission': dateofadmission,
      };
}

List<Patient> demoPatients = [
  Patient(
      patientid: "One",
      name: "Ekam",
      age: 1,
      gender: "Male",
      dateofadmission: "01-03-2021"),
  Patient(
      patientid: "Two",
      name: "Dve",
      age: 2,
      gender: "Male",
      dateofadmission: "02-03-2021"),
  Patient(
      patientid: "Theee",
      name: "Treeni",
      age: 3,
      gender: "Male",
      dateofadmission: "03-03-2021"),
  Patient(
      patientid: "Four",
      name: "Chatvaari",
      age: 4,
      gender: "Male",
      dateofadmission: "04-03-2021")
];
