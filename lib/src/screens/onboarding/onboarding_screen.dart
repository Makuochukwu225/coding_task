import '../../src.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  String currentLanguage = 'English (US)';
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Ink(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/onboarding_image.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Positioned(
                top: 40,
                right: 0,
                left: 0,
                child: Center(
                  child: AppLanguageSelector(
                    currentLanguage: currentLanguage,
                    onLanguageSelected: (lang) {
                      setState(() {
                        currentLanguage = lang;
                      });
                    },
                  ),
                ),
              ),
              Positioned(
                bottom: 50,
                left: 24,
                right: 24,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Align(
                      alignment: AlignmentGeometry.topLeft,
                      child: Text(
                        "Connect with \nyour community \nwherever you are",
                        textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 32,
                          fontFamily: 'Aeonik',
                          fontWeight: FontWeight.w700,
                          color: Theme.of(context).colorScheme.onSecondary,
                          height: 1.1,
                          letterSpacing: -1,
                        ),
                      ),
                    ),
                    20.verticalSpace,
                    SocialButton(
                      type: SocialButtonType.apple,
                      text: 'Continue with Apple ID',
                      onPressed: () {
                        context.push(const CommunityFeedScreen());
                      },
                      iconPath: 'assets/icons/ic_baseline-apple.svg',
                    ),
                    8.verticalSpace,
                    SocialButton(
                      type: SocialButtonType.google,
                      text: 'Continue with Google',
                      onPressed: () {
                        context.push(const CommunityFeedScreen());
                      },
                      iconPath: 'assets/icons/mdi_google.svg',
                    ),
                    8.verticalSpace,
                    SocialButton(
                      type: SocialButtonType.email,
                      text: 'Continue with E-mail',
                      onPressed: () {
                        context.push(const CommunityFeedScreen());
                      },
                      iconPath: 'assets/icons/email.svg',
                    ),
                    20.verticalSpace,
                    Text(
                      'By signing up, you accept the Terms of Use and Privacy Policy of how we process your data.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context).colorScheme.surface,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
