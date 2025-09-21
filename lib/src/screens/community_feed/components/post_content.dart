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
                wordSpacing: 1.8,
                color: AppColors.textPurple,
                fontWeight: FontWeight.w400,
                height: 1.4,
              ),
              children: [
                TextSpan(
                  text: post['content']!,
                  style: TextStyle(fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          12.verticalSpace,
        ],
      ),
    );
  }
}
