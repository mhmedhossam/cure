import 'package:get_it/get_it.dart';
import 'package:round_8_mobile_cure_team3/core/services/api/network/dio_provider.dart';
import 'package:round_8_mobile_cure_team3/core/services/local/shared_pref.dart';
import 'package:round_8_mobile_cure_team3/features/Confirm%20Appointment/data/Data_Source/SelectDateRemote.dart';
import 'package:round_8_mobile_cure_team3/features/Confirm%20Appointment/data/Repos_Imple/SelectDateReposImple.dart';
import 'package:round_8_mobile_cure_team3/features/Confirm%20Appointment/domain/UseCase/SelectDate_Use_Case.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/data/Data_Source/profileDatailsRemote.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/data/Repos_Imple/ProfileDetailsReposImle.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/domain/Repos/ProfileRepos.dart';
import 'package:round_8_mobile_cure_team3/features/DoctorDetails/domain/UseCase/ProfileDetails_Use_Case.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/data_sources/remote/auth_remote_data_source_imp.dart';
import 'package:round_8_mobile_cure_team3/features/auth/data/repo_imp/auth_repo_imp.dart';
import 'package:round_8_mobile_cure_team3/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:round_8_mobile_cure_team3/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:round_8_mobile_cure_team3/features/chat/data/datasources/chat_remote_data_source_impl.dart';
import 'package:round_8_mobile_cure_team3/features/chat/data/repositores/chat_repository_implementation.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/repositories/chat_repository.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/usecases/get_conversations.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/usecases/get_unread_conversations.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/usecases/search_conversations.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/cubit/get_unread_conversations/get_unread_conversations_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/cubit/search_Conversations/search_conversations_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/home/data/data_sources/local_data_source/local_data_source.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/usecases/add_to_favourite.dart';
import 'package:round_8_mobile_cure_team3/features/profile/data/datasources/profile_api_service.dart';
import 'package:round_8_mobile_cure_team3/features/profile/data/repositories/repositories_impl.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/repositories/repo_interface.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/usecases/change_password_use_case.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/usecases/delete_account_usse_case.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/usecases/get_profile_use_case.dart';
import 'package:round_8_mobile_cure_team3/features/profile/domain/usecases/log_out_use_case.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:round_8_mobile_cure_team3/features/profile/presentation/cubit/settings/settings_cubit.dart';
import '../../features/Booking/data/Data_Source/BookingRemoteDataSource.dart';
import '../../features/Booking/data/Repos_Imple/Fetch_booking_ReposImple.dart';
import '../../features/Booking/domain/Repos/fetch_Booking_Repos.dart';
import '../../features/Booking/domain/UseCase/Fetch_booking_Use_Case.dart';
import '../../features/Booking/presentation/manager/get_bookingCubit/get_booking_cubit.dart';
import '../../features/auth/data/data_sources/local/local_auth.dart';
import 'package:round_8_mobile_cure_team3/features/home/data/data_repository/home_repository_impl.dart';
import 'package:round_8_mobile_cure_team3/features/home/data/data_sources/remote_data_source/remote_data_source.dart';
import 'package:round_8_mobile_cure_team3/features/home/data/data_sources/remote_data_source/remote_data_source_impl.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/repository/home_repository.dart';
import 'package:round_8_mobile_cure_team3/features/home/domain/usecases/get_all_doctors_use_case.dart';
import '../../features/auth/data/data_sources/remote/auth_remote_data_source.dart';
import '../../features/auth/domain/repositories/auth_repository.dart';
import '../../features/auth/domain/usecases/otp_use_case.dart';
import '../../features/auth/domain/usecases/register_use_case.dart';
import '../../features/auth/presentation/otp/cubit/verify_otp_cubit.dart';
import '../../features/auth/presentation/register/cubit/register_cubit.dart';
import '../../features/auth/presentation/sign_in/cubit/sign_in_cubit.dart';
import '../../features/chat/domain/usecases/get_message_usecase.dart';
import '../../features/chat/domain/usecases/send_message_usecase.dart';
import '../../features/chat/domain/usecases/start_conversation.dart';
import '../../features/chat/presentation/cubit/send_and_load_message/send_message_cubit.dart';
import '../../features/chat/presentation/cubit/start_conversation/start_conversation_cubit.dart';
import '../../features/notification/data/data_source/remote/notification_data_source.dart';
import '../../features/notification/data/data_source/remote/notification_data_source_imp.dart';
import '../../features/notification/data/repo_imp/notification_repo_imp.dart';
import '../../features/notification/domain/repo/notification_repo.dart';
import '../../features/notification/domain/usecases/notification_usecase.dart';
import '../../features/notification/presentation/cubit/notification_cubit.dart';
import '../services/api/network/network_info.dart';

class ServiceLocator {
  static final gi = GetIt.instance;

  static setupServiceLocator() async {
    await DioProvider.init();
    await SharedPref.init();
    gi.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl());
    gi.registerSingleton<SharedPref>(SharedPref());
    gi.registerLazySingleton<LocalAuth>(() => LocalAuth());
    gi.registerLazySingleton<LocalDataSource>(() => LocalDataSource());

    // remote datasource

    ///.....................................................
    gi.registerLazySingleton<ChatRemoteDataSource>(
      () => ChatRemoteDataSourceIMpl(),
    );
    gi.registerLazySingleton<HomeRemoteDataSource>(
      () => HomeRemoteDataSourceImpl(),
    );
    gi.registerLazySingleton<Profiledatailsremote>(
      () => ProfiledatailsremoteImp(),
    );

    ///.....................................................

    // repos
    gi.registerLazySingleton<ChatRepository>(
      () => ChatRepositoryImpl(
        gi<ChatRemoteDataSource>(),
        networkInfo: NetworkInfoImpl(),
      ),
    );
    gi.registerLazySingleton<HomeRepository>(
      () => HomeRepositoryImpl(
        homeRemoteDataSource: gi<HomeRemoteDataSource>(),
        networkInfo: NetworkInfoImpl(),
      ),
    );

    //...........................................................
    // Use cases
    gi.registerLazySingleton<GetAllDoctorsUseCase>(
      () => GetAllDoctorsUseCase(homeRepository: gi<HomeRepository>()),
    );
    gi.registerLazySingleton<AddToFavouriteUseCase>(
      () => AddToFavouriteUseCase(homeRepository: gi<HomeRepository>()),
    );
    gi.registerLazySingleton<GetConversations>(
      () => GetConversations(repository: gi<ChatRepository>()),
    );

    gi.registerLazySingleton<GetUnreadConversationsUseCase>(
      () => GetUnreadConversationsUseCase(
        unreadConversation: gi<ChatRepository>(),
      ),
    );

    gi.registerLazySingleton<GetUnreadConversationsCubit>(
      () => GetUnreadConversationsCubit(gi<GetUnreadConversationsUseCase>()),
    );

    gi.registerLazySingleton<GetConversationMessagesUseCase>(
      () => GetConversationMessagesUseCase(gi<ChatRepository>()),
    );
    gi.registerFactory<MessageCubit>(
      //
      () => MessageCubit(
        gi<GetConversationMessagesUseCase>(),
        gi<SendMessageUseCase>(),
        gi<SendFileMessageUseCase>(),
      ),
    );
    gi.registerLazySingleton<SendFileMessageUseCase>(
      () => SendFileMessageUseCase(gi<ChatRepository>()),
    );
    gi.registerFactory<SearchConversationsCubit>(
      () => SearchConversationsCubit(gi<SearchConversations>()),
    );

    gi.registerLazySingleton<SearchConversations>(
      () => SearchConversations(repo: gi<ChatRepository>()),
    );

    gi.registerLazySingleton<SendMessageUseCase>(
      () => SendMessageUseCase(gi<ChatRepository>()),
    );
    gi.registerLazySingleton<StartConversationUseCase>(
      () => StartConversationUseCase(repo: gi<ChatRepository>()),
    );

    gi.registerFactory<StartConversationCubit>(
      () => StartConversationCubit(gi<StartConversationUseCase>()),
    );
    //auth
    // remote datasource
    gi.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImp(),
    );

    gi.registerLazySingleton<RegisterCubit>(
      () => RegisterCubit(gi<RegisterUseCase>()),
    );
    //usecases
    gi.registerLazySingleton<VerifyOtpUseCase>(
      () => VerifyOtpUseCase(repository: gi<AuthRepository>()),
    );

    // gi.registerLazySingleton<ProfiledetailsUseCase>(() {
    //   return ProfiledetailsUseCase(fetchprofiledetails: gi<Profilerepos>());
    // });

    gi.registerLazySingleton<Profilerepos>(() {
      return Profiledetailsreposimle(
        profiledatailsremote: gi<Profiledatailsremote>(),
        networkInfo: gi<NetworkInfo>(),
      );
    });
    gi.registerLazySingleton<VerifyOtpCubit>(
      () => VerifyOtpCubit(gi<VerifyOtpUseCase>()),
    );

    //usecases
    gi.registerLazySingleton<RegisterUseCase>(
      () => RegisterUseCase(repository: gi<AuthRepository>()),
    );
    // repos
    gi.registerLazySingleton<AuthRepository>(
      () => AuthRepoImp(
        remoteDataSource: gi<AuthRemoteDataSource>(),
        networkInfo: gi<NetworkInfo>(),
        local: LocalAuth(),
      ),
    );

    //usecases
    gi.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: gi<AuthRepository>()),
    );

    gi.registerFactory<SignInCubit>(() => SignInCubit(gi<SignInUseCase>()));

    ///notifications

    gi.registerLazySingleton<NotificationDataSource>(
      () => NotificationRemoteDataSourceImp(),
    );

    // repos
    gi.registerLazySingleton<NotificationRepository>(
      () => NotificationRepoImp(
        remoteDataSource: gi<NotificationDataSource>(),
        networkInfo: gi<NetworkInfo>(),
      ),
    );

    //usecases
    gi.registerLazySingleton<NotificationUseCase>(
      () => NotificationUseCase(repository: gi<NotificationRepository>()),
    );

    gi.registerFactory<NotificationCubit>(
      () => NotificationCubit(notificationUseCase: gi<NotificationUseCase>()),
    );
    // 1 Remote Data Source
    gi.registerLazySingleton<Bookingremotedatasource>(
      () => BookingremotedatasourceImp(),
    );

    // 2 Repository  THIS WAS MISSING
    gi.registerLazySingleton<BookingRepos>(
      () => BookingReposimple(
        bookingremotedatasource: gi<Bookingremotedatasource>(),
        networkInfo: NetworkInfoImpl(),
      ),
    );

    gi.registerFactory<GetBookingCubit>(
      () => GetBookingCubit(gi<FetchBookingUseCase>()),
    );

    gi.registerLazySingleton<FetchBookingUseCase>(
      () => FetchBookingUseCase(bookingRepos: gi<BookingRepos>()),
    );
    gi.registerLazySingleton<SelectdateUseCase>(
      () => SelectdateUseCase(selectdaterepos: gi<Selectdatereposimple>()),
    );
    gi.registerLazySingleton<Selectdatereposimple>(
      () => Selectdatereposimple(
        networkInfo: gi<NetworkInfo>(),
        selectdateremote: SelectdateremoteImp(),
      ),
    );
    gi.registerLazySingleton<ProfiledetailsUseCase>(
      () => ProfiledetailsUseCase(
        fetchprofiledetails: gi<Profiledetailsreposimle>(),
      ),
    );
    
    gi.registerLazySingleton<Profiledetailsreposimle>(
      () => Profiledetailsreposimle(
        networkInfo: gi<NetworkInfo>(),
        profiledatailsremote: ProfiledatailsremoteImp(),
      ),
    );

    // 1 Remote Data Source
    // gi.registerLazySingleton<Bookingremotedatasource>(
    //       () => BookingremotedatasourceImp(),
    // );
    // gi.registerLazySingleton<Bookingremotedatasource>(
    //   () => BookingremotedatasourceImp(),
    // );

    // gi.registerLazySingleton<SelectdateUseCase>(
    //   () => SelectdateUseCase(selectdaterepos: gi<Selectdatereposimple>()),
    // );

    // //
    // gi.registerLazySingleton<FetchBookingUseCase>(
    //   () => FetchBookingUseCase(bookingRepos: gi<BookingReposimple>()),
    // );
    // 1️ Remote Data Source
    // gi.registerLazySingleton<Bookingremotedatasource>(
    //   () => BookingremotedatasourceImp(),
    // );

    // 2️ Repository  THIS WAS MISSING
    // gi.registerLazySingleton<BookingRepos>(
    //   () => BookingReposimple(
    //     bookingremotedatasource: gi<Bookingremotedatasource>(),
    //     networkInfo: NetworkInfoImpl(),
    //   ),
    // );

    // gi.registerFactory<GetBookingCubit>(
    //   () => GetBookingCubit(gi<FetchBookingUseCase>()),
    // );

    // gi.registerLazySingleton<FetchBookingUseCase>(
    //   () => FetchBookingUseCase(bookingRepos: gi<BookingReposimple>()),
    // );

    //profile
    gi.registerLazySingleton<ProfileApiService>(() => ProfileApiService());

    gi.registerLazySingleton<ProfileRepository>(
      () => ProfileRepositoryImpl(gi<ProfileApiService>(), gi<NetworkInfo>()),
    );
    gi.registerLazySingleton<GetProfileUseCase>(
      () => GetProfileUseCase(gi<ProfileRepository>()),
    );

    ///settings
    gi.registerLazySingleton<ChangePasswordUseCase>(
      () => ChangePasswordUseCase(gi<ProfileRepository>()),
    );
    gi.registerLazySingleton<DeleteAccountUseCase>(
      () => DeleteAccountUseCase(gi<ProfileRepository>()),
    );

    gi.registerFactory<SettingsCubit>(
      () => SettingsCubit(
        changePasswordUseCase: gi<ChangePasswordUseCase>(),
        deleteAccountUseCase: gi<DeleteAccountUseCase>(),
      ),
    );
    gi.registerLazySingleton<LogOutUseCase>(
      () => LogOutUseCase(profileRepository: gi<ProfileRepository>()),
    );
    // gi.registerFactory<ProfileCubit>(
    //   () => ProfileCubit(
    //     getProfileUseCase: gi<GetProfileUseCase>(),
    //     logOutUseCase: gi<LogOutUseCase>(),
    //   ),
    // );
  }
}
