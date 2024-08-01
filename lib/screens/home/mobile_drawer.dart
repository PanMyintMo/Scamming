part of 'mainpage.dart';

class MobileDrawer extends StatefulWidget {
  const MobileDrawer({super.key});

  @override
  MobileDrawerState createState() => MobileDrawerState();
}

class MobileDrawerState extends State<MobileDrawer> {
  final Map<int, bool> _expandedStates = {};

  @override
  Widget build(BuildContext context) {
    final scrollProvider = Provider.of<ScrollProvider>(context);

    return Drawer(
      child: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 200,
                color: AppColors.blackColor.withGreen(70),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: Center(child: NavBarLogo()),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text('ItVisionHub Co.ltd'),
              const SizedBox(
                height: 50,
              ),
              const Divider(),
              ...NavBarUtls.name.asMap().entries.map((e) {
                final itemName = NavBarUtls.name[e.key];
                final itemIcon = NavBarUtls.icons[e.key];
                final subMenuItems = getSubMenuItems(itemName);

                if (subMenuItems.isEmpty) {
                  return ListTile(
                    iconColor: AppColors.greenColor,
                    onTap: () {
                      scrollProvider.jumpTo(e.key);
                      navigateToRoute(itemName);
                    },
                    leading: Icon(itemIcon),
                    title: Text(
                      itemName,
                      style: sidebarTitleStyle.copyWith(
                          color: AppColors.greenColor),
                    ),
                  );
                } else {
                  return ExpansionPanelList(
                    expansionCallback: (int index, bool isExpanded) {
                      setState(() {
                        _expandedStates.forEach((key, value) {
                          _expandedStates[key] = false;
                        });
                        _expandedStates[e.key] = !isExpanded;
                      });
                    },
                    children: [
                      ExpansionPanel(
                        headerBuilder: (BuildContext context, bool isExpanded) {
                          return ListTile(
                            onTap: () {
                              setState(() {
                                _expandedStates.forEach((key, value) {
                                  _expandedStates[key] = false;
                                });
                                _expandedStates[e.key] = !isExpanded;
                              });
                            },
                            leading:
                                Icon(itemIcon, color: AppColors.greenColor),
                            title: Text(
                              itemName,
                              style: sidebarTitleStyle.copyWith(
                                  color: AppColors.greenColor),
                            ),
                          );
                        },
                        body: SingleChildScrollView(
                          child: Column(
                            children: subMenuItems.map((subItem) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                child: ListTile(
                                  onTap: () {
                                    navigateToRoute(subItem);
                                  },
                                  title: Text(
                                    subItem,
                                    style: sidebarBodyStyle.copyWith(
                                        color: AppColors.greenColor),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        isExpanded: _expandedStates[e.key] ?? false,
                      ),
                    ],
                  );
                }
              }),
            ],
          ),
        ],
      ),
    );
  }

  void navigateToRoute(String itemName) {
    switch (itemName) {
      case 'Add Category':
        ScammerRouter.changeRoute<CategoryModule>(CategoryRoutes.root);
        break;
      case 'All Category':
        ScammerRouter.changeRoute<CategoryModule>(CategoryRoutes.allCate);
        break;
      case 'HELP':
        //  AppRouter.changeRoute<HelpModule>(HelpRoutes.root);
        break;
      default:
        // logger.e('Invalid route: $itemName');
        break;
    }
  }
}
