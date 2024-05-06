class OnboardingContent {
  final String image;
  final String title;
  final String description;

  OnboardingContent({
    required this.image,
    required this.title,
    required this.description,
  });
}

List<OnboardingContent> contents = [
    OnboardingContent(
      image: 'assets/intro/intro-pic1.png',
      title: 'Build Your Health',
      description: 'Starting a Healty life? Why Not!',
    ),
    OnboardingContent(
      image: 'assets/intro/intro-pic2.png',
      title: 'Transform Your Body',
      description: 'Feel the difference, be your BEST SELF!',
    ),
    OnboardingContent(
      image: 'assets/intro/intro-pic3.png',
      title: 'Get Started Now!',
      description: 'Train with us, Reach your GOALS!',
    ),
  ];