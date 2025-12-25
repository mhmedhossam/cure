import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/constants/navigation.dart';
import 'package:round_8_mobile_cure_team3/core/constants/routes.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/manager/ProfileDetailsCubit/profile_details_cubit.dart';

import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/view/widget/custom_buttom_price.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/view/widget/DoctorDetailsBody.dart';

import 'package:round_8_mobile_cure_team3/features/chat/presentation/cubit/start_conversation/start_conversation_cubit.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, required this.idDoctor});

  final int idDoctor;

  @override
  Widget build(BuildContext context) {
    final int doctorId = idDoctor;
    print(doctorId);

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          'Doctor Details',
          style: TextStyles.title.copyWith(fontFamily: 'Georgia', fontSize: 25),
        ),
        centerTitle: true,
        actions: [
          BlocListener<StartConversationCubit, StartConversationState>(
            listener: (context, state) {
              if (state is StartConversationLoading) {
                showDialog(
                  context: context,
                  barrierDismissible: false,
                  builder: (_) =>
                      const Center(child: CircularProgressIndicator()),
                );
              }

              if (state is StartConversationSuccess) {
                Navigator.pop(context); // close loader

                Navigation.push(context, Routes.chatDetailScreen, {
                  "name": state.data.userName,
                  "id": state.id, // ✅ conversationId الحقيقي
                });
              }

              if (state is StartConversationFailure) {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            child: IconButton(
              icon: SvgPicture.asset(AppImages.chatSvg),
              onPressed: () {
                context.read<StartConversationCubit>().fetchStartConversation(
                  idDoctor,
                );
              },
            ),
          ),
        ],
      ),
      body: DoctorDetailsBody(doctorModel: idDoctor),
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
                      Routes.payScreen,
                      state.detailsModels,
                    );
                  },
                );
              } else {
                return CustomBottomPrice(
                  price: 0, // idDoctor.sessionPrice ?? 0.0,
                  title: 'Book Appointment',
                  onPressed: () {
                    Navigation.push(context, Routes.confirmAppointmentScreen);
                  },
                );
              }
            },
          ),
    );
  }
}
