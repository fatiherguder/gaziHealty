import 'package:flutter/material.dart';
import 'package:gazihealty/core/components/customButton.dart';
import 'package:gazihealty/core/palette.dart';
import 'package:gazihealty/view/login/login_view.dart';
import 'package:gazihealty/view/register/register_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wave_transition/wave_transition.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage("lib/core/assets/back.jpg"),
                fit: BoxFit.cover)),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.3)),
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
                style: GoogleFonts.rochester(
                  color: Colors.white,
                  fontSize: 26,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomButton(
                        text: "Giriş Yap",
                        color: Palette.dark,
                        onClick: () => {
                          Navigator.push(
                            context,
                            WaveTransition(
                                child: Login(),
                                center: FractionalOffset(0.90, 0.90),
                                duration: Duration(milliseconds: 500)),
                          )
                        },
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 8, 0, 32),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CustomButton(
                          text: "Kayıt Ol",
                          color: Palette.light,
                          onClick: () => {
                            Navigator.push(
                              context,
                              WaveTransition(
                                  child: Register(),
                                  center: FractionalOffset(0.90, 0.90),
                                  duration: Duration(milliseconds: 500)),
                            )
                          },
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Container buildButton({Color? color, required String text}) {
    return Container(
      width: 300,
      height: 40,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(32),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black.withOpacity(0.5),
            blurRadius: 1,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(32)))),
        onPressed: () {},
        child: Text(text),
      ),
    );
  }
}
