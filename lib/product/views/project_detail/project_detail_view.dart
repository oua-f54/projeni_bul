import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jam_architecture/models/project.dart';
import 'package:jam_architecture/product/constants/text_constants.dart';
import 'package:jam_architecture/product/views/home/explore_view.dart';
import 'package:kartal/kartal.dart';

import '../../constants/image_constants_enum.dart';
import '../../widgets/custom_back_button.dart';
import '../../widgets/primary_elevated_button.dart';

@RoutePage()
class ProjectDetailView extends StatelessWidget {
  const ProjectDetailView({Key? key, required this.project}) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const CustomBackButton(),
        actions: [
          IconButton(icon: const Icon(Icons.favorite_border),onPressed: (){
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(TextConstants.commingSoon)));
          },)
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.center,
          padding: context.onlyTopPaddingLow,
          width: context.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: 
                project.image.isNotNullOrNoEmpty?
                Image.network(project.image!)
                : Image.asset(ImageConstants.logo.toPath)
              ),
              Container(
                padding: context.onlyTopPaddingMedium,
                alignment: Alignment.center, child: Text(project.name??"", style: context.textTheme.headlineLarge,)
              ),
              Container(
                padding: context.verticalPaddingLow,
                child: SingleFilterButton(name: project.skill??"")
              ),
              Container(
                padding: context.onlyBottomPaddingMedium,
                width: context.dynamicWidth(0.9),
                child: Card(
                  child: Container(
                    height: context.dynamicHeight(0.28),
                    padding: context.paddingNormal,
                    child:SingleChildScrollView(
                        child: Text(project.description??"", style: context.textTheme.titleMedium,)
                      
                    )
                    
                    ),
                )
              ),
              
              Container(
                padding: context.paddingLow,
                child: PrimaryElevatedButton(text: "Kayıt Ol", onPressed: (){},)
              )
            ],
          ),
        ),
      )
    );
  }
}
