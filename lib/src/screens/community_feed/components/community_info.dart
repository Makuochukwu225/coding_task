import '../../../src.dart';

class CommunityInfo extends StatelessWidget {
  const CommunityInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Ekwalé People',
              style: TextStyle(
                color: Theme.of(context).colorScheme.surface,
                fontSize: 22.sp,
                fontWeight: FontWeight.w700,
              ),
            ),
            4.horizontalSpace,
            SvgPicture.asset(
              'assets/icons/verified.svg',
              width: 24.w,
              height: 24.h,
            ),
          ],
        ),
        8.verticalSpace,
        Row(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/icons/nigeria_flag.png',
                  width: 16.w,
                  height: 16.h,
                ),
                8.horizontalSpace,
                Text(
                  'Nigerian',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            8.horizontalSpace,
            Container(
              width: 3.w,
              height: 3.h,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                shape: BoxShape.circle,
              ),
            ),
            6.5.horizontalSpace,
            SvgPicture.asset(
              'assets/icons/users-round.svg',
              width: 16.w,
              height: 16.h,
            ),
            8.horizontalSpace,
            Text(
              'Local',
              style: TextStyle(color: Colors.white, fontSize: 14.sp),
            ),
          ],
        ),
        8.verticalSpace,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                MembersAvatarStack(),
                8.horizontalSpace,
                Text(
                  '170 members',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.surface,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
            ActionButtons(),
          ],
        ),
      ],
    );
  }
}
