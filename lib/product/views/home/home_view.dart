
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jam_architecture/product/constants/image_constants_enum.dart';
import 'package:jam_architecture/product/constants/project_colors.dart';
import 'package:jam_architecture/product/views/home/explore_view.dart';
import 'package:jam_architecture/product/views/home/profile_view.dart';
import 'package:jam_architecture/product/views/home/widgets/bottom_app_bar_items.dart';
import 'package:jam_architecture/product/views/home/widgets/bottom_nav_bar.dart';
import 'package:jam_architecture/repositories/user_repository.dart';
import 'package:jam_architecture/utilities/custom_dialog.dart';
import 'package:kartal/kartal.dart';

import '../../../app/app_router.dart';

@RoutePage() 
class HomeView extends ConsumerStatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeViewState();

}
class _HomeViewState extends ConsumerState<HomeView> with TickerProviderStateMixin, CustomDialog{

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
              child: Image.asset(ImageConstants.logo.toPath,width: 115),
            ),
            actions: [
              IconButton(onPressed: (){
                customDialogBuilder(context,
                "Oturumu Kapat", 
                Text("Oturumunu sonlandırmak istediğine emin misin?", style: context.textTheme.titleMedium,), 
                ElevatedButton(child: const Text("LOG OUT", style: TextStyle(color: Colors.white),),onPressed: () async{
                  await ref.read(userRepositoryNotifer).auth.signOut();
                  context.replaceRoute(LoginRoute());
                },));
              }, icon: const Icon(Icons.power_settings_new_rounded))
            ],
          ),
          body: TabBarView(
            controller: tabController,
            children: const [
              ExploreView(),
              ProfileView()
            ],
          ),
          bottomNavigationBar: BottomNavBar(index: tabController.index, tabController: tabController),
        floatingActionButton: FloatingActionButton(onPressed: (){
          /* inspect(ref.watch(skillRepositoryNotifer).skillList); */
          context.navigateTo(const AddProjectRoute());
        }, child: const Icon(Icons.add,color: Colors.white),),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        ),
      );
  }
}
