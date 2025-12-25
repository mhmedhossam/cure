import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/entities/doctor_model/datum.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/cubit/home_cubit.dart';

class CustomListTile extends StatefulWidget {
  final Datum doctor;
  final HomeCubit cubit;
  // i will change it
  CustomListTile({super.key, required this.doctor, required this.cubit});

  @override
  State<CustomListTile> createState() => _CustomListTileState();
}

class _CustomListTileState extends State<CustomListTile> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {
        Navigation.push(context, Routes.doctorDetailsScreen, widget.doctor.id.toString());
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5),
        height: media.height * 0.12,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: AppColors.greyColor.withValues(alpha: 0.5)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,

          children: [
            Container(
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  topLeft: Radius.circular(15),
                ),
              ),
              child: Image.asset(
                AppImages.docImg,
                width: 80,
                height: media.height * 0.12,
                fit: BoxFit.cover,
              ),
            ),
            Gap(media.width * 0.03),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.doctor.name ?? "",
                    // widget.doctor.name ?? "",
                    style: TextStyles.title.copyWith(fontSize: 16),
                  ),
                  Text(
                    widget.doctor.clinicAddress ?? "",
                    style: TextStyles.details,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const Gap(2),
                        Text("${widget.doctor.experienceYears} "),
                        const SizedBox(width: 10),
                        const Icon(
                          Icons.access_time,
                          size: 18,
                          color: AppColors.greyColor,
                        ),
                        const Gap(5),

                        Expanded(
                          child: Text(
                            "${widget.doctor.mobile ?? "0104875878"}",
                            style: TextStyles.details.copyWith(
                              color: AppColors.secondaryColor,
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Gap(15),

            GestureDetector(
              onTap: () async {
                widget.cubit.id = widget.doctor.id;
                print("hoss");
                await widget.cubit.addToFavouriteUseCase;
                setState(() {});
              },
              child: SvgPicture.asset(
                // context.read<HomeCubit>().isFavourite
                widget.cubit.isFavourite
                    ? AppImages.favouriteOff
                    : AppImages.likeSvg,
                height: 20,
                width: 20,
              ),
            ),
            const Gap(15),
          ],
        ),
      ),
    );
  }
}
