import 'package:flutter/material.dart';
import 'package:mediminder/constants.dart';
import 'package:mediminder/navigation/navigationbar.dart';
import 'package:sizer/sizer.dart';

class Diabety extends StatefulWidget {
  const Diabety({super.key});

  @override
  // _DiabetyState createState() => _DiabetyState();
  State<Diabety> createState() => _DiabetyState();
}

class _DiabetyState extends State<Diabety> {
  int sugarvalue = 0;
  String sugaroutput = '';
  TextEditingController sugervaluecontroller = TextEditingController();
  bool isfasting = true;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 55,
        backgroundColor: kButtonPrimaryColor,
        title: Text('Diabetes',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 19.sp,
                fontWeight: FontWeight.w800)),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: Image.asset(
              "assets/images/top.png",
              width: size.width * 0.25,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.asset(
              "assets/images/bottom.png",
              width: size.width * 0.6,
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
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Enter Your Sugar Level",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 23,
                        color: kButtonPrimaryColor,
                        fontWeight: FontWeight.w600,
                        letterSpacing: 1),
                  ),

                  // Row(
                  //   children: [
                  //     OutlinedButton(
                  //       onPressed: () {
                  //         setState(() {
                  //           isfasting = true;
                  //         });
                  //         print(isfasting);
                  //       },
                  //       child: const Text(
                  //         'Fasting',
                  //       ),
                  //     ),
                  //     const SizedBox(
                  //       width: 30,
                  //     ),
                  //     OutlinedButton(
                  //       onPressed: () {
                  //         setState(() {
                  //           isfasting = false;
                  //         });
                  //         print(isfasting);
                  //       },
                  //       child: const Text(
                  //         'After Eating',
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 50,
                    child: TextField(
                      controller: sugervaluecontroller,
                      textAlign: TextAlign.center,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Sugar level",
                        hintStyle: TextStyle(
                            fontSize: 17, color: kTextColor.withOpacity(0.6)),
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (value) {
                        sugarvalue = int.parse(sugervaluecontroller.value.text);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          sugaroutput = '';
                        });

                        if (sugarvalue < 74) {
                          setState(() {
                            sugaroutput =
                                '$sugaroutput Your Sugar Level is Low';
                          });
                        }
                        if (sugarvalue >= 74 && sugarvalue <= 125) {
                          setState(() {
                            sugaroutput =
                                '$sugaroutput Your Sugar Level is Normal';
                          });
                        }

                        if (sugarvalue > 126) {
                          setState(() {
                            sugaroutput =
                                '$sugaroutput Your Sugar Level is High';
                          });
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kButtonPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                      ),
                      child: Text(
                        "View Status",
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
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 150,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          color: kOtherColor.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(5)),
                      child: Center(
                        child: Text(
                          sugaroutput,
                          textAlign: TextAlign.center,
                          style:
                              const TextStyle(color: kTextColor, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: const Center(
                        child: Text(
                          "*These values are valid only after fasting for 10 hours",
                          textAlign: TextAlign.left,
                          style: TextStyle(color: Colors.red, fontSize: 10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Center(
                    child: GestureDetector(
                      child: SizedBox(
                        width: double.infinity,
                        height: 50.0,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              sugaroutput = '';
                              sugervaluecontroller.text = '';
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kButtonPrimaryColor,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5))),
                          child: Text(
                            "Clear All",
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
                  ),
                  const Spacer(),
                  SizedBox(
                    height: 100,
                    width: double.infinity,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: kScaffoldColor.withOpacity(0.5)),
                      child: const Center(
                        child: Text(
                          "*Important Note \n These values may vary sometimes according to the situation and individual factors. So, it's essential to work close with your healthcare provider. Maintain a healthy life style and follow your doctor's advice. ",
                          textAlign: TextAlign.justify,
                          style: TextStyle(color: Colors.black, fontSize: 11),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
      bottomNavigationBar: const NavigBar(),
    );
  }
}
