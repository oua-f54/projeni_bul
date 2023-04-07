import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jam_architecture/product/views/home/explore/explore_view.dart';
import 'package:jam_architecture/product/views/home/explore/profile_view.dart';
import 'package:jam_architecture/product/views/home/widgets/bottom_app_bar_items.dart';
import 'package:jam_architecture/product/views/home/widgets/bottom_nav_bar.dart';

@RoutePage() 
class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> with TickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: BottomAppBarItems.tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(),
          body: TabBarView(
            controller: tabController,
            children: const [
              ExploreView(),
              ProfileView()
            ],
          ),
          bottomNavigationBar: BottomNavBar(index: tabController.index, tabController: tabController),
        floatingActionButton: FloatingActionButton(onPressed: (){}, child: const Icon(Icons.add,color: Colors.white),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      ),
    );
  }
}
