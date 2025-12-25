import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:round_8_mobile_cure_team3/core/constants/app_images.dart';
import 'package:round_8_mobile_cure_team3/core/di/servies_locator.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/domain/UseCase/Fetch_booking_Use_Case.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/presentation/View/booking.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/presentation/manager/get_bookingCubit/get_booking_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/domain/UseCase/ProfileDetails_Use_Case.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/manager/ProfileDetailsCubit/profile_details_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/Pay/presentation/manager/cubit/save_date_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/usecases/get_conversations.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/usecases/get_unread_conversations.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/cubit/get_conversations/chat_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/cubit/get_unread_conversations/get_unread_conversations_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/pages/chats.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/usecases/add_to_favourite.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/usecases/get_all_doctors_use_case.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/cubit/home_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/views/home_screen.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/usecases/get_notification.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/usecases/log_out_use_case.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/pages/profile.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<Widget> screens;
  int currentIndex = 0;
  @override
  void initState() {
    screens = [
      BlocProvider(
        create: (context) => HomeCubit(
          addToFavouriteUseCase: ServiceLocator.gi<AddToFavouriteUseCase>(),
          getAllDoctorsUseCase: ServiceLocator.gi<GetAllDoctorsUseCase>(),
        )..getAllDoctors(),
        child: const HomeScreen(),
      ),
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ProfileDetailsCubit(ServiceLocator.gi<ProfiledetailsUseCase>()),
          ),
          BlocProvider(
            create: (context) =>
                GetBookingCubit(ServiceLocator.gi<FetchBookingUseCase>())
                  ..getBooking(),
          ),
        ],
        child: Booking(),
      ),
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                ChatCubit(ServiceLocator.gi<GetConversations>())..fetchChats(),
          ),

          BlocProvider(create: (context) => SaveDateCubit()),
          BlocProvider(
            create: (context) => GetUnreadConversationsCubit(
              ServiceLocator.gi<GetUnreadConversationsUseCase>(),
            ),
          ),
        ],

        child: const Chats(),
      ),
      BlocProvider(
        create: (context) => ProfileCubit(
          getProfileUseCase: ServiceLocator.gi<GetProfileUseCase>(),
          logOutUseCase: ServiceLocator.gi<LogOutUseCase>(),

          // getNotification: ServiceLocator.gi<GetNotification>(),
          // getNotification: ServiceLocator.gi<GetNotification>(),
        )..fetchProfile(),
        child: ProfilePage(),
      ),
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,

        selectedIconTheme: const IconThemeData(color: AppColors.primaryColor),
        showSelectedLabels: true,
        selectedItemColor: AppColors.primaryColor,
        backgroundColor: AppColors.whiteColor,
        currentIndex: currentIndex,
        onTap: (i) {
          currentIndex = i;
          setState(() {});
        },
        items: [
          _bottomNavigationBarItem(assetName: AppImages.homeSvg, label: "Home"),
          _bottomNavigationBarItem(
            assetName: AppImages.bookingSvg,
            label: "Booking",
          ),
          _bottomNavigationBarItem(assetName: AppImages.chatSvg, label: "chat"),
          _bottomNavigationBarItem(
            assetName: AppImages.profileSvg,
            label: "Profile",
          ),
        ],
      ),
      body: screens[currentIndex],
    );
  }
}

BottomNavigationBarItem _bottomNavigationBarItem({
  required String label,
  required String assetName,
}) {
  return BottomNavigationBarItem(
    label: label,
    icon: SvgPicture.asset(assetName),
    activeIcon: SvgPicture.asset(
      assetName,
      colorFilter: const ColorFilter.mode(
        AppColors.primaryColor,
        BlendMode.srcIn,
      ),
    ),
  );
}
