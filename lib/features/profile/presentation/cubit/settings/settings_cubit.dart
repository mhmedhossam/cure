import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../domain/entities/change_password_param.dart';
import '../../../domain/usecases/change_password_use_case.dart';
import '../../../domain/usecases/delete_account_usse_case.dart';

part 'settings_state.dart';
class SettingsCubit extends Cubit<SettingsState> {
  final ChangePasswordUseCase changePasswordUseCase;
  final DeleteAccountUseCase deleteAccountUseCase;

  SettingsCubit({
    required this.changePasswordUseCase,
    required this.deleteAccountUseCase,
  }) : super(SettingsInitial());

  // Change Password Logic
  Future<void> changePassword(ChangePasswordParam param) async {
    emit(SettingsLoading());

    final result = await changePasswordUseCase(param);

    result.fold(
          (failure) => emit(SettingsError(failure.message)),
          (_) => emit(SettingsSuccess("Password changed successfully")),
    );
  }

  // Delete Account Logic
  Future<void> deleteAccount() async {
    emit(SettingsLoading());

    final result = await deleteAccountUseCase();

    result.fold(
          (failure) => emit(SettingsError(failure.message)),
          (_) => emit(SettingsSuccess("Account deleted successfully")),
    );
  }
}