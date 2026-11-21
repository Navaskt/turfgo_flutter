import 'package:material_ui/material_ui.dart';

class AppHeader extends StatefulWidget implements PreferredSizeWidget {
  const AppHeader({
    super.key,
    required this.title,
    this.leadingAvatarUrl,
    this.onAvatarPressed,
    this.onNotificationPressed,
    this.showNotification = false,
  });

  final Widget title;
  final String? leadingAvatarUrl;

  final VoidCallback? onAvatarPressed;
  final VoidCallback? onNotificationPressed;

  final bool showNotification;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  State<AppHeader> createState() => _AppHeaderState();
}

class _AppHeaderState extends State<AppHeader> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      leadingWidth: 56,
      leading: _buildLeading(),
      title: AnimatedSwitcher(
        duration: const Duration(milliseconds: 250),
        child: widget.title,
      ),
      actions: [
        if (widget.showNotification)
          IconButton(
            onPressed: widget.onNotificationPressed,
            icon: const Icon(Icons.notifications_outlined),
          ),
      ],
    );
  }

  Widget? _buildLeading() {
    if (widget.leadingAvatarUrl == null || widget.leadingAvatarUrl!.isEmpty) {
      return null;
    }

    return Padding(
      padding: const EdgeInsets.all(8),
      child: GestureDetector(
        onTap: widget.onAvatarPressed,
        child: ClipOval(
          child: Image.network(
            widget.leadingAvatarUrl!,
            width: 40,
            height: 40,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => _buildAvatarPlaceholder(),
            loadingBuilder: (context, child, progress) {
              if (progress == null) return child;
              return _buildAvatarPlaceholder();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildAvatarPlaceholder() {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
      ),
      child: const Icon(Icons.person_outline),
    );
  }
}
