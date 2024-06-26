import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import '/app/global_widgets/user_avatar.dart';
import '/app/modules/profile/controllers/profile_controller.dart';
import '/app/modules/profile/views/account_details_view.dart';
import '/app/modules/settings/controllers/settings_controller.dart';
import '/app/modules/settings/views/settings_view.dart';
import '/app/theme/text_theme.dart';

class ProfileView extends GetView<ProfileController> {
  final SettingsController secController = Get.put(SettingsController());
  final ProfileController fController = Get.put(ProfileController());
  @override
  Widget build(BuildContext context) {
    Size size = Get.size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Profile',
          style: kSubHeadTextStyle.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.only(top: size.height * 0.01),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                height: size.height * 0.18,
                width: size.width * 0.90,
                decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [kDefaultShadow],
                ),
                child: GetBuilder<ProfileController>(
                    id: 7,
                    builder: (_) {
                      return Row(
                        children: [
                          UserAvatar(
                            radius: size.width * 0.085,
                            ismale: fController.isMale,
                          ),
                          SizedBox(width: size.width * 0.045),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${fController.fName} ${fController.lName}',
                                style: kSub2HeadTextStyle.copyWith(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 18,
                                ),
                              ),
                              SizedBox(height: size.height * 0.007),
                              Text(
                                fController.email,
                                style: kSub2HeadTextStyle.copyWith(
                                  color: Theme.of(context).primaryColorDark,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          )
                        ],
                      );
                    })),
            SizedBox(
              height: size.height * 0.07,
            ),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: size.width * 0.08),
              onTap: () {
                Get.to(() => AccountDetailsView());
                fController.preEditUser();
              },
              title: Text(
                'Account',
                style: kSub2HeadTextStyle.copyWith(
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              leading: Icon(
                FontAwesomeIcons.userEdit,
                color: Theme.of(context).primaryColorDark,
                size: size.width * 0.06,
              ),
            ),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: size.width * 0.08),
              onTap: () {
                Get.to(() => SettingsView());
              },
              title: Text(
                'Settings',
                style: kSub2HeadTextStyle.copyWith(
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              leading: Icon(
                FontAwesomeIcons.cog,
                color: Theme.of(context).primaryColorDark,
                size: size.width * 0.06,
              ),
            ),
            ListTile(
              contentPadding:
                  EdgeInsets.symmetric(horizontal: size.width * 0.08),
              title: Text(
                'Log out',
                style: kSub2HeadTextStyle.copyWith(
                  color: Theme.of(context).primaryColorDark,
                ),
              ),
              leading: Icon(
                FontAwesomeIcons.signOutAlt,
                color: Theme.of(context).primaryColorDark,
                size: size.width * 0.06,
              ),
              onTap: () {
                fController.customDialogLogOut(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
