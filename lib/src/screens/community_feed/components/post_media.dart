import '../../../src.dart';

class PostMedia extends StatelessWidget {
  final Map<String, String?> post;
  const PostMedia({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200.h,
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.w),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.r),
        image: DecorationImage(
          image: AssetImage('assets/images/post_image.png'),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 8.h,
            left: 8.w,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(70),
                borderRadius: BorderRadius.circular(4.r),
              ),
              child: Text(
                '0:59',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 8.h,
            right: 8.w,
            child: Container(
              // width: 24.w,
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
              height: 24.h,
              decoration: BoxDecoration(
                color: Colors.black.withAlpha(70),
                borderRadius: BorderRadius.circular(4),
              ),
              child: SvgPicture.asset('assets/icons/volume-x.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
