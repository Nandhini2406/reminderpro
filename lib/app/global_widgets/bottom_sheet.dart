import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '/app/global_widgets/input_text_feild.dart';
import '/app/global_widgets/proceed_button.dart';
import '/app/modules/home/controllers/home_controller.dart';
import '/app/theme/text_theme.dart';

class BottomSheetContent extends GetView<HomeController> {
  final Function onSubmit;
  final String buttonText;

  BottomSheetContent({required this.onSubmit, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    final keybroadSpace = MediaQuery.of(context).viewInsets.bottom;

    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 30, 16, keybroadSpace + 16),
        // height: Get.height * 0.6,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColorLight,
                borderRadius: BorderRadius.circular(10),
              ),
              child: GetBuilder<HomeController>(
                id: 'dropDownIcon',
                init: HomeController(),
                builder: (controller) {
                  return DropdownButton(
                    iconSize: 0,
                    elevation: 6,
                    value: controller.selectedIcon,
                    underline: Container(color: Colors.transparent),
                    hint: Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: SvgPicture.asset(
                        controller.icons.first,
                        width: 40,
                        height: 40,
                      ),
                    ),
                    items: controller.icons.map(
                      (String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: EdgeInsets.only(left: 10, top: 10),
                            child: Container(
                              width: 40,
                              child: SvgPicture.asset(value,
                                  width: 40, height: 40),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                    onChanged: (value) {
                      controller.changeIcon(value!);
                    },
                    dropdownColor: Theme.of(context).primaryColorLight,
                  );
                },
              ),
            ),
            SizedBox(height: Get.height * 0.03),
            InputTextFormField(
              hintText: 'Title',
              tController: controller.titleController,
              textFeildColor: Theme.of(context).primaryColorLight,
              contentTextColor: Theme.of(context).primaryColorDark,
            ),
            SizedBox(height: 25),
            InputTextFormField(
              hintText: 'Description',
              tController: controller.descController,
              textFeildColor: Theme.of(context).primaryColorLight,
              contentTextColor: Theme.of(context).primaryColorDark,
            ),
            SizedBox(height: Get.height * 0.03),
            Row(
              children: [
                InkWell(
                  onTap: () {
                    controller.selectDate(context);
                  },
                  child: InputTextFormField(
                    hintText: 'Date',
                    tController: controller.dateController,
                    textFeildColor: Theme.of(context).primaryColorLight,
                    contentTextColor: Theme.of(context).primaryColorDark,
                    width: Get.width * 0.36,
                    isEnabled: false,
                  ),
                ),
                SizedBox(width: Get.width * 0.05),
                Text(
                  '@',
                  style: kSub2HeadTextStyle.copyWith(
                      color: Theme.of(context).primaryColorDark, fontSize: 24),
                ),
                SizedBox(width: Get.width * 0.05),
                InkWell(
                  onTap: () {
                    controller.selectTime(context);
                  },
                  child: InputTextFormField(
                    hintText: 'Time',
                    tController: controller.timeController,
                    textFeildColor: Theme.of(context).primaryColorLight,
                    contentTextColor: Theme.of(context).primaryColorDark,
                    width: Get.width * 0.36,
                    isEnabled: false,
                  ),
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.015),
            Container(
              width: Get.width * 0.435,
              child: Row(
                children: [
                  Text(
                    'Repeat Daily',
                    style: kSub2HeadTextStyle.copyWith(
                      color: Theme.of(context).primaryColorDark,
                      fontSize: 16,
                    ),
                  ),
                  GetBuilder<HomeController>(
                    id: 'isRepeat',
                    init: HomeController(),
                    initState: (_) {},
                    builder: (_) {
                      return Switch(
                        value: controller.isRepeat,
                        onChanged: controller.toggleRepeat,
                        activeTrackColor:
                            Theme.of(context).primaryColor.withOpacity(0.5),
                        activeColor: Theme.of(context).primaryColor,
                      );
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: Get.height * 0.02),
            ProceedButton(
              size: Get.size,
              title: buttonText,
              buttonColor: Theme.of(context).primaryColor.withOpacity(0.9),
              onPress: () => onSubmit(),
            ),
          ],
        ),
      ),
    );
  }
}
