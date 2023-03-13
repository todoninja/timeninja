import 'package:flutter/material.dart';
import 'package:timeninja/keys.dart';

class ActiveTrackingCard extends StatefulWidget {
  const ActiveTrackingCard({super.key});

  @override
  State<ActiveTrackingCard> createState() => _ActiveTrackingCardState();
}

class _ActiveTrackingCardState extends State<ActiveTrackingCard>
    with SingleTickerProviderStateMixin {
  late Animation<Color?> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = ColorTween(begin: brandColor, end: brandColor.withAlpha(128))
        .animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(mediumSpacing),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: Column(
          children: [
            ListTile(
              title: const Text(
                '📝 Writing a blog post',
              ),
              subtitle: Text(
                'Started 10:00am',
                style: theme.textTheme.labelLarge
                    ?.copyWith(color: theme.colorScheme.secondary),
              ),
              trailing: const Text(
                '1h 30m',
              ),
            ),
            LinearProgressIndicator(
              value: 1,
              color: animation.value,
            ),
          ],
        ),
      ),
    );
  }
}
