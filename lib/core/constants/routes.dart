import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:round_8_mobile_cure_team3/core/di/servies_locator.dart';
import 'package:round_8_mobile_cure_team3/features/Booking/presentation/View/booking.dart';
import 'package:round_8_mobile_cure_team3/features/Confirm%20Appointment/presentation/view/Confirm_AppointmentScreen.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/data/Models/DoctorProfileDetails.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/domain/UseCase/ProfileDetails_Use_Case.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/manager/ProfileDetailsCubit/profile_details_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/presentation/view/doctor_details_screen.dart';
import 'package:round_8_mobile_cure_team3/features/Pay/presentation/view/PayScreen.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/usecases/get_message_usecase.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/usecases/send_message_usecase.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/usecases/start_conversation.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/cubit/send_and_load_message/send_message_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/cubit/start_conversation/start_conversation_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/pages/chat_detail_screen.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/pages/search_screen.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/usecases/add_to_favourite.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/usecases/get_all_doctors_use_case.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/cubit/home_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/views/current_location_screen.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/views/doctor_near_you_screen.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/views/doctor_screen.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/views/favourite_screen.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/views/search_screen.dart';
import 'package:round_8_mobile_cure_team3/features/home/presentation/views/specialties_screen.dart';
import 'package:round_8_mobile_cure_team3/features/init_pages/presentation/onboarding_view.dart';
import 'package:round_8_mobile_cure_team3/features/init_pages/presentation/splash_screen.dart';
import 'package:round_8_mobile_cure_team3/features/main_screen/main_screen.dart';
import 'package:round_8_mobile_cure_team3/features/notification/presentation/screens/notification_page.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/usecases/log_out_use_case.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/cubit/settings/settings_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/pages/FAQs.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/pages/add_new_card.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/pages/edit_profile.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/pages/password_management.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/pages/payment_method_first.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/pages/payment_method_second.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/pages/privacy_policy.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/pages/profile.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/pages/setting_screen.dart';

import '../../features/auth/presentation/otp/cubit/verify_otp_cubit.dart';
import '../../features/auth/presentation/otp/screens/otp_verification_screen.dart';
import '../../features/auth/presentation/register/cubit/register_cubit.dart';
import '../../features/auth/presentation/register/screens/register_screen.dart';
import '../../features/auth/presentation/sign_in/cubit/sign_in_cubit.dart';
import '../../features/auth/presentation/sign_in/screens/sign_in_screen.dart';

class Routes {
  static String favouriteScreen = "/favourite_screen";
  static String signInScreen = "/signIn_screen";
  static String signUpScreen = "/signUp_screen";
  static String onBoardingScreen = "/onBoarding_screen";
  static String notificationScreen = "/notification_screen";
  static String searchScreen = "/search_screen";
  static String doctorScreen = "/doctor_screen";
  static String specialtiesScreen = "/specialties_screen";
  static String homeSearchScreen = "/home_search_screen";
  static String mainScreen = "/main_screen";
  static String splashScreen = "/splash_screen";
  static String currentLocationScreen = "/current_location_screen";
  static String profileScreen = "/profile_screen";
  static String editProfileScreen = "/edit_profile_screen";
  static String faqsScreen = "/faqs_screen";
  static String paymentMethodFirstScreen = "/payment_method_first_screen";
  static String paymentMethodSecondScreen = "/payment_method_second_screen";
  static String settingsScreen = "/settings_screen";
  static String AddCardScreen = "/add_new_card_screen";
  static String privacyPolicyScreen = "/privacy_policy_screen";
  static String passwordManagmentScreen = "/password_management_screen";

  static String doctorNearYouScreen = "/doctor_near_you_screen";
  static String confirmAppointmentScreen = "/confirmAppointment_screen";
  static String doctorDetailsScreen = "/doctorDetails_screen";
  static String payScreen = "/pay_screen";
  static String bookingScreen = "/booking_screen";
  static String chatDetailScreen = "/chatDetail_screen";
  static String otpVerifyScreen = "/otp_verification_screen";

  static var routes = GoRouter(
    initialLocation: splashScreen,

    routes: [
      GoRoute(
        path: favouriteScreen,
        builder: (context, state) => const FavouriteScreen(),
      ),

      GoRoute(
        path: chatDetailScreen,
        builder: (context, state) {
          Map<String, dynamic> data = state.extra as Map<String, dynamic>;
          return MultiBlocProvider(
            child: ChatDetailsScreen(
              name: data['name'],
              conversationId: data["id"],
            ),
            providers: [
              BlocProvider(
                create: (context) => StartConversationCubit(
                  ServiceLocator.gi<StartConversationUseCase>(),
                ),
              ),
              BlocProvider(
                create: (context) => MessageCubit(
                  ServiceLocator.gi<GetConversationMessagesUseCase>(),
                  ServiceLocator.gi<SendMessageUseCase>(),
                  ServiceLocator.gi<SendFileMessageUseCase>(),
                )..loadMessages(data["id"]),
              ),
            ],
          );
        },
      ),

      GoRoute(
        path: editProfileScreen,
        builder: (context, state) => const EditProfile(),
      ),
      GoRoute(
        path: faqsScreen,
        builder: (context, state) => const FaqsScreen(),
      ),
      GoRoute(
        path: privacyPolicyScreen,
        builder: (context, state) => PrivacyPolicyScreen(),
      ),
      GoRoute(
        path: paymentMethodFirstScreen,
        builder: (context, state) => const PaymentMethodFirst(),
      ),
      GoRoute(
        path: paymentMethodSecondScreen,
        builder: (context, state) => const PaymentMethodSecond(),
      ),
      GoRoute(
        path: settingsScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => ServiceLocator.gi<SettingsCubit>(),
          child: SettingScreen(),
        ),
      ),
      GoRoute(
        path: AddCardScreen,
        builder: (context, state) => const AddNewCardScreen(),
      ),
      GoRoute(path: bookingScreen, builder: (context, state) => Booking()),
      GoRoute(
        path: confirmAppointmentScreen,
        builder: (context, state) {
          //return Container();
          var bookingmodels = state.extra as DoctorDetailsModels;
          return ConfirmAppointmentScreen(detailsModels: bookingmodels);
        },
      ),
      GoRoute(
        path: payScreen,
        builder: (context, state) {
          var bookingmodels = state.extra as DoctorDetailsModels;

          return PayScreen(bookingModels: bookingmodels);
        },
      ),
      GoRoute(
        path: doctorDetailsScreen,
        builder: (context, state) {
          var id = state.extra as String;

          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (_) => ProfileDetailsCubit(
                  ServiceLocator.gi<ProfiledetailsUseCase>(),
                )..getProfileDetails(idDoctor: int.parse(id)),
              ),
              BlocProvider(
                create: (_) => StartConversationCubit(
                  ServiceLocator.gi<StartConversationUseCase>(),
                ),
              ),
            ],
            child: DoctorDetailsScreen(idDoctor: int.parse(id)),
          );
        },
      ),

      GoRoute(
        path: mainScreen,
        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        path: doctorNearYouScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => HomeCubit(
            addToFavouriteUseCase: ServiceLocator.gi<AddToFavouriteUseCase>(),
            getAllDoctorsUseCase: ServiceLocator.gi<GetAllDoctorsUseCase>(),
          )..getAllDoctors(),
          child: const DoctorNearYouScreen(),
        ),
      ),
      GoRoute(
        path: signUpScreen,
        builder: (context, state) => BlocProvider(
          create: (_) => ServiceLocator.gi<RegisterCubit>(),
          child: const RegisterScreen(),
        ),
      ),
      GoRoute(
        path: signInScreen,
        builder: (context, state) => BlocProvider(
          create: (_) => ServiceLocator.gi<SignInCubit>(),
          child: SignInScreen(),
        ),
      ),
      GoRoute(
        path: onBoardingScreen,
        builder: (context, state) => const OnboardingView(),
      ),
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: notificationScreen,
        builder: (context, state) => const NotificationPage(),
      ),
      GoRoute(
        path: passwordManagmentScreen,
        builder: (context, state) => BlocProvider(
          create: (context) => ServiceLocator.gi<SettingsCubit>(),
          child: const PasswordManagement(),
        ),
      ),
      GoRoute(
        path: currentLocationScreen,
        builder: (context, state) => const CurrentLocation(),
      ),
      GoRoute(
        path: doctorScreen,
        builder: (context, state) {
          var specialty = state.extra as String;
          return BlocProvider(
            create: (context) {
              return HomeCubit(
                  searchName: specialty,
                  specialtySearch: specialty,
                  getAllDoctorsUseCase:
                      ServiceLocator.gi<GetAllDoctorsUseCase>(),
                  addToFavouriteUseCase:
                      ServiceLocator.gi<AddToFavouriteUseCase>(),
                )
                ..getAllDoctors()
                ..doctorScreenInit();
            },
            child: DoctorScreen(),
          );
        },
      ),
      GoRoute(
        path: specialtiesScreen,
        builder: (context, state) => const SpecialtiesScreen(),
      ),
      GoRoute(
        path: searchScreen,
        builder: (context, state) => const SearchScreen(),
      ),
      GoRoute(
        path: homeSearchScreen,
        builder: (context, state) => const HomeSearchScreen(),
      ),
      GoRoute(
        path: otpVerifyScreen,
        builder: (context, state) {
          final phoneNumber = state.extra as String;
          return BlocProvider(
            create: (_) => ServiceLocator.gi<VerifyOtpCubit>(),
            child: OTPVerificationScreen(phoneNumber: phoneNumber),
          );
        },
      ),
    ],
  );
}
