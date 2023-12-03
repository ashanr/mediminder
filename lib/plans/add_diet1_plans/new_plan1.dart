// import 'dart:math';
import 'package:flutter/material.dart';
import 'package:mediminder/constants.dart';
import 'package:mediminder/navigation/navigationbar.dart';
import 'package:mediminder/plans/add_diet1_plans/diet1.dart';
import 'package:mediminder/plans/add_diet1_plans/errors1.dart';
import 'package:mediminder/plans/add_diet1_plans/new_plan1_bloc.dart';
import 'package:mediminder/plans/global_diet1_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class NewDiet2PlanPage extends StatefulWidget {
  const NewDiet2PlanPage({super.key});

  @override
  State<NewDiet2PlanPage> createState() => _NewDiet2PlanPageState();
}

class _NewDiet2PlanPageState extends State<NewDiet2PlanPage> {
  late TextEditingController day2Controller;
  late TextEditingController brekfast2Controller;
  late TextEditingController lunch2Controller;
  late TextEditingController dinner2Controller;

  late NewPlan2Block _newPlan2Block;
  late GlobalKey<ScaffoldState> _scaffoldDiet2Key;

  @override
  void dispose() {
    super.dispose();
    day2Controller.dispose();
    brekfast2Controller.dispose();
    lunch2Controller.dispose();
    dinner2Controller.dispose();

    // _newPlanBlock.dispose();
  }

  @override
  void initState() {
    super.initState();
    day2Controller = TextEditingController();
    brekfast2Controller = TextEditingController();
    lunch2Controller = TextEditingController();
    dinner2Controller = TextEditingController();

    _newPlan2Block = NewPlan2Block();
    _scaffoldDiet2Key = GlobalKey<ScaffoldState>();
    initializeDiet2ErrorListen();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalDiet2Bloc globalDiet2Bloc =
        Provider.of<GlobalDiet2Bloc>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: kBoxColor,
      key: _scaffoldDiet2Key,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 55,
        backgroundColor: kButtonPrimaryColor,
        title: Text('Add New Diet Plan',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 19.sp,
                fontWeight: FontWeight.w800)),
      ),
      body: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Positioned(
            top: 0,

            left: 0,
            child: Image.asset(
              "assets/images/top.png",
              width: size.width * 0.5,
            ),
            // child: Container(
            //   height: 300,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage("assets/images/3685101.jpg"),
            //       // fit: BoxFit.fill,
            //        ),
            //       ),
            //       // child: Container(
            //       //   color: kButtonColor.withOpacity(.70),
            //       // ),

            // ),
          ),
          Positioned(
            bottom: 0,
            // right: 0,
            left: 0,
            child: Image.asset(
              "assets/images/bottom.png",
              width: size.width * 0.6,
            ),

            // child: Container(
            //   height: 300,
            //   decoration: BoxDecoration(
            //     image: DecorationImage(
            //       image: AssetImage("assets/images/3685101.jpg"),
            //       // fit: BoxFit.fill,
            //        ),
            //       ),
            //       // child: Container(
            //       //   color: kButtonColor.withOpacity(.70),
            //       // ),

            // ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            top: 200,
            width: size.width * 1,
            child: Image.asset(
              "assets/images/Eating healthy food-pana.png",
              fit: BoxFit.fitHeight,
            ),
          ),
          Positioned(
            top: 10,
            bottom: 60,
            child: Container(
              height: 590,
              width: MediaQuery.of(context).size.width - 18,
              margin: const EdgeInsets.symmetric(
                horizontal: 10,
              ),
              // decoration: BoxDecoration(
              //   color: Colors.white,
              //   borderRadius: BorderRadius.circular(15),
              //   boxShadow: [BoxShadow(
              //     color: Colors.black.withOpacity(0.3),
              //     blurRadius: 15,
              //     spreadRadius: 5
              //   ),],

              // ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const LabelTitle2(
                    title: "Day",
                    isRequired: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 10.0,
                      right: 10.0,
                    ),
                    child: TextFormField(
                      // maxLines: 5,
                      // minLines: 3,
                      controller: day2Controller,
                      textCapitalization: TextCapitalization.words,
                      // keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              color: kTextColor, style: BorderStyle.solid),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: kActiveColor,
                          ),
                        ),
                      ),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: kTextColor,
                          ),
                    ),
                  ),
                  const LabelTitle2(
                    title: "Breakfast",
                    isRequired: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 0.0),
                    child: TextFormField(
                      maxLines: 2,
                      minLines: 1,
                      controller: brekfast2Controller,
                      textCapitalization: TextCapitalization.words,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: kTextColor,
                          ),
                    ),
                  ),
                  const LabelTitle2(
                    title: "Lunch",
                    isRequired: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 0.0),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      maxLines: 2,
                      minLines: 1,
                      controller: lunch2Controller,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: kTextColor,
                          ),
                    ),
                  ),
                  const LabelTitle2(
                    title: "Dinner",
                    isRequired: true,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 10.0, top: 0.0),
                    child: TextFormField(
                      textCapitalization: TextCapitalization.words,
                      maxLines: 2,
                      minLines: 1,
                      controller: dinner2Controller,
                      keyboardType: TextInputType.multiline,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            color: kTextColor,
                          ),
                    ),
                  ),
                  // const SizedBox(
                  //   height: 90,
                  // ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                    ),
                    child: SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: TextButton(
                        onPressed: () {
                          String? breakfast2;
                          String? lunch2;
                          String? dinner2;
                          String? day2;

                          if (day2Controller.text == " ") {
                            _newPlan2Block
                                .submitError(Diet2EntryError.diet2Null);
                            return;
                          }
                          if (day2Controller.text != "") {
                            day2 = day2Controller.text;
                          }
                          if (brekfast2Controller.text == " ") {
                            _newPlan2Block
                                .submitError(Diet2EntryError.diet2Null);
                            return;
                          }
                          if (brekfast2Controller.text != "") {
                            breakfast2 = brekfast2Controller.text;
                          }

                          if (lunch2Controller.text == " ") {
                            _newPlan2Block
                                .submitError(Diet2EntryError.diet2Null);
                            return;
                          }
                          if (lunch2Controller.text != "") {
                            lunch2 = lunch2Controller.text;
                          }

                          if (dinner2Controller.text == " ") {
                            _newPlan2Block
                                .submitError(Diet2EntryError.diet2Null);
                            return;
                          }
                          if (dinner2Controller.text != "") {
                            dinner2 = dinner2Controller.text;
                          }

                          for (var diet2 in globalDiet2Bloc.diet2List$!.value) {
                            if (breakfast2 == diet2.breakfast2) {
                              _newPlan2Block
                                  .submitError(Diet2EntryError.diet2Duplicate);
                              return;
                            }
                          }

                          //  List<int> intDietIDs = makeDietIDs(

                          //  );

                          Diet2 newPlanDiet2 = Diet2(
                              breakfast2: breakfast2,
                              lunch2: lunch2,
                              dinner2: dinner2,
                              day2: day2);

                          globalDiet2Bloc.updateDiet2List(newPlanDiet2);

                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             const Diet2SuccessScreen()));
                          Navigator.pushNamed(context, '/diet2success');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: kButtonPrimaryColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                        ),
                        child: Center(
                          child: Text(
                            "Save Data",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    fontSize: 16.sp,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const NavigBar(),
    );
  }

  void initializeDiet2ErrorListen() {
    _newPlan2Block.error2State$!.listen((Diet2EntryError error2) {
      switch (error2) {
        case Diet2EntryError.day2:
          displayDiet2Error("Please Enter Plan's Day");
          break;

        case Diet2EntryError.diet2Null:
          displayDiet2Error("Please Enter Your Meal");
          break;

        case Diet2EntryError.diet2Duplicate:
          displayDiet2Error("Please Enter Your Meal");
          break;

        case Diet2EntryError.breakfast2:
          displayDiet2Error("Please Enter Breakfast Field");
          break;

        case Diet2EntryError.lunch2:
          displayDiet2Error("Please Enter Lunch Field");
          break;

        case Diet2EntryError.dinner2:
          displayDiet2Error("Please Enter Your Dinner Field");
          break;

        default:
      }
    });
  }

  void displayDiet2Error(String error2) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(error2),
        backgroundColor: kActiveColor,
        duration: const Duration(milliseconds: 2000),
      ),
    );
  }

  // List<int> makeDietIDs(double n){
  //   var rng = Random();
  //   List<int> dietIDs =[];
  //   for(int j =0; j<n; j++ ){
  //     dietIDs.add(rng.nextInt(100000000000));
  //   }
  //   return dietIDs;

  // }
}

class LabelTitle2 extends StatelessWidget {
  const LabelTitle2({
    super.key,
    required this.isRequired,
    required this.title,
  });
  final bool isRequired;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 10),
      child: Text.rich(
        TextSpan(
          children: <TextSpan>[
            TextSpan(
              text: title,
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(fontSize: 14.sp, letterSpacing: 1),
            ),
            TextSpan(
              text: isRequired ? " " : " ",
            )
          ],
        ),
      ),
    );
  }
}
