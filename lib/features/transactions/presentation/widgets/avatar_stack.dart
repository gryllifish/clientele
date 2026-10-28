import 'package:clients_app/core/theme/app_colors.dart';
import 'package:clients_app/features/transactions/domain/entities/transaction.dart';
import 'package:flutter/material.dart';

/// Overlapping round client photos, each ringed in ink.
class AvatarStack extends StatelessWidget {
  const AvatarStack({required this.participants, super.key});

  static const _size = 26.0;
  static const _ringWidth = 2.0;
  static const _overlap = 5.0;

  final List<TransactionParticipant> participants;

  @override
  Widget build(BuildContext context) {
    // Decode at display size instead of the full-resolution photo.
    final cacheSize = (_size * MediaQuery.devicePixelRatioOf(context)).round();
    const step = _size - _overlap;

    return SizedBox(
      width: _size + step * (participants.length - 1),
      height: _size,
      child: Stack(
        children: [
          for (final (index, participant) in participants.indexed)
            Positioned(
              left: step * index,
              child: Container(
                width: _size,
                height: _size,
                padding: const EdgeInsets.all(_ringWidth),
                decoration: const BoxDecoration(
                  color: AppColors.ink,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.asset(
                    participant.photoAsset,
                    fit: BoxFit.cover,
                    cacheWidth: cacheSize,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
