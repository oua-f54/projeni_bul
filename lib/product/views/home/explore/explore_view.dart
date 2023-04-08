import 'package:flutter/material.dart';
import 'package:jam_architecture/product/constants/color_constants.dart';
import 'package:kartal/kartal.dart';

import '../../../widgets/project_card.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
          child: Container(
              child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      flex: 8,
                      child: Container(
                          padding: const EdgeInsets.only(right: 25),
                          child: TextField(
                            decoration: InputDecoration(
                              contentPadding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
                              suffixIcon: const Icon(Icons.search), 
                              suffixIconColor: ColorConstants.appGreen,
                              label: const Text("Search"),
                              border: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(color: Color.fromARGB(59, 0, 0, 0)),
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(color: Color.fromARGB(59, 0, 0, 0))
                              ),
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(50)),
                                borderSide: BorderSide(color: Color.fromARGB(59, 0, 0, 0))
                              )
                            ),
                          ))),
                  Expanded(
                      flex: 1,
                      child: Container(
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              padding: const EdgeInsets.symmetric(horizontal: 0),
                              fixedSize: const Size(20, 20),
                              side: const BorderSide(color:Color.fromARGB(59, 0, 0, 0) )
                            ),
                            onPressed: () {},
                            child: Center(
                              child: Icon(Icons.sort_outlined,
                                color:  ColorConstants.appGreen,
                              )
                            ),
                          )))
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: (){
                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Comming Soon")));
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        backgroundColor: ColorConstants.appYellow
                      ), 
                      child: Text("Flutter", style: context.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        backgroundColor: ColorConstants.appYellow
                      ), 
                      child: Text("Flutter", style: context.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        backgroundColor: ColorConstants.appYellow
                      ), 
                      child: Text("Flutter", style: context.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        backgroundColor: ColorConstants.appYellow
                      ), 
                      child: Text("Flutter", style: context.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        backgroundColor: ColorConstants.appYellow
                      ), 
                      child: Text("Flutter", style: context.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),
                    )
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: ElevatedButton(
                      onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 22),
                        backgroundColor: ColorConstants.appYellow
                      ), 
                      child: Text("Flutter", style: context.textTheme.titleMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.w500),),
                    )
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
                  child: Text("Popular Projects", style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800
                  ),),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
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
              ),
            Container(
                padding: const EdgeInsets.symmetric(vertical:15),
                child: Column(
                  children: [
                    SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Container(
                  padding: const EdgeInsets.all(15),
                  child: Text("Recent Added", style: context.textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.w800
                  ),),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
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
              ),
            
            
          ],
              ),
            ),
        ));
  }
}


