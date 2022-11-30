import 'package:flutter/material.dart';

import '../shared/exports.dart';

class Discover extends StatefulWidget {
  const Discover({Key? key}) : super(key: key);

  @override
  State<Discover> createState() => _DiscoverState();
}

class _DiscoverState extends State<Discover> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        color: Colors.white,
        child: ListView(
          children: [
            InkWell(
              onTap: () => _launchURL('https://www.adesuaonline.net/home'),
              child: const DiscoverMore(
                info: 'Discover more on your favorite Subjects',
                url: ' Visit AdesuaOnline.net',
              ),
            ),
            InkWell(
              onTap: () => _launchURL('https://icampusgh.com/login/index.php'),
              child: const DiscoverMore(
                info: 'View Different Courses',
                url: ' Checkout icampusgh',
              ),
            ),
            InkWell(
              onTap: () => _launchURL('https://www.udemy.com/courses/free/'),
              child: const DiscoverMore(
                info: 'Need free courses?',
                url: 'Udemy offers free courses',
              ),
            ),
            InkWell(
              onTap: () => _launchURL('https://www.skillshare.com/en/'),
              child: const DiscoverMore(
                info: 'Learn new skills ',
                url: 'Skillshare is here to help',
              ),
            ),
            InkWell(
              onTap: () => _launchURL(
                  'https://www.blackboard.com/en-eu/teaching-learning/learning-management/blackboard-learn'),
              child: const DiscoverMore(
                info: 'Explore variety of courses',
                url: 'Learn with Blackboard',
              ),
            ),
            InkWell(
              onTap: () => _launchURL('https://moodle.org/'),
              child: const DiscoverMore(
                info: 'Learn more, Be more',
                url: 'Moodle.org/',
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchURL(String link) async {
    if (await canLaunchUrl(Uri.parse(link))) {
      await launchUrl(Uri.parse(link));
    } else {
      throw 'Could not launch $link';
    }
  }
}
