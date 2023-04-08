import 'package:flutter/material.dart';
import 'package:jam_architecture/product/constants/image_constants_enum.dart';
import 'package:kartal/kartal.dart';

import '../../../widgets/project_card.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          width: context.width,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15),
                width: context.dynamicWidth(0.5),
                child: TextButton(
                  onPressed: (){},
                  child: Image.asset(ImageConstants.defaultPp.toPath)
                )
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(3),
                      child: Text("Erhan", style: context.textTheme.titleLarge,),
                    ),
                    Container(
                      padding: const EdgeInsets.all(3),
                      child: Text("erhangocenn@gmail.com", style: context.textTheme.bodySmall?.copyWith(fontSize: 15),),
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical:15),
                child: Column(
                  children: [
                    SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Text("Your Projects", style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800
                  ),),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 50),
                  child: Row(
                    children: const [
                      ProjectCard(),
                      ProjectCard(),
                      ProjectCard(),
                      ProjectCard(),
                    ],
                  ),
                ),
              ),
                  ],
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
