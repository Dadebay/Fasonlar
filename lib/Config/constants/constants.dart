import 'package:atelyam/Screens/home/home_screen.dart';
import 'package:iconly/iconly.dart';

const int limit = 5;

/////////////////////////////////
const String gilroyBold = 'GilroyBold';
const String gilroySemiBold = 'GilroySemiBold';
const String gilroyMedium = 'GilroyMedium';
const String gilroyRegular = 'GilroyRegular';
//Language icons
const String tmIcon = 'assets/image/tm.png';
const String ruIcon = 'assets/image/ru.png';
const String engIcon = 'assets/image/uk.png';

//appdata
const String logo = 'assets/icons/logo.png';
const String appName = 'Fason';
const String loremImpsum =
    'Lorem ipsum, yaygın olarak kullanılan bir yer tutucu metne verilen isimdir. Dolgu veya sahte metin olarak da bilinen bu tip yer tutucu metinler, aslında anlamlı bir şey söylemeden bir alanı doldurmaya yarayan metinlerdir,Lorem ipsum, yaygın olarak kullanılan bir yer tutucu metne verilen isimdir. Dolgu veya sahte metin olarak da bilinen bu tip yer tutucu metinler, aslında anlamlı bir şey söylemeden bir alanı doldurmaya yarayan metinlerdir,Lorem ipsum, yaygın olarak kullanılan bir yer tutucu metne verilen isimdir. Dolgu veya sahte metin olarak da bilinen bu tip yer tutucu metinler, aslında anlamlı bir şey söylemeden bir alanı doldurmaya yarayan metinlerdir,Lorem ipsum, yaygın olarak kullanılan bir yer tutucu metne verilen isimdir. Dolgu veya sahte metin olarak da bilinen bu tip yer tutucu metinler, aslında anlamlı bir şey söylemeden bir alanı doldurmaya yarayan metinlerdir';

//animations
const String loadingLottie = 'assets/lottie/loading.json';
const String noDataLottie = 'assets/lottie/noData.json';
const String noWifi = 'assets/icons/noconnection.gif';

//profile list
List<Map<String, dynamic>> profileBox = [
  {'title': 'profil', 'icon': IconlyLight.profile},
  {'title': 'settings', 'icon': IconlyLight.setting},
  {'title': 'lang', 'icon': IconlyLight.setting},
  {'title': 'aboutUs', 'icon': IconlyLight.info_square},
  {'title': 'login', 'icon': IconlyLight.login},
];
//category list
List<String> categoriesList = [
  'Matalar',
  'Fasonlar 2024',
  'Gündelik Köýnekler',
  'Owadan köýnekler',
  'Toý köýnekleri',
  'Ipekler',
  'Özünden gülli gülýüpek',
  'Flamaster',
  'Nagyşly',
  'Tomus köýnekler',
];
//bottomnavbar lilst
final List<Map<String, dynamic>> bottomNavBarList = [
  {
    'screen': const HomeScreen(),
    'iconBold': IconlyBold.home,
    'icon': IconlyLight.home,
  },
  {
    'screen': const HomeScreen(),
    'iconBold': IconlyBold.discovery,
    'icon': IconlyLight.discovery,
  },
  {
    'screen': const HomeScreen(),
    'iconBold': IconlyBold.heart,
    'icon': IconlyLight.heart,
  },
  {
    'screen': const HomeScreen(),
    'iconBold': IconlyBold.profile,
    'icon': IconlyLight.profile,
  }
];
