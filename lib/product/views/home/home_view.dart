import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jam_architecture/product/constants/image_constants_enum.dart';
import 'package:jam_architecture/product/constants/project_colors.dart';
import 'package:jam_architecture/product/views/home/explore/explore_view.dart';
import 'package:jam_architecture/product/views/home/explore/profile_view.dart';
import 'package:jam_architecture/product/views/home/widgets/bottom_app_bar_items.dart';
import 'package:jam_architecture/product/views/home/widgets/bottom_nav_bar.dart';
import 'package:jam_architecture/repositories/skill_repository.dart';

@RoutePage() 
class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();

}

class _HomeViewState extends ConsumerState<HomeView> with TickerProviderStateMixin{

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: BottomAppBarItems.tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: ProjectColors.canvasColor,
        toolbarHeight: 65,
        title: Container(
          child: Image.asset(ImageConstants.logo.toPath,width: 115
        )
      )),
          body: TabBarView(
            controller: tabController,
            children: const [
              ExploreView(),
              ProfileView()
            ],
          ),
          bottomNavigationBar: BottomNavBar(index: tabController.index, tabController: tabController),
        floatingActionButton: FloatingActionButton(onPressed: (){
          ref.read(skillRepositoryNotifer).getAllSkills();
          /* context.navigateTo(const AddProjectRoute()); */
        }, child: const Icon(Icons.add,color: Colors.white),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      );
  }
}
