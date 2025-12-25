import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:round_8_mobile_cure_team3/core/utils/app_colors.dart';

class ChatHeader extends StatelessWidget {
  final bool isSelectionMode;
  final int selectedCount;
  final String title;
  final VoidCallback onClear;

  const ChatHeader({
    super.key,
    required this.isSelectionMode,
    required this.selectedCount,
    required this.title,
    required this.onClear,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        isSelectionMode
            ? Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: AppColors.secondaryColor,
                    ),
                    onPressed: onClear,
                  ),
                  Text(
                    '$selectedCount',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            : Text(
                title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
        isSelectionMode
            ? Row(
                children: [
                  _buildIcon("assets/icons/remove.svg"),
                  _buildIcon("assets/icons/pin.svg"),
                  _buildIcon("assets/icons/mute.svg"),
                  const Icon(Icons.more_vert),
                ],
              )
            : const Icon(Icons.more_vert),
      ],
    );
  }

  Widget _buildIcon(String path) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SvgPicture.asset(path),
    );
  }
}
