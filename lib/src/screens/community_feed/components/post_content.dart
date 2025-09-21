import '../../../src.dart';

class PostContent extends StatelessWidget {
  final Map<String, String?> post;
  const PostContent({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              style: TextStyle(
                fontSize: 15.sp,
                color: AppColors.textPurple,
                height: 1.4,
              ),
              children: [
                TextSpan(
                  text: post['content']!,
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          SizedBox(height: 16.h),
        ],
      ),
    );
  }
}
