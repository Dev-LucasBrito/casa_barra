import 'package:app_votacao/core/components/icon/gradient_icon.dart';
import 'package:app_votacao/core/components/text/text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ParticipantePage extends StatelessWidget {
  const ParticipantePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Container(
                height: 200,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/imgs/homem3.png'))),
              ),
              SizedBox(
                height: 200,
                child: Padding(
                  padding: const EdgeInsets.only(right: 21),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText.textSecundary(text: 'Nome: '),
                          AppText.textPrimary(text: 'Mario Roberto'),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText.textSecundary(text: 'Idade: '),
                          AppText.textPrimary(text: '21'),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText.textSecundary(text: 'Cidade: '),
                          AppText.textPrimary(text: 'Brasília - DF'),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText.textSecundary(text: 'Prof: '),
                          AppText.textPrimary(text: 'Influencer'),
                        ],
                      ),
                      const SizedBox(
                        height: 33,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(left: 21, right: 21),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppGradientIcon(
                                FontAwesomeIcons.instagram, 40, true, 45),
                            SizedBox(
                              width: 33,
                            ),
                            Icon(FontAwesomeIcons.tiktok, size: 28),
                            SizedBox(
                              width: 33,
                            ),
                            Icon(
                              FontAwesomeIcons.youtube,
                              size: 40,
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
