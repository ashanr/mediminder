import 'package:flutter/material.dart';
import 'package:mediminder/constants.dart';
import 'package:mediminder/navigation/navigationbar.dart';
import 'package:mediminder/plans/add_diet1_plans/diet1.dart';
import 'package:mediminder/plans/global_diet1_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Diet2Details extends StatefulWidget {
  const Diet2Details({super.key, required this.diet2});
  final Diet2 diet2;
  @override
  State<Diet2Details> createState() => _Diet2DetailsState();
}

class _Diet2DetailsState extends State<Diet2Details> {
  @override
  Widget build(BuildContext context) {
    final GlobalDiet2Bloc _globalDiet2Bloc =
        Provider.of<GlobalDiet2Bloc>(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 50,
        backgroundColor: kButtonPrimaryColor,
        title: Text("Your Plan",
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 19.sp,
                fontWeight: FontWeight.w800)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // DetailSection(),
            ExtendedDiet2Selection(
              diet2: widget.diet2,
            ),
            const Spacer(),

            SizedBox(
              width: 400,
              height: 50,
              child: TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: kButtonPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  onPressed: () {
                    openDiet2AlertBox(context, _globalDiet2Bloc);
                  },
                  child: Text(
                    "Delete",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  )),
            ),

            const SizedBox(
              height: 20,
            )

            //  Positioned(
            // bottom: 0,
            //     right: 0,
            //     top: 80,
            //     child: Image.asset("assets/images/Eating healthy food-pana.png",),
            //     width: 10,

            // ),
          ],
        ),
      ),
      bottomNavigationBar: const NavigBar(),
    );
  }

  openDiet2AlertBox(BuildContext context, GlobalDiet2Bloc _globalDiet2Bloc) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: kScaffoldColor,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
          ),
          contentPadding: const EdgeInsets.only(top: 1),
          title: Text(
            "Delete This Diet Plan?",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                "Cancel",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: kOtherColor, fontSize: 13.sp),
              ),
            ),
            TextButton(
              onPressed: () {
                _globalDiet2Bloc.removedDiet2(widget.diet2);
                Navigator.popUntil(context, ModalRoute.withName('/dietplans'));
              },
              child: Text(
                "OK",
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(color: kOtherColor, fontSize: 13.sp),
              ),
            ),
          ],
        );
      },
    );
  }
}

// class DetailSection extends StatelessWidget {
//   const DetailSection({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         DietInfoTab(dietFieldTitle: "Breakfast", dietFieldInfo: "carrot"),
//       ],
//     );
//   }
// }

// class DietInfoTab extends StatelessWidget {
//   const DietInfoTab(
//       {super.key, required this.dietFieldTitle, required this.dietFieldInfo});
//   final String dietFieldTitle;
//   final String dietFieldInfo;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             dietFieldTitle,
//             style: Theme.of(context).textTheme.bodyLarge,
//           ),
//           SizedBox(
//             height: 15,
//           ),
//           Text(
//             dietFieldInfo,
//             style: Theme.of(context).textTheme.bodySmall,
//           )
//         ],
//       ),
//     );
//   }
// }

class ExtendedDiet2Selection extends StatelessWidget {
  const ExtendedDiet2Selection({super.key, this.diet2});
  final Diet2? diet2;
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        ExtendedDiet2InfoTab(
            diet2FieldTitle: "Day", diet2FieldInfo: diet2!.day2!),
        Hero(
          tag: diet2!.breakfast2!,
          child: Material(
            color: Colors.transparent,
            child: ExtendedDiet2InfoTab(
                diet2FieldTitle: "Breakfast",
                diet2FieldInfo: diet2!.breakfast2!),
          ),
        ),
        ExtendedDiet2InfoTab(
            diet2FieldTitle: "Lunch", diet2FieldInfo: diet2!.lunch2!),
        ExtendedDiet2InfoTab(
          diet2FieldTitle: "Dinner",
          diet2FieldInfo: diet2!.dinner2!,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(" "),
            Column(
              children: [
                Image.asset(
                  "assets/images/Eating healthy food-pana.png",
                  height: 100,
                  width: 200,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}

class ExtendedDiet2InfoTab extends StatelessWidget {
  const ExtendedDiet2InfoTab(
      {super.key, required this.diet2FieldTitle, required this.diet2FieldInfo});

  final String diet2FieldTitle;
  final String diet2FieldInfo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 2,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 5, left: 10, bottom: 5),
            child: Text(
              diet2FieldTitle,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  // color: kTextColor,
                  ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
              diet2FieldInfo,
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontSize: 13.sp, color: kButtonPrimaryColor
                      // color: kTextColor,
                      ),
            ),
          ),
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text("Dinner",
          //   style: Theme.of(context).textTheme.headlineSmall!.copyWith(
          //     color: kTextColor,
          //   ),
          //   ),
          // ),
        ],
      ),
    );
  }
}
