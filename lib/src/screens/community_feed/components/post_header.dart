import '../../../src.dart';

class PostHeader extends StatelessWidget {
  final Map<String, String?> post;
  const PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Container(
            width: 40.w,
            height: 40.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(post['userAvatar']!),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      post['username']!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPurple,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.verified, color: Colors.blue, size: 16.w),
                    SizedBox(width: 8.w),
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 6.w,
                        vertical: 2.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.textPurple.withAlpha(20),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                      child: Text(
                        post['role']!,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.textPurple,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  post['timeAgo']!,
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.textPurple,
                  ),
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            'assets/icons/post_options.svg',
            width: 24.w,
            height: 24.h,
          ),
        ],
      ),
    );
  }
}
