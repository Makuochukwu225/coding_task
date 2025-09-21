import '../../../src.dart';

class PostHeader extends StatelessWidget {
  final Map<String, String?> post;
  const PostHeader({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.h, vertical: 12.h),
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
          8.horizontalSpace,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      post['username']!,
                      style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textPurple,
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Icon(Icons.verified, color: Colors.blue, size: 16.w),
                    SizedBox(width: 8.w),
                    Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        left: 6.w,
                        right: 6.w,
                        bottom: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.iconPurple.withAlpha(25),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Text(
                        post['role']!,
                        style: TextStyle(
                          fontSize: 8.sp,
                          color: AppColors.textPurple,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 2.h),
                Text(
                  post['timeAgo']!,
                  style: TextStyle(
                    fontSize: 11.sp,
                    color: AppColors.textPurple,
                    fontWeight: FontWeight.w400,
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
