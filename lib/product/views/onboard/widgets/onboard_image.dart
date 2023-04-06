part of "../onboard_view.dart";

class _OnboardImage extends StatelessWidget {
  const _OnboardImage({
    required this.imagePath,
  });

  final String imagePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 55),
        child: Image.asset(imagePath),
      ),
    );
  }
}