import 'package:drag_drop/src/constants/Colors.dart';
import 'package:drag_drop/src/constants/assets.dart';
import 'package:drag_drop/src/constants/levels.dart';
import 'package:drag_drop/src/constants/textstyles.dart';
import 'package:drag_drop/src/game/game_screen.dart';
import 'package:drag_drop/src/leaderboard/leaderboard_screen.dart';
import 'package:drag_drop/src/levels/level_start_screen.dart';
import 'package:drag_drop/src/settings/settings.dart';
import 'package:drag_drop/src/utils/CustomAppBar.dart';
import 'package:drag_drop/src/utils/CustomScaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class GameResultScreen extends StatelessWidget {
  final int level;
  const GameResultScreen({super.key, required this.level});

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      appBar: CustomAppBar(
        leadingIconName: SvgAssets.homeIcon,
        trailingIconName: SvgAssets.settingsIcon,
        onLeadingPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
        },
        title: 'Level $level',
        onTrailingPressed: () {
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context).pop();
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => SettingsScreen()));
        },
      ),
      body: [
        SizedBox(
          height: 18.h,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              SvgAssets.starIcon,
              height: 36.h,
              width: 36.w,
              fit: BoxFit.cover,
            ),
            SizedBox(
              width: 16.5.w,
            ),
            Text(
              '15/24',
              style: w700.size36.copyWith(
                color: CustomColor.primaryColor,
              ),
            )
          ],
        ),
        SizedBox(
          height: 25.h,
        ),
        Text(
          'Amazing!',
          style: w700.size48.copyWith(
            color: Colors.black,
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
        StarsWidget(stars: 1),
        SizedBox(
          height: 25.h,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => GameScreen(
                      level: level + 1,
                      apiResonse: levels[level],
                    ),
                  ),
                );
              },
              child: CustomContainer(
                color: CustomColor.primaryColor,
                height: 56.h,
                width: 342.w,
                textColor: CustomColor.white,
                primaryText: 'Next Level',
                borderColor: CustomColor.primaryColor,
              ),
            ),
            CustomButton(
              width: 342.w,
              color: CustomColor.backgrondBlue,
              textColor: CustomColor.primaryColor,
              primaryText: 'Try Again',
              borderColor: CustomColor.primaryColor,
              svgPath: SvgAssets.resetIcon,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CustomContainer(
                  color: CustomColor.backgrondBlue,
                  height: 43.h,
                  width: 165.w,
                  textColor: CustomColor.primaryColor,
                  primaryText: 'Remove Ads',
                  borderColor: CustomColor.primaryColor,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).pop();
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => LeaderboardScreen()));
                  },
                  child: CustomContainer(
                    color: CustomColor.backgrondBlue,
                    height: 43.h,
                    width: 165.w,
                    textColor: CustomColor.primaryColor,
                    primaryText: 'Leaderboard',
                    borderColor: CustomColor.primaryColor,
                  ),
                ),
              ],
            ),
            CustomButton(
              width: 342.w,
              color: CustomColor.backgrondBlue,
              textColor: CustomColor.primaryColor,
              primaryText: 'Best Time',
              borderColor: CustomColor.primaryColor,
              secondaryText: '05:00',
            ),
            CustomButton(
              width: 342.w,
              color: CustomColor.backgrondBlue,
              textColor: CustomColor.primaryColor,
              primaryText: 'Current Time',
              borderColor: CustomColor.backgrondBlue,
              secondaryText: '05:00',
            ),
          ],
        ),
      ],
    );
  }
}

class StarsWidget extends StatelessWidget {
  final int stars;
  const StarsWidget({
    super.key,
    required this.stars,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 355.w,
      height: 170.h,
      child: Center(
        child: Stack(
          children: [
            Positioned(
              left: 3.w,
              right: 234.w,
              top: 30.h,
              child: SvgPicture.asset(
                stars >= 1 ? SvgAssets.starIcon : SvgAssets.hollowStar,
                height: 105.w,
                width: 105.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 117.w,
              right: 117.w,
              top: 0.h,
              child: SvgPicture.asset(
                stars >= 2 ? SvgAssets.starIcon : SvgAssets.hollowStar,
                height: 105.w,
                width: 105.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              right: 3.w,
              left: 234.w,
              top: 30.h,
              child: SvgPicture.asset(
                stars >= 3 ? SvgAssets.starIcon : SvgAssets.hollowStar,
                height: 105.w,
                width: 105.h,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              left: 0.w,
              right: 0.w,
              top: 150.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      '< 1 min',
                      style: w700.size18.copyWith(
                        color: (stars >= 1)
                            ? CustomColor.greenTextColor
                            : CustomColor.logOutDangerRed,
                      ),
                    ),
                    Text(
                      '< 45 s',
                      style: w700.size18.copyWith(
                        color: (stars >= 2)
                            ? CustomColor.greenTextColor
                            : CustomColor.logOutDangerRed,
                      ),
                    ),
                    Text(
                      '< 30 s',
                      style: w700.size18.copyWith(
                        color: (stars >= 3)
                            ? CustomColor.greenTextColor
                            : CustomColor.logOutDangerRed,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
