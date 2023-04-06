part of "../onboard_view.dart";

class _OnboardCard extends StatelessWidget {
  const _OnboardCard({
    required this.index, required this.onboard,
  });

  final int index;
  final Onboard onboard;

  @override
  Widget build(BuildContext context) {
    return Column(
      verticalDirection: index%2==0 ? VerticalDirection.down : VerticalDirection.up,
      children: [
        Container(
          padding: EdgeInsetsConstants.onboardTextsPadding,
          child: Column(
            children: [
              TitleText(text: onboard.title),
              DescriptionText(text: onboard.description),
            ],
          ),
        ),
        _OnboardImage(imagePath: onboard.imageWithPath),
      ],
    );
  }
}