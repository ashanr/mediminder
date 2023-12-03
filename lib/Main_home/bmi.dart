import 'package:flutter/material.dart';
import 'package:mediminder/constants.dart';
import 'package:mediminder/navigation/navigationbar.dart';
import 'package:sizer/sizer.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({Key? key}) : super(key: key);

  @override
  // _BmiCalculatorState createState() => _BmiCalculatorState();
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  int currentindex = 0;
  String result = "";
  double height = 0;
  double weight = 0;
  double male = 22.5;
  double memale = 21.0;

  // int _currentIndex = 0;

  TextEditingController heightcontroller = TextEditingController();
  TextEditingController weightcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        toolbarHeight: 55,
        backgroundColor: kButtonPrimaryColor,
        title: Text('BMI Calculator',
            style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                color: Colors.white,
                fontSize: 19.sp,
                fontWeight: FontWeight.w800)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 5),
              // Row(
              //   children: [
              //     radioButton("Male  ", kButtonPrimaryColor, 0),
              //     radioButton("Female", kButtonPrimaryColor, 1),
              //   ],
              // ),
              // const SizedBox(
              //   height: 30.0,
              // ),
              const Text(
                "Your height(cm): ",
                style: TextStyle(fontSize: 20, color: kButtonPrimaryColor),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: heightcontroller,
                decoration: InputDecoration(
                  hintText: "Your height in cm,",
                  hintStyle: TextStyle(
                      fontSize: 17, color: kTextColor.withOpacity(0.6)),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const Text(
                "Your Weight(kg): ",
                style: TextStyle(fontSize: 20, color: kButtonPrimaryColor),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                textAlign: TextAlign.center,
                keyboardType: TextInputType.number,
                controller: weightcontroller,
                decoration: InputDecoration(
                  hintText: "Your Weight in kg,",
                  hintStyle: TextStyle(
                      fontSize: 17, color: kTextColor.withOpacity(0.6)),
                  filled: true,
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      height = double.parse(heightcontroller.value.text);
                      weight = double.parse(weightcontroller.value.text);
                    });

                    calculateBmi(height, weight);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kButtonPrimaryColor,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5)),
                  ),
                  child: Text(
                    "Calculate",
                    style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        fontSize: 16.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              const SizedBox(
                width: double.infinity,
                child: Text(
                  "Your BMI Is: ",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: kButtonPrimaryColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 15.0,
              ),
              SizedBox(
                width: double.infinity,
                child: Center(
                  child: Text(
                    result,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                    ),
                  ),
                ),
              ),

              const SizedBox(
                height: 20.0,
              ),
              Center(
                child: GestureDetector(
                  child: SizedBox(
                    width: double.infinity,
                    height: 50.0,
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          heightcontroller.clear();
                          weightcontroller.clear();
                          result = '';
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
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 170,
                width: double.infinity,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                      color: kOtherColor.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(5)),
                  child: const Center(
                    child: Padding(
                      padding: EdgeInsets.only(
                          top: 8, left: 35, right: 20, bottom: 8),
                      child: Column(
                        children: [
                          Text(
                            " Statistics",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: kTextColor,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "    BMI",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: kTextColor),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text(
                                    "       Weight Status",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w900,
                                        color: kTextColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "Below 18.5",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: kTextColor),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text(
                                    "Underweight",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: kTextColor),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "18.5 - 24.9",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: kTextColor),
                                  ),
                                  SizedBox(
                                    width: 95,
                                  ),
                                  Text(
                                    "Healthy Weight",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: kTextColor),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "25.0 - 29.9",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: kTextColor),
                                  ),
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Text(
                                    " Overweight",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: kTextColor),
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "30.0 and Above",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: kTextColor),
                                  ),
                                  SizedBox(
                                    width: 75,
                                  ),
                                  Text(
                                    "Obesity",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w500,
                                        color: kTextColor),
                                  )
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const NavigBar(),
    );
  }

  void calculateBmi(double height, double weight) {
    double finalresult = weight / (height * height / 10000);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

  Widget radioButton(String value, Color color, int index) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 12.0),
        height: 70.0,
        child: ElevatedButton(
          onPressed: () {
            changeIndex(index);
          },
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0)),
            backgroundColor: currentindex == index ? color : Colors.grey[200],
          ),
          child: Text(
            value,
            style: TextStyle(
              color: currentindex == index ? Colors.white : color,
              fontSize: 21.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }

  showwidget() {
    if (male == result) {
      return const Text(
        "You Have a Good BMI",
        style: TextStyle(
          fontSize: 16.0,
          color: kTextColor,
        ),
      );
    } else {
      return const Text("Your BMI is Low!");
    }
  }
}
