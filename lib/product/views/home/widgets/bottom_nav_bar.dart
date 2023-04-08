import 'package:flutter/material.dart';

import 'bottom_app_bar_items.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key, required this.index, required this.tabController,}) : super(key: key);

  final int index;
  final TabController tabController;

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  late int index;
  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState(); 
    index = widget.index;
  }
  
  @override
  void didUpdateWidget(covariant BottomNavBar oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    index = widget.index;
  }

  void _navBarOnTap(int value){
    setState(() {
      index = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return TabBar(
      
      enableFeedback: false,
      automaticIndicatorColorAdjustment: true,
      labelColor: const Color.fromARGB(255, 42, 84, 183),
      unselectedLabelColor: const Color.fromARGB(255, 0, 0, 0),
      dividerColor: Colors.transparent,
      controller: widget.tabController,
      indicatorColor: Colors.transparent,
      tabs: BottomAppBarItems.tabs,
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
    );
  }
}
