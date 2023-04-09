import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jam_architecture/models/project.dart';
import 'package:kartal/kartal.dart';

import '../../app/app_router.dart';
import '../constants/color_constants.dart';

class ProjectCard extends StatelessWidget {
  const ProjectCard({
    super.key, required this.project,
  });

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(width: 192, height: 90,
                child: Image.network(project.image??"https://firebasestorage.googleapis.com/v0/b/projeni-bul-app.appspot.com/o/Cozum_Kopyas.png?alt=media&token=7f9df94e-7fb0-482f-a452-3895e672ce5a"),
              ),
              Container(
                padding: const EdgeInsets.only(top: 10),
                width: 192, height: 40, 
                child: Text(project.name??"", style: context.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700
                ),),
              ),
              SizedBox(
                width: 192,
                child: Text(project.description??"",maxLines: 2, overflow: TextOverflow.ellipsis),
              ),
              Container(
                alignment: Alignment.centerRight,
                width: 192,
                child: TextButton(child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Go Details", style: TextStyle(
                      color: ColorConstants.appBlue,
                      fontWeight: FontWeight.w700
                    ),),
                    const Icon(Icons.arrow_right)
                  ],
                ), onPressed: (){
                  context.navigateTo(ProjectDetailRoute(project: project));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}