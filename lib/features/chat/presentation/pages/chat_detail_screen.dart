import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';
import 'package:round_8_mobile_cure_team3/core/utils/text_styles.dart';
import 'package:round_8_mobile_cure_team3/core/widgets/custom_back_button.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/cubit/send_and_load_message/send_message_state.dart';
import 'package:round_8_mobile_cure_team3/features/chat/presentation/widgets/chat_message_body.dart';

import '../../../../core/di/servies_locator.dart';
import '../cubit/send_and_load_message/send_message_cubit.dart';

class ChatDetailsScreen extends StatefulWidget {
  final String name;
  final int conversationId;

  const ChatDetailsScreen({
    super.key,
    required this.name,
    required this.conversationId,
  });

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  final TextEditingController _messageController = TextEditingController();
  bool isTyping = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          ServiceLocator.gi<MessageCubit>()
            ..loadMessages(widget.conversationId),
      child: Scaffold(
        appBar: _buildAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              /// ================= Messages =================
              BlocBuilder<MessageCubit, MessageState>(
                builder: (context, state) {
                  if (state is MessageLoaded) {
                    return Expanded(
                      child: ChatMessageBody(messages: state.messages),
                    );
                  } else if (state is MessageError) {
                    return Expanded(child: Center(child: Text(state.message)));
                  }
                  return const Expanded(child: SizedBox());
                },
              ),

              /// ================= Input =================
              _buildInput(),
            ],
          ),
        ),
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const CustomBackButton(),
          const Gap(6),
          const CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/Ellipse 1543.png"),
          ),
          const Gap(8),
          Expanded(
            child: Text(
              widget.name,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.title.copyWith(fontSize: 14),
            ),
          ),
        ],
      ),
      actions: [
        SvgPicture.asset("assets/icons/video.svg"),
        const Gap(12),
        SvgPicture.asset("assets/icons/phone.svg"),
        const Gap(6),
        const Icon(Icons.more_vert_outlined),
        const Gap(6),
      ],
    );
  }

  Widget _buildInput() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _messageController,
              onChanged: (value) {
                setState(() => isTyping = value.trim().isNotEmpty);
              },
              decoration: InputDecoration(
                hintText: 'Type a message...',
                suffixIcon: SizedBox(
                  width: 70,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: _pickImageAndSend,
                          child: const Icon(Icons.attachment_outlined),
                        ),
                        const Gap(10),
                        const Icon(Icons.camera_alt_outlined),
                      ],
                    ),
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16),
              ),
            ),
          ),
          const Gap(8),
          CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: IconButton(
              icon: Icon(
                isTyping ? Icons.send : Icons.mic,
                color: AppColors.whiteColor,
              ),
              onPressed: () {
                if (!isTyping) return;
                context.read<MessageCubit>().sendMessage(
                  widget.conversationId,
                  _messageController.text,
                );

                _messageController.clear();
                setState(() => isTyping = false);
              },
            ),
          ),
        ],
      ),
    );
  }

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageAndSend() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 70,
    );

    if (image == null) return;

    context.read<MessageCubit>().sendFileMessage(
      filePath: image.path,
      conversationId: widget.conversationId,
      body: '',
    );
  }
}
