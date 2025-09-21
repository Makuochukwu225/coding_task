import '../../../src.dart';

class PostCard extends StatelessWidget {
  final Map<String, String?> post;
  const PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(post: post),
          PostContent(post: post),
          if (post['media'] != null) PostMedia(post: post),
          PostActions(post: post),
        ],
      ),
    );
  }
}
