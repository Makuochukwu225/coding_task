import '../../../src.dart';

class TabNavigationBar extends StatefulWidget {
  const TabNavigationBar({super.key});

  @override
  _TabNavigationBarState createState() => _TabNavigationBarState();
}

class _TabNavigationBarState extends State<TabNavigationBar> {
  int selectedIndex = 0;
  final List<String> tabs = ['Feed', 'Media', 'Events'];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      color: Colors.white,
      child: Row(
        children: tabs.asMap().entries.map((entry) {
          int index = entry.key;
          String tab = entry.value;
          bool isSelected = selectedIndex == index;

          return Expanded(
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedIndex = index;
                });
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    tab,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: isSelected
                          ? AppColors.textPurple
                          : Color(0xFF2C0A84).withAlpha(40),
                    ),
                  ),
                  if (isSelected) ...[
                    4.horizontalSpace,
                    SvgPicture.asset(
                      'assets/icons/chevron-down.svg',
                      colorFilter: ColorFilter.mode(
                        AppColors.textPurple,
                        BlendMode.srcIn,
                      ),
                      width: 16.w,
                      height: 16.h,
                    ),
                  ],
                ],
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
