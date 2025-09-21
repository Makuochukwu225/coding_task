import '../../../src.dart';

class PostActions extends StatelessWidget {
  final Map<String, String?> post;
  const PostActions({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.w),
      child: Row(
        children: [
          PostActionButton(
            icon: 'assets/icons/heart.svg',
            text: 'Like',
            onTap: () {},
          ),
          SizedBox(width: 24.w),
          PostActionButton(
            icon: 'assets/icons/message-square.svg',
            text: 'Comment',
            onTap: () {},
          ),
          Spacer(),
          PostActionButton(
            icon: 'assets/icons/send.svg',
            text: 'Share',
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
