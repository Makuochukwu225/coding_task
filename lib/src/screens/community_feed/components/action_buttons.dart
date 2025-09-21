import '../../../src.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
              border: Border.all(color: Color(0xff7a5af8).withAlpha(10)),
          ),
          child: SvgPicture.asset('assets/icons/user-round-plus.svg'),
        ),
        SizedBox(width: 8.w),
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(color: Color(0xff7a5af8).withAlpha(10)),
          ),
          child: SvgPicture.asset('assets/icons/info.svg'),
        ),
        SizedBox(width: 8.w),
        Container(
          // width: 36.w,
          // height: 36.h,
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: AppColors.secondaryButton,
            shape: BoxShape.circle,
          ),
          child: SvgPicture.asset('assets/icons/settings-2.svg'),
        ),
      ],
    );
  }
}
