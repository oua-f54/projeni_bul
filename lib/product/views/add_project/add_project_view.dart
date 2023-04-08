import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:jam_architecture/product/constants/color_constants.dart';
import 'package:jam_architecture/product/widgets/custom_back_button.dart';
import 'package:jam_architecture/product/widgets/title_text.dart';
import 'package:kartal/kartal.dart';

@RoutePage()
class AddProjectView extends StatefulWidget {
  const AddProjectView({Key? key}) : super(key: key);

  @override
  State<AddProjectView> createState() => _AddProjectViewState();
}

class _AddProjectViewState extends State<AddProjectView> {
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
                    child: const TextField(minLines: 4, maxLines: 5,decoration: InputDecoration(labelText: "Project Description", alignLabelWithHint: true),),
                  ),
                  
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.only(bottom: 20),
                child: const DropdownButtonExample()
              ),
              ElevatedButton(onPressed: (){setState(() {
                
              });}, child: Text("Save", style: context.textTheme.labelLarge,))
            ],
          ),
        ),
      )
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  const DropdownButtonExample({super.key});

  @override
  State<DropdownButtonExample> createState() => _DropdownButtonExampleState();
}
class _DropdownButtonExampleState extends State<DropdownButtonExample> {

  List<String> list = <String>['One', 'Two', 'Three', 'Four'];
  String? dropdownValue = "One";

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left:8),
      width: context.dynamicWidth(0.5),
        
      decoration: BoxDecoration(border: Border.all(color: ColorConstants.whiteGrey), borderRadius: BorderRadius.circular(8),),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          isExpanded: true,
          value: dropdownValue,
          underline: Container(
            height: 2,
            color: Colors.deepPurpleAccent,
          ),
          onChanged: (value) {
            setState(() {
              dropdownValue = value;
            });
          },
          items: list.map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}