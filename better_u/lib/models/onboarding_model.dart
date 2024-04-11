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
      image: 'images/intro-pic1.png',
      title: 'Build Your Health',
      description: 'Starting a Healty life? Why Not!',
    ),
    OnboardingContent(
      image: 'images/intro-pic2.png',
      title: 'Transform Your Body',
      description: 'Feel the difference, be your BEST SELF!',
    ),
    OnboardingContent(
      image: 'images/intro-pic3.png',
      title: 'Get Started Now!',
      description: 'Train with us, Reach your GOALS!',
    ),
  ];