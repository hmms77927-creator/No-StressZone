import 'package:get/get.dart';
import 'package:new_project_1/VIEW/Login/login.dart';
import 'package:new_project_1/VIEW/Login/signup.dart';
import 'package:new_project_1/VIEW/Profile/profile.dart';

import '../VIEW/ADD_CONTACTS/add_contacts.dart';
import '../VIEW/BOTTOMNAVIGATIONBAR/bottom_navigationbar.dart';
import '../VIEW/BRETHWORK/breathwork.dart';
import '../VIEW/CHOCE_YOUR_GOAL/chose_goal.dart';
import '../VIEW/CREATE_GROUP/create_group.dart';
import '../VIEW/Community/community.dart';
import '../VIEW/FLUXSOOUND/flux.dart';
import '../VIEW/GROUP_PAGE/group_page.dart';
import '../VIEW/GROUP_PAGE_1/group_page_1.dart';
import '../VIEW/GUIDED_VISULIZATION/guided_visulization.dart';
import '../VIEW/HOME/home.dart';
import '../VIEW/MEDIDATION_PLAYER/medidation_player.dart';
import '../VIEW/MENTAL_WELLNESS/metall_wellness.dart';
import '../VIEW/MIND_BODY_MOVEMENTS/mind_body_movements.dart';
import '../VIEW/POSITIVE_PHYSCHOLOGY/positive_physhology.dart';
import '../VIEW/SEND_MESSAGE/send_message.dart';
import '../VIEW/SOUND_PLAYER/sound_player.dart';
import '../VIEW/WELLCOME_SCREEN/wellcome.dart';

class AppPages{
  static const String initial="/wellcome";
  static const String groupPage = '/groupPage';
  static const String home='/home';
  static const String addContacts='/addContacts';
  static const String bottomNav='/bottomNav';
  static const String choseGoal='/choseGoal';
  static const String createGroup='/createGroup';
  static const String community='/community';
  static const String flux='/flux';
  static const String groupPage1='/groupPage1';
  static const String guidedVisualization='/guidedVisualization';
  static const String meditationPlayer='/meditationPlayer';
  static const String mentalWellness='/mentalWellness';
  static const String mindBodyMovements='/mindBodyMovements';
  static const String positivePsychology='/positivePsychology';
  static const String sendMessage='/sendMessage';
  static const String soundPlayer='/soundPlayer';
  static const String breathWork='/breathWork';
  static const String login='/login';
  static const String signin='/signin';
  static const String profile='/profile';
  static final routes=[
    GetPage(name: '/wellcome', page: () =>  Wellcome()),
    GetPage(name: '/home', page: () => HomeScreen()),
    GetPage(name: '/addContacts', page: () =>  addcontacts()),
    GetPage(name: '/bottomNav', page: () => BubbleBottomNav()),
    GetPage(name: '/breathWork', page: () =>  Breathwork()),
    GetPage(name: '/choseGoal', page: () =>  ChoseGoal()),
    GetPage(name: '/createGroup', page: () =>  CreateGroup()),
    GetPage(name: '/community', page: () =>  Community()),
    GetPage(name: '/flux', page: () =>  Flux()),
    GetPage(name: '/groupPage', page: () =>  GroupPage()),
    GetPage(name: '/groupPage1', page: () =>  GroupPage1()),
    GetPage(name: '/guidedVisualization', page: () =>  GuidedVisulization()),
    GetPage(name: '/meditationPlayer', page: () =>  MedidationPlayer()),
    GetPage(name: '/mentalWellness', page: () =>  MentalWellness()),
    GetPage(name: '/mindBodyMovements', page: () =>  MindBodyMovements()),
    GetPage(name: '/positivePsychology', page: () =>  PositivePhyshology()),
    GetPage(name: '/sendMessage', page: () =>  SendMessage()),
    GetPage(name: '/soundPlayer', page: () =>  SoundPlayer()),
    GetPage(name: '/login', page:()=>Login()),
  GetPage(name: '/signin', page:()=>Signup()),
    GetPage(name: '/profile', page:()=>Profile()),
  ];
}