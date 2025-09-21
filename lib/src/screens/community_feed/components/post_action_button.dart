import '../../../src.dart';

class PostActionButton extends StatelessWidget {
  final String icon;
  final String text;
  final VoidCallback onTap;

  const PostActionButton({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            icon,
            colorFilter: ColorFilter.mode(
              AppColors.textPurple,
              BlendMode.srcIn,
            ),
          ),
          8.horizontalSpace,
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              color: AppColors.textPurple,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
// #2C0A84