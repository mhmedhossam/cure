import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/model/specialties_model.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/widgets/custom_specialties_card.dart';

class ListViewBuilderSpecialtiesCard extends StatelessWidget {
  const ListViewBuilderSpecialtiesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: specialtiesList.length,

      itemBuilder: (context, i) {
        return CustomSpecialtiesCard(specialtiesModel: specialtiesList[i]);
      },
    );
  }
}
