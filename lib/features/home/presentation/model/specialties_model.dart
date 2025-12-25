import 'package:flutter/material.dart';

class SpecialtiesModel {
  final IconData icon;
  final String text;

  SpecialtiesModel({required this.icon, required this.text});
}

List<SpecialtiesModel> specialtiesList = [
  SpecialtiesModel(icon: Icons.access_alarm, text: "Dentist"),
  SpecialtiesModel(icon: Icons.access_alarm, text: "Cardiologist"),
  SpecialtiesModel(icon: Icons.noise_aware_rounded, text: "Ent"),
  SpecialtiesModel(icon: Icons.access_alarm, text: "Neurologist"),
  SpecialtiesModel(icon: Icons.access_alarm, text: "General Practitioner"),
  SpecialtiesModel(icon: Icons.access_alarm, text: "Ophthalmologist"),
  SpecialtiesModel(icon: Icons.access_alarm, text: "Pulmonologist"),
  SpecialtiesModel(icon: Icons.access_alarm, text: "Orthopedic"),
  SpecialtiesModel(icon: Icons.access_alarm, text: "Gastroenterologist"),
  SpecialtiesModel(icon: Icons.access_alarm, text: "Oncologist"),
  SpecialtiesModel(icon: Icons.access_alarm, text: "Endocrinologist"),
  SpecialtiesModel(icon: Icons.access_alarm, text: "Psychiatrist"),
];
