import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:reminderpro/theme/text_theme.dart';

class BottomModal extends StatefulWidget {
  const BottomModal({super.key});

  @override
  State<BottomModal> createState() => _BottomModalState();
}

class _BottomModalState extends State<BottomModal> {
  List<String> icons = [
    'assets/icons/alarm-clock.svg',
    'assets/icons/breakfast.svg',
    'assets/icons/Lunch.svg',
    'assets/icons/notepad.svg',
    'assets/icons/online-learning.svg',
    'assets/icons/settings.svg',
    'assets/icons/treadmill.svg',
    'assets/icons/shopping.svg',
    'assets/icons/celeb.svg',
    'assets/icons/travel.svg',
  ];
  final TextEditingController titleController = TextEditingController();
  String selectedIcon = '';

  changeIcon(String newIcon) {
    selectedIcon = newIcon;
  }

  @override
  Widget build(BuildContext context) {
    String selectedIcon = icons.first;
    final screenHeight = MediaQuery.of(context).size.height;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      height: screenHeight / 2,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
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
            child: DropdownButton(
              iconSize: 0,
              elevation: 6,
              value: selectedIcon,
              underline: Container(color: Colors.transparent),
              hint: Padding(
                padding: EdgeInsets.only(left: 10, top: 10),
                child: SvgPicture.asset(
                  icons.first,
                  width: 40,
                  height: 40,
                ),
              ),
              items: icons.map(
                (String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10, top: 10),
                      child: Container(
                        width: 40,
                        child: SvgPicture.asset(value, width: 40, height: 40),
                      ),
                    ),
                  );
                },
              ).toList(),
              onChanged: (v) {
                changeIcon(v!);
              },
              dropdownColor: Theme.of(context).primaryColorLight,
            ),
          ),
          const SizedBox(height: 20),
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Title',
              // textFieldColor: Theme.of(context).primaryColorLight,
              // contentTextColor: Theme.of(context).primaryColorDark,
            ),
          ),
          const SizedBox(height: 25),
          TextFormField(
            controller: titleController,
            decoration: const InputDecoration(
              hintText: 'Title',
              // textFieldColor: Theme.of(context).primaryColorLight,
              // contentTextColor: Theme.of(context).primaryColorDark,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              InkWell(
                onTap: () {
                  // selectDate(context);
                },
                child: TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    // textFieldColor: Theme.of(context).primaryColorLight,
                    // contentTextColor: Theme.of(context).primaryColorDark,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              Text(
                '@',
                style: kSub2HeadTextStyle.copyWith(
                    color: Theme.of(context).primaryColorDark, fontSize: 24),
              ),
              const SizedBox(width: 10),
              InkWell(
                onTap: () {
                  //  selectTime(context);
                },
                child: TextFormField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    hintText: 'Title',
                    // textFieldColor: Theme.of(context).primaryColorLight,
                    // contentTextColor: Theme.of(context).primaryColorDark,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
