import 'package:appcubit/cubit/app_cubit_states.dart';
import 'package:appcubit/cubit/app_cubits.dart';
import 'package:appcubit/misc/colors.dart';
import 'package:appcubit/widgets/app_buttons.dart';
import 'package:appcubit/widgets/app_large_text.dart';
import 'package:appcubit/widgets/app_texto.dart';
import 'package:appcubit/widgets/responsive_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailPage extends StatefulWidget {
  DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStarts = 4;
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits, ClubitState>(builder: (_, state) {
      DetailState detailState = state as DetailState;
      return Scaffold(
          body: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                    width: double.maxFinite,
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "http://mark.bslmeiyu.com/uploads/" +
                                    detailState.place.img),
                            fit: BoxFit.cover)))),
            Positioned(
              left: 20,
              top: 50,
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<AppCubits>(context).goHome();
                    },
                    icon: const Icon(Icons.menu),
                    color: Colors.white,
                  ),
                ],
              ),
            ),
            Positioned(
                top: 260,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(
                              text: "${detailState.place.location}",
                              color: Colors.black54.withOpacity(0.5)),
                          AppLargeText(
                              text: "\$ ${detailState.place.price}",
                              color: AppColors.textColor1)
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          Icon(Icons.location_on, color: AppColors.mainColor),
                          const SizedBox(width: 10),
                          AppText(
                              text: "USA, California",
                              color: AppColors.textColor1),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Wrap(
                              children: List.generate(5, (index) {
                            return Icon(Icons.star,
                                color: (index <= detailState.place.stars)
                                    ? AppColors.starColor
                                    : AppColors.textColor2);
                          })),
                          const SizedBox(width: 10),
                          AppText(
                            text: "(4.0)",
                            color: AppColors.textColor2,
                          )
                        ],
                      ),
                      const SizedBox(height: 25),
                      AppLargeText(
                          text: "People",
                          color: Colors.black.withOpacity(0.8),
                          size: 20),
                      const SizedBox(height: 5),
                      AppText(
                          text: "Number of people of your group",
                          color: AppColors.mainColorText),
                      const SizedBox(height: 10),
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 10),
                              child: AppButtons(
                                color: (selectedIndex == index)
                                    ? Colors.white
                                    : Colors.black,
                                backgroundColor: (selectedIndex == index)
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                borderColor: (selectedIndex == index)
                                    ? Colors.black
                                    : AppColors.buttonBackground,
                                size: 50,
                                text: (index + 1).toString(),
                              ),
                            ),
                          );
                        }),
                      ),
                      const SizedBox(height: 10),
                      AppLargeText(
                          text: "Description",
                          color: Colors.black.withOpacity(0.8),
                          size: 20),
                      const SizedBox(height: 20),
                      AppText(
                          color: AppColors.mainColorText,
                          text: detailState.place.description 
                          )
                    ],
                  ),
                )),
            Positioned(
                left: 20,
                bottom: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                      color: AppColors.textColor1,
                      backgroundColor: Colors.white,
                      size: 60,
                      borderColor: AppColors.textColor1,
                      isIcon: true,
                      icon: Icons.favorite_border,
                    ),
                    const SizedBox(width: 20),
                    ResponsiveButton(isResponsive: true)
                  ],
                ))
          ],
        ),
      ));
    });
  }
}
