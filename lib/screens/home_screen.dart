import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:test_project/controllers/bottom_nav_controller.dart';
import 'package:test_project/controllers/date_controller.dart';
import 'package:test_project/core/app/dimensions.dart';
import 'package:test_project/models/card_details_model.dart';
import 'package:test_project/widgets/custom_card_widget.dart';
import 'package:test_project/widgets/custom_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late ScrollController _scrollController;

  final BottomNavController bottomNavController =
      Get.put(BottomNavController());
  final DateController dateController = Get.put(DateController());
  final DateTime _startDate = DateTime.now().subtract(Duration(days: 30));

  final DateTime _endDate = DateTime.now().add(Duration(days: 30));

  final DateTime _selectedDate = DateTime.now();

  List<DateTime> _generateDates(DateTime start, DateTime end) {
    List<DateTime> dates = [];
    for (int i = 0; start.add(Duration(days: i)).isBefore(end); i++) {
      dates.add(start.add(Duration(days: i)));
    }
    return dates;
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToSelectedDate();
    });
  }

  void _scrollToSelectedDate() {
    int initialIndex = _generateDates(_startDate, _endDate)
        .indexWhere((date) => _isSameDay(date, _selectedDate));
    double offset = initialIndex * (MediaQuery.of(context).size.width / 7 + 16);
    _scrollController.animateTo(
      offset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  bool _isSameDay(DateTime date1, DateTime date2) {
    return date1.year == date2.year &&
        date1.month == date2.month &&
        date1.day == date2.day;
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> dates = _generateDates(_startDate, _endDate);
    String currentDate = DateFormat.yMMMMd('ja').format(_selectedDate);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(12),
          child: Container(
            width: appWidth(context),
            decoration: BoxDecoration(
              color: const Color.fromARGB(80, 208, 202, 202),
              borderRadius: BorderRadius.circular(16),
            ),
            child: TextField(
              cursorColor: Colors.grey,
              textAlign: TextAlign.left,
              decoration: InputDecoration(
                hintText: '北海道, 札幌市',
                hintStyle: TextStyle(color: Colors.black, fontSize: 12.sp),
                border: InputBorder.none,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
              ),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: SvgPicture.asset('assets/icons/filter_icon.svg'),
            onPressed: () {},
          ),
          IconButton(
            icon: SvgPicture.asset('assets/icons/favourite.svg'),
            onPressed: () {},
          ),
          hSizedBox2,
        ],
        bottom: PreferredSize(
            preferredSize: const Size.fromHeight(35),
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              height: appHeight(context) * 0.05,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFFAAA14), Color(0xFFFFD78D)],
                  stops: [0.0, 1],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
              child: Center(
                child: CustomText(
                  size: 14.sp,
                  text: currentDate,
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
            )),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              height: 100,
              child: ListView.builder(
                controller: _scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  DateTime date = dates[index];

                  return Obx(() {
                    bool isSelected =
                        _isSameDay(date, dateController.selectedDate.value);

                    return GestureDetector(
                      onTap: () {
                        dateController.updateSelectedDate(date);
                      },
                      child: Container(
                        width: appWidth(context) / 7,
                        margin: const EdgeInsets.symmetric(horizontal: 8.0),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? const Color(0xFFFAAA14)
                              : Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                          border: isSelected
                              ? Border.all(
                                  color: const Color(0xFFFAAA14), width: 2)
                              : null,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomText(
                              text: DateFormat('EEE', 'ja').format(date),
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                            hSizedBox0,
                            CustomText(
                              text: DateFormat('dd', 'ja').format(date),
                              color: isSelected ? Colors.white : Colors.black,
                            ),
                          ],
                        ),
                      ),
                    );
                  });
                },
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(
              vertical: 0.1.h,
            ),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0.h),
                    child: CustomCardWidget(cardDetails: cardData[index]),
                  );
                },
                childCount: cardData.length,
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Stack(
        clipBehavior: Clip.none,
        children: [
          Obx(
            () => BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: bottomNavController.selectedIndex,
              onTap: (index) {
                bottomNavController.changeIndex(index);
              },
              selectedItemColor: Color(0xFFFAAA14),
              unselectedItemColor: Colors.black,
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/search.svg',
                    color: bottomNavController.selectedIndex == 0
                        ? Color(0xFFFAAA14)
                        : Colors.black,
                  ),
                  label: 'さがす',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/office_bag.svg',
                    color: bottomNavController.selectedIndex == 1
                        ? Color(0xFFFAAA14)
                        : Colors.black,
                  ),
                  label: 'お仕事',
                ),
                BottomNavigationBarItem(
                  icon: Opacity(
                    opacity: 0.0,
                    child: SvgPicture.asset(
                      'assets/icons/scan_line.svg',
                    ),
                  ),
                  label: '打刻する',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/chat.svg',
                    color: bottomNavController.selectedIndex == 3
                        ? Color(0xFFFAAA14)
                        : Colors.black,
                  ),
                  label: 'チャット',
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    'assets/icons/user.svg',
                    color: bottomNavController.selectedIndex == 4
                        ? Color(0xFFFAAA14)
                        : Colors.black,
                  ),
                  label: 'マイページ',
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 30,
            left: appWidth(context) / 2 - 30,
            child: Column(
              children: [
                Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      colors: [Color(0xFFFAAA14), Color(0xFFFFD78D)],
                      stops: [0.0, 1],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                  ),
                  child: FloatingActionButton(
                    heroTag: 'scan',
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    onPressed: () {
                      bottomNavController.changeIndex(2);
                    },
                    child: SvgPicture.asset(
                      'assets/icons/scan_line.svg',
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: 'location',
        backgroundColor: Colors.white,
        shape: const CircleBorder(),
        onPressed: () {},
        child: IconButton(
          icon: SvgPicture.asset('assets/icons/location.svg'),
          onPressed: () {},
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
