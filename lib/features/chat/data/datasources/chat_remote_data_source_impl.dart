import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/core/services/api/network/dio_provider.dart';
import 'package:round_8_mobile_cure_team3/features/chat/data/datasources/chat_remote_data_source.dart';
import 'package:round_8_mobile_cure_team3/features/chat/data/endpoints.dart';
import 'package:round_8_mobile_cure_team3/features/chat/data/models/conversation_model.dart';

import '../../../../core/di/servies_locator.dart';
import '../../../auth/data/data_sources/local/local_auth.dart';
import '../models/message_model.dart';

class ChatRemoteDataSourceIMpl extends ChatRemoteDataSource {
  final String token = ServiceLocator.gi<LocalAuth>().getToken();
  // final String token = "234|aCV3uPALWTyp5kjnRv9PMX2D53f3nszqEDsSYCk299ec6d7c";

  @override
  Future<List<ConversationModel>> getConversations() async {
    final response = await DioProvider.get(
      Endpoints.getConversation,
      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
    );
    final data = response.data;
    if (data == null) {
      throw ServerFailure("Invalid response from server");
    }
    final List conversationjson = data["data"];
    print("===========================$data");
    return conversationjson.map((e) => ConversationModel.fromJson(e)).toList();
  }

  @override
  Future<List<ConversationModel>> searchConversations(String name) async {
    final response = await DioProvider.get(
      Endpoints.getConversation,
      queryParameters: {'search': name},
      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
    );
    final data = response.data;
    if (data == null) {
      throw ServerFailure("Invalid response from server");
    }

    final List conversationjson = data["data"];

    return conversationjson.map((e) => ConversationModel.fromJson(e)).toList();
  }

  @override
  Future<List<ConversationModel>> unreadConversations() async {
    final response = await DioProvider.get(
      Endpoints.getConversation,
      queryParameters: {'type': 'unread'},
      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
    );
    final data = response.data;
    if (data == null) {
      throw ServerFailure("Invalid response from server");
    }

    final List unreadConversations = data["data"];

    return unreadConversations
        .map((e) => ConversationModel.fromJson(e))
        .toList();
  }

  @override
  Future<Map<String, dynamic>> startConversation(int userId) async {
    final response = await DioProvider.post(
      Endpoints.startConversation,
      data: {"doctor_id": userId},
      headres: {"Authorization": "Bearer $token"},
    );
    print(response.data);
    final data = response.data;

    if (data == null || data["data"] == null) {
      throw ServerFailure("Invalid response from server");
    }
    return data;
    // final List conversationJson = data["data"];
    // return conversationJson.map((e) => ConversationModel.fromJson(e)).toList();
  }

  @override
  Future<List<MessageModel>> getConversationMessages(int conversationId) async {
    log(token);

    final response = await DioProvider.get(
      '${Endpoints.getConversation}/$conversationId',
      headers: {"Authorization": "Bearer $token", "Accept": "application/json"},
    );

    final List messages = response.data?['data'];

    return messages.map((e) => MessageModel.fromJson(e)).toList();
  }

  @override
  Future<MessageModel> sendMessage({
    required int conversationId,
    required String body,
  }) async {
    log(token);

    final response = await DioProvider.post(
      '/api/conversations/$conversationId/messages',
      data: {"conversation_id": conversationId, "body": body, "type": "text"},
      headres: {"Authorization": "Bearer $token", "Accept": "application/json"},
    );

    return MessageModel.fromJson(response.data?['data']);
  }

  @override
  Future<ConversationModel> toggleFavorite(int conversationId) async {
    final response = await DioProvider.patch(
      '/api/conversations/$conversationId/favorite',
    );
    return ConversationModel.fromJson(response.data ?? {});
  }

  @override
  Future<MessageModel> sendFileMessage({
    required int conversationId,
    required String body,
    String? filePath,
  }) async {
    final formData = FormData.fromMap({
      'body': body,
      if (filePath != null)
        'attachment': await MultipartFile.fromFile(
          filePath,
          filename: filePath.split('/').last,
        ),
    });

    final response = await DioProvider.post(
      '/api/conversations/$conversationId/messages',
      headres: {"Authorization": "Bearer $token", "Accept": "application/json"},

      data: formData,
    );

    return MessageModel.fromJson(response.data?['data']);
  }
}
