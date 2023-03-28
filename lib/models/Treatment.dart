// PatientID. Name. Age. Gender. DateOfAdmission
// Slno. PatientID. Diagnosis. Treatment. DateOfTreatment. Cost

class Treatment {
  final String? treatmentid,
      patientid,
      diagnosis,
      treatment,
      dateoftreatment;
final double? price;
  Treatment(
      {this.treatmentid,
      this.patientid,
      this.diagnosis,
      this.treatment,
      this.dateoftreatment,
      this.price});
}

List demoTreatments = [
  Treatment(
      treatmentid: "1",
      patientid: "ekam",
      diagnosis: "Simple diagnosis",
      treatment: "Simple treatment",
      dateoftreatment: "01-03-2021",
      price: 100),
  Treatment(
      treatmentid: "2",
      patientid: "dve",
      diagnosis: "Simple diagnosis",
      treatment: "Simple treatment",
      dateoftreatment: "01-03-2021",
      price: 200),
  Treatment(
      treatmentid: "3",
      patientid: "ekam",
      diagnosis: "Second diagnosis",
      treatment: "Second treatment",
      dateoftreatment: "01-03-2021",
      price: 300),
  Treatment(
      treatmentid: "4",
      patientid: "ekam",
      diagnosis: "Third diagnosis",
      treatment: "Third treatment",
      dateoftreatment: "03-03-2021",
      price: 400),

];

double? totalTreatmentCost =
demoTreatments.map((product) => product.price).reduce((v, e) => v! + e!);
// double? sumofDistance =
// demoBookings.map((product) => product.distance).reduce((v, e) => v! + e!);
// double? totalBookings = sumofprice! * sumofDistance!;
