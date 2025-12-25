class Endpoints {
  static const getConversation = '/api/conversations';
  static const startConversation = '/api/conversations/start';
  static const signIn = '/api/auth/login';
  static const Booking = '/api/bookings';
  static const getsingleDoctor = '/api/doctors/';
  static const register = '/api/auth/register';
  static const verifyOtp = '/api/auth/verify-otp';
  static const resendOtp = '/api/auth/resend-otp';
  static const unreadNotification = '/api/notifications/unread';
  static const notification = '/api/notifications';
  static const changePassword = '/api/profile/change-password';
  static const deleteAccount = '/api/profile/delete';

  static String getConversationUrl({String? search}) {
    if (search != null && search.isNotEmpty) {
      return '$getConversation?search=$search';
    }
    return getConversation;
  }

  static String unreadConversationUrl({String? unread}) {
    if (unread != null && unread.isNotEmpty) {
      return '$getConversation?type=$unread';
    }
    return getConversation;
  }
}
