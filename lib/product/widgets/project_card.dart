import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jam_architecture/models/project.dart';
import 'package:kartal/kartal.dart';

import '../../app/app_router.dart';
import '../constants/color_constants.dart';
import '../constants/image_constants_enum.dart';

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
                child: 
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: 
                  project.image.isNotNullOrNoEmpty?
                Image.network(project.image!, fit: BoxFit.cover,)
                : Image.asset(ImageConstants.logo.toPath, fit: BoxFit.cover,)
                )
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