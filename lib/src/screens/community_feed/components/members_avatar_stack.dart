import '../../../src.dart';

class MembersAvatarStack extends StatelessWidget {
  const MembersAvatarStack({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> avatars = [
      'assets/images/avatar_6.png',
      'assets/images/avatar_5.png',
      'assets/images/avatar_4.png',
      'assets/images/avatar_7.png',
      'assets/images/avatar_3.png',
    ];

    // Calculate total width needed for all avatars
    final double totalWidth = (avatars.length - 1) * 16.0.w + 24.w;

    return SizedBox(
      width: totalWidth,
      height: 24.h,
      child: Stack(
        children: avatars.asMap().entries.map((entry) {
          int index = entry.key;
          String url = entry.value;

          return Positioned(
            left: index * 16.0.w,
            child: Container(
              width: 24.w,
              height: 24.h,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage(url),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
