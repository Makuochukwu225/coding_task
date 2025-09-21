import '../../../src.dart';

class WritePostCard extends StatelessWidget {
  const WritePostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 72.h,
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.withAlpha(50), width: 1),
          bottom: BorderSide(color: Colors.grey.withAlpha(50), width: 1),
        ),
      ),
      padding: EdgeInsets.all(16.r),
      child: Row(
        children: [
          // Avatar
          Container(
            width: 40.w,
            height: 40.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/avatar.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          8.horizontalSpace,

          // Text input section
          Expanded(
            child: Container(
              height: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 4.2.h, vertical: 4.2),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: const Color(0xFFEBE9FE)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  // Photo icon
                  Container(
                    padding: EdgeInsets.all(4.r),
                    width: 25.6.w,
                    height: 25.6.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFEBE9FE)),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/tabler_photo.svg',
                      width: 12.8.w,
                      height: 12.8.h,
                      colorFilter: const ColorFilter.mode(
                        Color(0xFFEBE9FE),

                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),

                  // Real input field
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        isDense: true,
                        contentPadding: EdgeInsets.zero,
                        border: InputBorder.none,
                        hintText: 'Write something...',
                        hintStyle: TextStyle(
                          fontSize: 14.sp,
                          color: const Color(0xFFEBE9FE),
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      style: TextStyle(fontSize: 14.sp, color: Colors.black),
                    ),
                  ),
                ],
              ),
            ),
          ),

          8.horizontalSpace,

          // Send button
          Container(
            width: 40.w,
            height: 40.w,
            padding: EdgeInsets.all(13.w),
            decoration: const BoxDecoration(
              color: Color(0xFFEBE9FE),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'assets/icons/send.svg',
              colorFilter: const ColorFilter.mode(
                Colors.white,
                BlendMode.srcIn,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
