import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jam_architecture/product/widgets/project_card.dart';

@RoutePage() 
class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const Center(
        child: ProjectCard()
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){}),
    );
  }
}
