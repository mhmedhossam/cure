import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:round_8_mobile_cure_team3/core/error/failure.dart';
import 'package:round_8_mobile_cure_team3/core/services/api/network/network_info.dart';

import 'package:round_8_mobile_cure_team3/features/chat/data/models/conversation_model.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/entities/conversation.dart';
import 'package:round_8_mobile_cure_team3/features/chat/domain/entities/message_entity.dart';

import '../../../../core/error/error_handler.dart';
import '../../domain/repositories/chat_repository.dart';
import '../datasources/chat_remote_data_source.dart';

class ChatRepositoryImpl implements ChatRepository {
  final ChatRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  ChatRepositoryImpl(this.remoteDataSource, {required this.networkInfo});

  @override
  Future<Either<Failure, List<ConversationEntity>>> getConversations() async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }
    try {
      final conversations = await remoteDataSource.getConversations();
      return right(conversations);
    } catch (e) {
      final failure = ErrorHandler.handle(e);
      return Left(failure);
    }
  }

  @override
  Future<Either<Failure, List<ConversationEntity>>> searchConversations(
    String name,
  ) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }
    try {
      final conversations = await remoteDataSource.searchConversations(name);
      print(conversations);

      return right(conversations);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<ConversationEntity>>> getUnreadConversations(
    String unread,
  ) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }
    try {
      final unreadConversation = await remoteDataSource.unreadConversations();
      return right(unreadConversation);
    } catch (e) {
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, Map<String, dynamic>>> startConversation(
    int userId,
  ) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }
    try {
      final conversation = await remoteDataSource.startConversation(userId);
      print(conversation);
      return right(conversation);
    } catch (e) {
      print(e);
      return left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, List<MessageEntity>>> getConversationMessages(
    int conversationId,
  ) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }

    try {
      final messages = await remoteDataSource.getConversationMessages(
        conversationId,
      );

      return Right(messages);
    } catch (e) {
      print(e.toString());
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> sendMessage({
    required int conversationId,
    required String body,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }

    try {
      final message = await remoteDataSource.sendMessage(
        conversationId: conversationId,
        body: body,
      );
      return Right(message);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, ConversationEntity>> toggleFavorite(
    int conversationId,
  ) async {
    try {
      final result = await remoteDataSource.toggleFavorite(conversationId);
      return Right(result);
    } catch (e) {
      return Left(ErrorHandler.handle(e));
    }
  }

  @override
  Future<Either<Failure, MessageEntity>> sendFileMessage({
    required int conversationId,
    required String body,
    String? filePath,
  }) async {
    if (!await networkInfo.isConnected) {
      return Left(NetworkFailure());
    }

    try {
      final message = await remoteDataSource.sendFileMessage(
        conversationId: conversationId,
        body: body,
        filePath: filePath,
      );
      return Right(message);
    } catch (e) {
      if (e is DioException) {
        print(e.response?.statusCode);
        print(e.message);
      }
      return Left(ErrorHandler.handle(e));
    }
  }
}
