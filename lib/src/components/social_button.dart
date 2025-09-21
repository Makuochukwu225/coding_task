import '../src.dart';

class SocialButton extends StatelessWidget {
  final String text;
  final SocialButtonType type;
  final String iconPath;
  final VoidCallback onPressed;

  const SocialButton({
    super.key,
    required this.text,
    required this.iconPath,
    required this.onPressed,
    this.type = SocialButtonType.primary, // Default type
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48.h,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: _getBackgroundColor(context),
          foregroundColor: _getTextColor(),
          padding: EdgeInsets.symmetric(vertical: 12.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
            side: _getBorderSide(),
          ),
          elevation: 0,
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(iconPath, width: 20.w, height: 20.h),
            SizedBox(width: 8.w),
            Text(
              text,
              style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }

  Color _getBackgroundColor(BuildContext context) {
    switch (type) {
      case SocialButtonType.google:
        return Theme.of(context).colorScheme.primary;
      case SocialButtonType.apple:
        return Theme.of(context).colorScheme.secondary;
      case SocialButtonType.email:
        return Colors.transparent;
      case SocialButtonType.primary:
        return AppColors.primaryButton;
    }
  }

  Color _getTextColor() {
    return Colors.white;
  }

  BorderSide _getBorderSide() {
    return type == SocialButtonType.email
        ? BorderSide(color: Colors.grey.shade300, width: 1)
        : BorderSide.none;
  }
}

// Updated enum with default option
enum SocialButtonType {
  google,
  apple,
  email,
  primary, // Default option
}
