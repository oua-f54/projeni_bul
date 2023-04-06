part of "../onboard_view.dart";

class _OnboardBottomBar extends StatefulWidget {
  const _OnboardBottomBar({
    required this.onPressButton, required this.index, required this.isLastItem,
  });

  final int index;
  final VoidCallback onPressButton;
  final bool isLastItem;

  @override
  State<_OnboardBottomBar> createState() => _OnboardBottomBarState();
}

class _OnboardBottomBarState extends State<_OnboardBottomBar> {

  late int _index;

  @override
  void initState() {
    super.initState();
    _index = widget.index;
  }

  @override
  void didUpdateWidget(covariant _OnboardBottomBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.index != oldWidget.index){
      _index = widget.index;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _OnboardTabIndicator(index: _index),
          FloatingActionButton(
            onPressed: () {
              if(widget.isLastItem){
                context.router.replace(const LoginRoute());
              }
              widget.onPressButton();
            },
            shape: const CircleBorder(),
            backgroundColor: ProjectColors.primaryColor,
            child: Text(
              widget.isLastItem? TextConstants.onboardStart : TextConstants.onboardNext,
              style: Theme.of(context).primaryTextTheme.titleSmall,
            ),
          )
        ],
      ),
    );
  }
}