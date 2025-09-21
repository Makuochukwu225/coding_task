import '../../../src.dart';

class WritePostCard extends StatelessWidget {
  const WritePostCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(color: Colors.grey.withAlpha(50), width: 1),
          bottom: BorderSide(color: Colors.grey.withAlpha(50), width: 1),
        ),
      ),
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          Container(
            width: 36.w,
            height: 36.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/avatar.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Container(
              // height: 40.h,
              padding: EdgeInsets.symmetric(horizontal: 8.2, vertical: 7.2),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Color(0xFFEBE9FE)),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.all(6.w),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFFEBE9FE)),
                      shape: BoxShape.circle,
                    ),
                    child: SvgPicture.asset(
                      'assets/icons/tabler_photo.svg',
                      colorFilter: ColorFilter.mode(
                        Color(0xFFEBE9FE),
                        BlendMode.srcIn,
                      ),
                    ),
                  ),
                  SizedBox(width: 8.w),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Write something...',
                      style: TextStyle(
                        fontSize: 14.sp,
                        color: Color(0xFFEBE9FE),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(width: 12.w),
          Container(
            padding: EdgeInsets.all(13.w),
            decoration: BoxDecoration(
              color: Color(0xFFEBE9FE),
              shape: BoxShape.circle,
            ),

            child: SvgPicture.asset(
              'assets/icons/send.svg',
              colorFilter: ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ],
      ),
    );
  }
}
