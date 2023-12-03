import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mediminder/constants.dart';
import 'package:mediminder/navigation/navigationbar.dart';
import 'package:mediminder/plans/add_diet1_plans/diet1.dart';
import 'package:mediminder/plans/diet1_details/diet1_details.dart';
import 'package:mediminder/plans/global_diet1_bloc.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class Diet2Plans extends StatefulWidget {
  const Diet2Plans({super.key, this.diet2});
  final Diet2? diet2;

  @override
  State<Diet2Plans> createState() => _Diet2PlansState();
}

class _Diet2PlansState extends State<Diet2Plans> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 55,
        backgroundColor: kButtonPrimaryColor,
        title: Text('Diet Plans',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 19.sp,
                fontWeight: FontWeight.w800)),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            MainContainer2(),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: NextContainer2(),
            ),
          ],
        ),
      ),
      floatingActionButton: InkResponse(
        onTap: () {
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //         builder: (context) => const NewDiet1PlanPage()));
          Navigator.pushNamed(context, '/newdietplan');
        },
        child: const SizedBox(
          width: 70,
          height: 70,
          child: Card(
            color: kButtonPrimaryColor,
            // shape:
            //     BeveledRectangleBorder(borderRadius: BorderRadius.circular(8)),
            child: Icon(
              Icons.add_outlined,
              color: Colors.white,
              size: 60,
            ),
          ),
        ),
      ),
      bottomNavigationBar: const NavigBar(),
    );
  }
}

class MainContainer2 extends StatelessWidget {
  const MainContainer2({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalDiet2Bloc globalDiet2Bloc =
        Provider.of<GlobalDiet2Bloc>(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // SizedBox(
        //   height: 30,
        // ),
        // Text("A Healthy Outside \n Starts from Inside..",
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Text(
            "Stop Wishing \n Start Doing..",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),

        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(
            bottom: 10,
          ),
          child: Text(
            "Welcome to Your diet menu",
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ),
        const SizedBox(
          height: 20,
        ),

        StreamBuilder<List<Diet2>>(
            stream: globalDiet2Bloc.diet2List$,
            builder: (context, diet2snapshot) {
              return Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(
                  bottom: 5,
                ),
                child: Text(
                  !diet2snapshot.hasData
                      ? "1"
                      : diet2snapshot.data!.length.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(color: kButtonPrimaryColor),
                ),
              );
            }),
      ],
    );
  }
}

class NextContainer2 extends StatelessWidget {
  const NextContainer2({super.key});

  @override
  Widget build(BuildContext context) {
    // return Center(
    //   child: Text(
    //     'No Plans Added',
    //     textAlign: TextAlign.center,
    //     style: Theme.of(context).textTheme.bodyLarge,
    //   ),
    // );
    final GlobalDiet2Bloc globalDiet2Bloc =
        Provider.of<GlobalDiet2Bloc>(context);

    return StreamBuilder(
        stream: globalDiet2Bloc.diet2List$,
        builder: (context, diet2snapshot) {
          if (!diet2snapshot.hasData) {
            return Container();
          } else if (diet2snapshot.data!.isEmpty) {
            return Center(
              child: Text(
                "No Diet Plans Added",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            );
          } else {
            return GridView.builder(
              padding: const EdgeInsets.only(
                top: 1,
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemCount: diet2snapshot.data!.length,
              itemBuilder: (context, index) {
                return ImageCard2(diet2: diet2snapshot.data![index]);
              },
            );
          }
        });
  }
}

class ImageCard2 extends StatelessWidget {
  const ImageCard2({super.key, required this.diet2});
  final Diet2 diet2;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.white,
      splashColor: Colors.grey,
      onTap: () {
        // Navigator.push(
        //     context, MaterialPageRoute(builder: (context) => DietDetails()));

        Navigator.of(context).push(PageRouteBuilder<void>(
            pageBuilder: (BuildContext context, Animation<double> animation,
                secondaryAnimation) {
              return AnimatedBuilder(
                  animation: animation,
                  builder: (context, Widget? child) {
                    return Opacity(
                      opacity: animation.value,
                      child: Diet2Details(diet2: diet2),
                    );
                  });
            },
            transitionDuration: const Duration(microseconds: 500)));
      },
      child: Container(
        padding: const EdgeInsets.only(left: 20, top: 10, bottom: 10),
        margin: EdgeInsets.all(1.h),
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: kOtherColor,
          borderRadius: BorderRadius.circular(2.h),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            SvgPicture.asset(
              "assets/icons/Eating healthy food-pana.svg",
              height: 100,
              // color: kButtonColor,
            ),

            const Spacer(),

            Hero(
              tag: diet2.day2!,
              child: Text(
                diet2.day2!,
                overflow: TextOverflow.fade,
                textAlign: TextAlign.start,
                style: Theme.of(context)
                    .textTheme
                    .labelSmall!
                    .copyWith(fontSize: 14.sp),
              ),
            ),
            // Text(
            //   "Day1",
            //   style: Theme.of(context).textTheme.headline4!.copyWith(
            //     color: kTextColor
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
