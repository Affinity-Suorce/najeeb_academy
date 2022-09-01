import 'package:flutter/material.dart';
import 'package:najeeb_academy/app/widgets/gradient_slider.dart';
import 'package:najeeb_academy/app/widgets/nav_bar.dart';

class TopSection extends StatelessWidget {
  const TopSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LinearGradient gradient =
        LinearGradient(colors: <Color>[Colors.white, Colors.red.shade500]);
    return Column(
      children: [
        Navbar(),
        Container(
          alignment: Alignment.centerRight,
          child: const Text(
            "إبدأ التعلم معنا الآن",
            style: TextStyle(
              height: 1.4,
              color: Colors.white,
              fontSize: 24,
            ),
            textDirection: TextDirection.rtl,
          ),
        ),
        SizedBox(height: MediaQuery.of(context).size.height * 0.035),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 18),
          width: MediaQuery.of(context).size.width * 0.9,
          height: 120,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(13)),
              boxShadow: [
                BoxShadow(
                    color: Color(0x669e9e9e),
                    spreadRadius: 0.5,
                    blurRadius: 7,
                    offset: Offset(2, 6))
              ]),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: const Material(
                        child: Text(
                          'دروسي',
                          textDirection: TextDirection.rtl,
                          style: TextStyle(
                              color: Colors.blue, fontSize: 17, height: 1),
                        ),
                      ),
                    ),
                    const Spacer(),
                    const Text(
                      "تعلمت اليوم",
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                        color: Colors.black54,
                        height: 1,
                        fontSize: 17,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text(
                      "48min",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                          fontWeight: FontWeight.w700),
                    ),
                    Text(
                      "/60min",
                      style: TextStyle(
                        color: Colors.black54,
                        fontSize: 19,
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 10,
                child: SliderTheme(
                    data: SliderThemeData(
                        trackShape: GradientRectSliderTrackShape(
                            gradient: gradient, darkenInactive: false),
                        thumbShape: SliderComponentShape.noThumb,
                        trackHeight: 6),
                    child: Slider(
                      min: 0,
                      max: 10,
                      value: 10,
                      onChanged: (double value) {},
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
