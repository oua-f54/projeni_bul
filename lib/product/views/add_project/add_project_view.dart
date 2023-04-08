import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jam_architecture/product/widgets/custom_back_button.dart';
import 'package:jam_architecture/product/widgets/title_text.dart';
import 'package:kartal/kartal.dart';

@RoutePage()
class AddProjectView extends StatelessWidget {
  const AddProjectView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: const CustomBackButton(),
      ),
      body: SingleChildScrollView(
        child: Container(
          alignment: Alignment.centerLeft,
          width: context.width,
          padding: const EdgeInsets.symmetric(vertical: 50, horizontal: 15),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TitleText(text: "Create New Project"),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: [
                    Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: const TextField(decoration: InputDecoration(label: Text("Project Name")),),
                  ),  
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    child: const TextField(minLines: 4, maxLines: 5,decoration: InputDecoration(labelText: "Project Description"),),
                  ),
                  DropdownButton(
                    value: const DropdownMenuItem(child: Text("deneme")),
                    items: const [DropdownMenuItem(child: Text("deneme")),DropdownMenuItem(child: Text("deneme")),DropdownMenuItem(child: Text("deneme")),], 
                    onChanged: (value){}
                  )
                  ],
                ),
              ),
              ElevatedButton(onPressed: (){}, child: Text("Save", style: context.textTheme.labelLarge,))
            ],
          ),
        ),
      )
    );
  }
}

