import 'package:flutter/material.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_appbar.dart';

class FavouriteScreen extends StatelessWidget {
  final bool isFavouriteEmpty = false;
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Your Favourite"),

      body: isFavouriteEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    AppImages.noNotification,
                    height: 180,
                    width: 170,
                  ),

                  Text("Your favourite!", style: TextStyles.title),
                  Text(
                    "Add your favorite to find it easily",
                    style: TextStyles.details,
                  ),
                ],
              ),
            )
          : const SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    // CustomListTile(
                    //   image: AppImages.docImg,
                    //   title: 'Robert Johnson',
                    //   subTitle: 'Orthopedic|Nasr Hospital',
                    //   rate: 4.8,
                    //   time: '9:30am - 8:00pm',
                    // ),

                    // CustomListTile(
                    //   image: AppImages.doctor,
                    //   title: 'Robert Johnson',
                    //   subTitle: 'Orthopedic | El-Nasr Hospital',
                    //   rate: 4.8,
                    //   time: '9:30am - 8:00pm',
                    // ),
                  ],
                ),
              ),
            ),
    );
  }
}
