import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/di/servies_locator.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/data/Models/DoctorProfileDetails.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/domain/UseCase/ProfileDetails_Use_Case.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/manager/ProfileDetailsCubit/profile_details_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/view/widget/custom_buttom_price.dart';
import 'package:round_8_mobile_cure_team3/features/Pay/presentation/manager/cubit/save_date_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/Pay/presentation/view/widget/PayScreenBody.dart';

class PayScreen extends StatelessWidget {
  const PayScreen({super.key, required this.bookingModels});
  final DoctorDetailsModels bookingModels;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              ProfileDetailsCubit(ServiceLocator.gi<ProfiledetailsUseCase>())
                ..getProfileDetails(idDoctor: bookingModels.id),
        ),
        BlocProvider(create: (context) => SaveDateCubit()),
      ],
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.black,
            ),
            onPressed: () {
              context.pop();
            },
          ),
          title: Text(
            'Book Appointment',
            style: TextStyles.title.copyWith(
              fontFamily: 'Georgia',
              fontSize: 22, //Georgia/Heading 3
            ), // TextStyle(color: Colors.black, fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: const PayScreenBody(),
        bottomNavigationBar:
            BlocBuilder<ProfileDetailsCubit, ProfileDetailsState>(
              builder: (context, state) {
                if (state is ProfileDetailsSucess) {
                  return CustomBottomPrice(
                    price: state
                        .detailsModels
                        .sessionPrice, // idDoctor.sessionPrice ?? 0.0,
                    title: 'Book Appointment',
                    onPressed: () {
                      Navigation.push(
                        context,
                        Routes.confirmAppointmentScreen,
                        state.detailsModels,
                      );
                    },
                  );
                } else {
                  return CustomBottomPrice(
                    price: 0, // idDoctor.sessionPrice ?? 0.0,
                    title: 'Book Appointment',
                    onPressed: () {
                      // Navigation.push(
                      //   context,
                      //   Routes.confirmAppointmentScreen,state.
                      //);
                    },
                  );
                }
              },
            ),
      ),
    );
  }
}
