part of "../onboard_view.dart";

class _OnboardLottie extends StatelessWidget {
  const _OnboardLottie({
    required this.lottiePath,
  });

  final String lottiePath;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 55),
        child: Lottie.asset(lottiePath),
      ),
    );
  }
}