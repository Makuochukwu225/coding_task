import 'package:coding_task/src/src.dart';

class AppLanguageSelector extends StatelessWidget {
  final String currentLanguage;
  final Function(String) onLanguageSelected;

  const AppLanguageSelector({
    super.key,
    required this.currentLanguage,
    required this.onLanguageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(20.r),
      onTap: () => _showLanguageBottomSheet(context),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(color: Colors.white),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              currentLanguage,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Colors.white,
              ),
            ),
            4.horizontalSpace,
            SvgPicture.asset(
              'assets/icons/chevron-down.svg',
              width: 16.w,
              height: 16.h,
            ),
          ],
        ),
      ),
    );
  }

  void _showLanguageBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (context) => _LanguageBottomSheet(
        currentLanguage: currentLanguage,
        onLanguageSelected: onLanguageSelected,
      ),
    );
  }
}

class _LanguageBottomSheet extends StatelessWidget {
  final String currentLanguage;
  final Function(String) onLanguageSelected;

  const _LanguageBottomSheet({
    required this.currentLanguage,
    required this.onLanguageSelected,
  });

  // Add your available languages here
  final List<Map<String, String>> languages = const [
    {'code': 'US', 'name': 'English'},
    {'code': 'ES', 'name': 'Español'},
    {'code': 'FR', 'name': 'Français'},
    {'code': 'DE', 'name': 'Deutsch'},
    {'code': 'IT', 'name': 'Italiano'},
    {'code': 'PT', 'name': 'Português'},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400.h,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.r),
          topRight: Radius.circular(20.r),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Handle bar
          Container(
            width: 40.w,
            height: 4.h,
            margin: EdgeInsets.symmetric(vertical: 12.h),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),

          // Title
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 8.h),
            decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Select your preferred language',
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.textPurple,
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(20.r),
                  onTap: () => Navigator.pop(context),
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8.w,
                      vertical: 4.h,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/x.svg',
                      width: 20.w,
                      height: 20.h,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Language list
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: languages.length,
              separatorBuilder: (context, index) =>
                  Divider(height: 1, color: AppColors.borderColor),
              itemBuilder: (context, index) {
                final language = languages[index];
                final isSelected =
                    '${language['name']!} (${language['code']!})' ==
                    currentLanguage;

                return ListTile(
                  contentPadding: EdgeInsets.symmetric(horizontal: 20.w),
                  title: Text(
                    language['name']!,
                    style: TextStyle(
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.textPurple,
                    ),
                  ),
                  trailing: CustomRadioButton(isActive: isSelected),

                  // trailing: Theme(
                  //   data: Theme.of(context).copyWith(
                  //     unselectedWidgetColor:
                  //         AppColors.textPurple, // unselected color
                  //   ),
                  //   child: Radio<String>(
                  //     value: '${language['name']!} (${language['code']!})',
                  //     groupValue: currentLanguage,
                  //     activeColor: AppColors.textPurple, // selected color
                  //     onChanged: (value) {
                  //       // 👈 this is required
                  //       onLanguageSelected(value!);
                  //       Navigator.pop(context);
                  //     },
                  //   ),
                  // ),
                  onTap: () {
                    onLanguageSelected(
                      '${language['name']!} (${language['code']!})',
                    );
                    Navigator.pop(context);
                  },
                );
              },
            ),
          ),

          // Bottom padding for safe area
          SizedBox(height: MediaQuery.of(context).padding.bottom + 20.h),
        ],
      ),
    );
  }
}
