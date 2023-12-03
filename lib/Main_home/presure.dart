import 'package:flutter/material.dart';
import 'package:mediminder/constants.dart';
import 'package:mediminder/navigation/navigationbar.dart';
// import 'package:mediminder/widgets/labled_text_field.dart';
import 'package:sizer/sizer.dart';

class Presure extends StatefulWidget {
  const Presure({super.key});

  @override
  // _PresureyState createState() => _PresureyState();
  State<Presure> createState() => _PresureyState();
}

class _PresureyState extends State<Presure> {
  int pressurevalue = 0;
  String pressureoutput = '';
  TextEditingController pressurevaluecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 55,
        backgroundColor: kButtonPrimaryColor,
        title: Text('Pressure',
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
                      height: 20,
                    ),
                    Text(
                      "Enter Your Pressure Level",
                      style: Theme.of(context).textTheme.labelMedium!.copyWith(
                          fontSize: 23,
                          color: kButtonPrimaryColor,
                          fontWeight: FontWeight.w600,
                          letterSpacing: 1),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      child: TextField(
                        controller: pressurevaluecontroller,
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: "Pressure level",
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
                          pressurevalue = int.parse(value);
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
                            pressureoutput = '';
                          });
                          if (pressurevalue < 90) {
                            setState(() {
                              pressureoutput =
                                  '$pressureoutput  Your Pressure is Low';
                            });
                          }
                          if (pressurevalue >= 90 && pressurevalue <= 120) {
                            setState(() {
                              pressureoutput =
                                  '$pressureoutput  Your Pressure is Normal';
                            });
                          }
                          if (pressurevalue > 120 && pressurevalue <= 129) {
                            setState(() {
                              pressureoutput =
                                  '$pressureoutput  Your Pressure is At Risk';
                            });
                          }
                          if (pressurevalue >= 130 && pressurevalue <= 139) {
                            setState(() {
                              pressureoutput =
                                  '$pressureoutput  Your Pressure is  High \n (Hipertension Stage 1)';
                            });
                          }
                          if (pressurevalue >= 140 && pressurevalue <= 179) {
                            setState(() {
                              pressureoutput =
                                  '$pressureoutput  Your Pressure is  High \n (Hipertension Stage 2)';
                            });
                          }
                          if (pressurevalue >= 180) {
                            setState(() {
                              pressureoutput =
                                  '$pressureoutput Your Pressure is Too High \n Imediately meat your doctor';
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
                            pressureoutput,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                color: kTextColor, fontSize: 20),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Center(
                      child: GestureDetector(
                        child: SizedBox(
                          width: double.infinity,
                          height: 50.0,
                          child: ElevatedButton(
                            onPressed: () {
                              setState(() {
                                pressureoutput = '';
                                pressurevaluecontroller.text = '';
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
              ))
        ],
      ),
      bottomNavigationBar: const NavigBar(),
    );
  }
}
