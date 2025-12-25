part of 'settings_cubit.dart';

@immutable
abstract class SettingsState {}

class SettingsInitial extends SettingsState {}

class SettingsLoading extends SettingsState {}

// Success state (can pass a success message if needed)
class SettingsSuccess extends SettingsState {
  final String message;
  SettingsSuccess(this.message);
}

// Error state
class SettingsError extends SettingsState {
  final String message;
  SettingsError(this.message);
}