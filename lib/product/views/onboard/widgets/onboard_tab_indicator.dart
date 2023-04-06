part of '../onboard_view.dart';

class _OnboardTabIndicator extends StatefulWidget {
  const _OnboardTabIndicator({Key? key, required this.index}) : super(key: key);

  final int index;

  @override
  State<_OnboardTabIndicator> createState() => _OnboardTabIndicatorState();
}

class _OnboardTabIndicatorState extends State<_OnboardTabIndicator> with SingleTickerProviderStateMixin{

  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: OnboardItems.datas.length, vsync: this);
  }

  @override
  void didUpdateWidget(covariant _OnboardTabIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(oldWidget.index != widget.index){
      _tabController.animateTo(widget.index);
    }
  }

  @override
  Widget build(BuildContext context) {
    return TabPageSelector(
      controller: _tabController,
      indicatorSize: 8,
      color: ProjectColors.canvasColor,
      selectedColor: ProjectColors.primaryColor,
    );
  }
}


