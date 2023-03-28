
// PatientID. Name. Age. Gender. DateOfAdmission
// Slno. PatientID. Diagnosis. Treatment. DateOfTreatment. Cost

class Patient {
  final String? patientid, name, age, gender, dateofadmission;

  Patient(
      {this.patientid,
      this.name,
      this.age,
      this.gender,
      this.dateofadmission});
}

List demoPatients = [
  Patient(
      patientid: "One",
      name: "Ekam",
      age: "01",
      gender: "Male",
      dateofadmission: "01-03-2021"),
  Patient(
      patientid: "Two",
      name: "Dve",
      age: "02",
      gender: "Male",
      dateofadmission: "02-03-2021"),
  Patient(
      patientid: "Theee",
      name: "Treeni",
      age: "03",
      gender: "Male",
      dateofadmission: "03-03-2021"),
  Patient(
      patientid: "Four",
      name: "Chatvaari",
      age: "04",
      gender: "Male",
      dateofadmission: "04-03-2021")

];
