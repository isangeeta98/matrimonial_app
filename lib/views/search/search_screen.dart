import 'package:flutter/material.dart';
import 'package:meetmeapp/views/profile_details_screen.dart';

import '../../constants/app_constants.dart';
import '../../elements/column_builder.dart';
import 'search_filter_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final searchList = [
    {
      'image': 'assets/images/users/user2.png',
      'name': 'Krishna Doe',
      'year': '26',
      'height': '5 ft 3 in',
      'city': 'Delhi',
      'country': 'India',
    },
    {
      'image': 'assets/images/users/user12.png',
      'name': 'Rashmika John',
      'year': '25',
      'height': '5 ft 4 in',
      'city': 'Delhi',
      'country': 'India',
    },
    {
      'image': 'assets/images/users/user13.png',
      'name': 'Tina Patel',
      'year': '26',
      'height': '5 ft 4 in',
      'city': 'Gujarat',
      'country': 'India',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Search',
          style: black20BoldTextStyle,
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: fixPadding * 2.0),
        children: [
          searchTextField(),
          heightSpace,
          heightSpace,
          heightSpace,
          heightSpace,
          searches(),
          searchList.isNotEmpty
              ? InkWell(
            onTap: () {
              setState(() {
                searchList.clear();
              });
            },
            child: Text(
              'Clear',
              textAlign: TextAlign.center,
              style: grey12BlackTextStyle,
            ),
          )
              : Column(
            children: [
              const Icon(
                Icons.search,
                color: greyColor,
                size: 30,
              ),
              Text(
                'Search history is empty',
                textAlign: TextAlign.center,
                style: grey13SemiBoldTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
  searchTextField() {
    return SizedBox(
      height: 38,
      child: TextField(
        cursorColor: primaryColor,
        style: black14SemiBoldTextStyle,
        decoration: InputDecoration(
          isDense: true,
          hintText: 'Search profile based on your preferences',
          hintStyle: grey11RegularTextStyle,
          suffixIcon: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchFilterScreen()),
                  );
                },
                child: Image.asset(
                  'assets/images/icons/filter.png',
                  height: 16,
                  width: 16,
                  color: greyColor,
                ),
              ),
              widthSpace,
              widthSpace,
              const Icon(
                Icons.search,
                color: greyColor,
                size: 18,
              ),
            ],
          ),
          border: const UnderlineInputBorder(
            borderSide: BorderSide(color: greyColor),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: greyColor),
          ),
        ),
      ),
    );
  }

  searches() {
    return ColumnBuilder(
      itemCount: searchList.length,
      itemBuilder: (context, index) {
        final item = searchList[index];
        return Column(
          children: [
            InkWell(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ProfileDetailScreen(),
                ),
              ),
              child: Row(
                children: [
                  Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      image: DecorationImage(
                        image: AssetImage(item['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  widthSpace,
                  widthSpace,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item['name']!,
                        style: black14SemiBoldTextStyle,
                      ),
                      Text(
                        '${item['year']} yrs - ${item['height']}',
                        style: grey12RegularTextStyle,
                      ),
                      Text(
                        '${item['city']}, ${item['country']}',
                        style: grey12RegularTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            divider(),
          ],
        );
      },
    );
  }

  divider() {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: fixPadding * 2.0),
      color: greyColor,
      height: 1,
      width: double.infinity,
    );
  }
}
