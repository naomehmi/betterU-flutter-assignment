import 'package:flutter/material.dart';

class AboutSection extends StatelessWidget {
  const AboutSection ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Us'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/logo/logo.png', height: 200),
              const SizedBox(height: 24),
              // "Get to Know Us!" section
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Get to Know Us!',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Text(
                    'BetterU is an application that is designed to helped you reach your dream weight body goal. We provide a lot of workout programs that you can do at your own home and  it\'s totally FREE! So what you are waiting for?!! Let\'s Fire It Up!',
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // "Know Our Team" section
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Know Our Team',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/member/viona.jpg'), // Replace with your team member image asset path
                          ),
                          SizedBox(height: 8),
                          Text('Viona'),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/member/naomi.jpg'), // Replace with your team member image asset path
                          ),
                          SizedBox(height: 8),
                          Text('Naomi Prisella'),
                        ],
                      ),
                      Column(
                        children: [
                          CircleAvatar(
                            radius: 40,
                            backgroundImage: AssetImage('assets/member/veilind.jpg'), // Replace with your team member image asset path
                          ),
                          SizedBox(height: 8),
                          Text('Veilind Maynius'),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // "Contact Us" section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Contact Us',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Write your message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      // Handle send message action
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 226, 189, 255), // Background color
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                    ),
                    child: const Text(
                      'Send message',
                      style: TextStyle(fontSize: 16, color: Color.fromARGB(255, 139, 93, 175)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
