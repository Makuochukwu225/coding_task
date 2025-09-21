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

class CommunityFeedScreen extends StatefulWidget {
  const CommunityFeedScreen({super.key});

  @override
  _CommunityFeedScreenState createState() => _CommunityFeedScreenState();
}

class _CommunityFeedScreenState extends State<CommunityFeedScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Widget _buildCustomTab(String text, int index, {bool hasDropdown = false}) {
    bool isSelected = _selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          _tabController.animateTo(index);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                text,
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w600,
                  color: isSelected ? Color(0xFF6B46C1) : Color(0xFFD1D5DB),
                ),
              ),
              if (isSelected)
                Padding(
                  padding: EdgeInsets.only(left: 0),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: Color(0xFF6B46C1),
                    size: 20,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                    return <Widget>[
                      SliverAppBar(
                        leading: InkWell(
                          onTap: () {
                            context.pop();
                          },
                          child: Opacity(
                            opacity: 0.1,
                            child: Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: AppColors.iconPurple,
                                shape: BoxShape.circle,
                              ),
                              child: SvgPicture.asset(
                                'assets/icons/back_button.svg',
                              ),
                            ),
                          ),
                        ),
                        expandedHeight: 293.0.h,
                        actions: [
                          InkWell(
                            onTap: () {
                              context.pop();
                            },
                            child: SvgPicture.asset(
                              'assets/icons/more-vertical.svg',
                            ),
                          ),
                          16.horizontalSpace,
                        ],
                        floating: false,
                        pinned: true,
                        snap: false,
                        backgroundColor: Colors.white,
                        flexibleSpace: FlexibleSpaceBar(
                          background: CommunityHeader(),
                        ),
                        bottom: PreferredSize(
                          preferredSize: Size.fromHeight(48.h),
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border(
                                bottom: BorderSide(
                                  color: AppColors.borderColor,
                                ),
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                horizontal: 18,
                                vertical: 2,
                              ),
                              child: Row(
                                children: [
                                  _buildCustomTab('Feed', 0, hasDropdown: true),
                                  SizedBox(width: 32),
                                  _buildCustomTab('Media', 1),
                                  SizedBox(width: 32),
                                  _buildCustomTab('Events', 2),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ];
                  },
              body: TabBarView(
                controller: _tabController,
                children: [
                  ListView(
                    padding: EdgeInsets.zero,
                    children: [...data.map((post) => PostCard(post: post))],
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    children: [...data.map((post) => PostCard(post: post))],
                  ),
                  ListView(
                    padding: EdgeInsets.zero,
                    children: [...data.map((post) => PostCard(post: post))],
                  ),
                ],
              ),
            ),
          ),
          WritePostCard(),
          25.verticalSpace,
        ],
      ),
    );
  }
}
