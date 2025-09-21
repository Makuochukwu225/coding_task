import '../../src.dart';

const data = [
  {
    'username': 'Anthony',
    'userAvatar': 'assets/images/avatar.png',
    'timeAgo': 'Just now',
    'role': 'Admin',
    'content':
        'Congratulations to @Adekoya for the new whip. Who’s available for a quick spin around the city in my Benzo!!',
    'media': 'assets/images/post_image.png',
  },
  {
    'username': 'Sarafina',
    'userAvatar': 'assets/images/avatar_2.png',
    'timeAgo': '15/08/2025',
    'role': 'Moderator',
    'content':
        'Cheering for every kick, celebrating every goal. 🏆⚽️ Embracing the thrill of the Carabao Cup journey! #FootballFever #CarabaoCupMagic 🎉🚗',
    'media': null,
  },
];

class CommunityFeedScreen extends StatelessWidget {
  const CommunityFeedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CommunityHeader(),
          TabNavigationBar(),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [...data.map((post) => PostCard(post: post))],
            ),
          ),
          WritePostCard(),
          SizedBox(height: 50.h),
        ],
      ),
    );
  }
}
