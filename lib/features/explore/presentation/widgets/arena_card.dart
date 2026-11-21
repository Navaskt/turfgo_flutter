import 'package:material_ui/material_ui.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../domain/entities/arena.dart';
import 'pitch_artwork.dart';

class ArenaCard extends StatelessWidget {
  const ArenaCard({super.key, required this.arena});
  final Arena arena;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: AppRadius.largeBorder,
        boxShadow: AppShadows.card,
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              PitchArtwork(height: 132, indoor: arena.indoor),
              Positioned(
                left: 9,
                top: 8,
                child: _Tag(
                  label: arena.tag,
                  color: AppColors.success,
                  textColor: AppColors.onSuccess,
                ),
              ),
              Positioned(
                left: 9,
                bottom: 8,
                child: const _Tag(
                  label: 'PITCH QUALITY: PRO',
                  color: Color(0xCC0A0F0D),
                  textColor: AppColors.primary,
                ),
              ),
              Positioned(
                right: 9,
                top: 7,
                child: IconButton(
                  onPressed: () {},
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints.tightFor(
                    width: 28,
                    height: 28,
                  ),
                  icon: const Icon(
                    Icons.bookmark_border,
                    size: 17,
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                right: 9,
                bottom: 8,
                child: const _Tag(
                  label: 'VERIFIED',
                  color: Color(0xCC0A0F0D),
                  textColor: AppColors.textPrimary,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(11, 9, 11, 11),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(Icons.star, color: AppColors.warning, size: 11),
                    const SizedBox(width: 3),
                    Text(
                      arena.rating,
                      style: const TextStyle(
                        fontSize: 8,
                        color: AppColors.textPrimary,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(
                      Icons.near_me,
                      color: AppColors.textSecondary,
                      size: 10,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      arena.distance,
                      style: const TextStyle(
                        fontSize: 8,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        arena.name,
                        style: const TextStyle(
                          fontSize: 14,
                          height: 1.15,
                          color: AppColors.textPrimary,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ),
                    Text(
                      '₹${arena.price}',
                      style: const TextStyle(
                        fontSize: 15,
                        color: AppColors.primary,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    const Text(
                      '/hr',
                      style: TextStyle(
                        fontSize: 8,
                        color: AppColors.textSecondary,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  '${arena.pitchType}  •  ${arena.indoor ? 'Indoor' : 'Outdoor'} Facility',
                  style: const TextStyle(
                    fontSize: 8,
                    color: AppColors.successText,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    Expanded(
                      child: _Specification(
                        label: 'FORMAT',
                        value: arena.format,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: _Specification(
                        label: 'DIMENSIONS',
                        value: arena.dimensions,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Expanded(
                      child: _Specification(
                        label: 'STUD TYPE',
                        value: arena.turf,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 9),
                Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: arena.facilities
                            .map((facility) => _Facility(label: facility))
                            .toList(),
                      ),
                    ),
                    const SizedBox(width: 8),
                    SizedBox(
                      height: 29,
                      child: FilledButton(
                        onPressed: () {},
                        style: FilledButton.styleFrom(
                          minimumSize: const Size(76, 29),
                          padding: const EdgeInsets.symmetric(horizontal: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: AppRadius.smallBorder,
                          ),
                        ),
                        child: const Text(
                          'RESERVE',
                          style: TextStyle(
                            fontSize: 8,
                            fontWeight: FontWeight.w900,
                            letterSpacing: .3,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag({
    required this.label,
    required this.color,
    required this.textColor,
  });
  final String label;
  final Color color;
  final Color textColor;
  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
    decoration: BoxDecoration(
      color: color,
      borderRadius: AppRadius.badgeBorder,
    ),
    child: Text(
      label,
      style: TextStyle(
        fontSize: 7,
        color: textColor,
        fontWeight: FontWeight.w900,
        letterSpacing: .35,
      ),
    ),
  );
}

class _Specification extends StatelessWidget {
  const _Specification({required this.label, required this.value});
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) => Container(
    constraints: const BoxConstraints(minHeight: 43),
    padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 6),
    decoration: BoxDecoration(
      color: AppColors.surfaceHigh,
      borderRadius: AppRadius.smallBorder,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 6,
            color: AppColors.textSecondary,
            fontWeight: FontWeight.w800,
            letterSpacing: .3,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 8,
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w800,
          ),
        ),
      ],
    ),
  );
}

class _Facility extends StatelessWidget {
  const _Facility({required this.label});
  final String label;
  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      const Icon(
        Icons.check_circle_outline,
        size: 9,
        color: AppColors.successText,
      ),
      const SizedBox(width: 3),
      Text(
        label,
        style: const TextStyle(fontSize: 7, color: AppColors.textSecondary),
      ),
    ],
  );
}
