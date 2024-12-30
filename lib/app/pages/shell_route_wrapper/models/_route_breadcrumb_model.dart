// 🌎 Project imports:
import '../../../../generated/l10n.dart' as l;

class RouteBreadcrumbModel {
  final String title;
  final String parentRoute;
  final String childRoute;
  const RouteBreadcrumbModel({
    required this.title,
    required this.parentRoute,
    required this.childRoute,
  });

  @override
  String toString() {
    return 'RouteBreadcrumbModel(parentName: $parentRoute, childName: $childRoute)';
  }
}

Map<String, RouteBreadcrumbModel> get routerParam {
  return {
    '/dashboard/open-ai-admin': RouteBreadcrumbModel(
      //title: 'Dashboard',
      title: l.S.current.dashboard,
      parentRoute: 'Dashboard',
      childRoute: 'Open AI Admin',
    ),
    '/dashboard/erp-admin': RouteBreadcrumbModel(
      //title: 'Dashboard',
      title: l.S.current.dashboard,
      parentRoute: 'Dashboard',
      childRoute: 'ERP Admin',
    ),
    '/dashboard/pos-admin': RouteBreadcrumbModel(
      //title: 'Dashboard',
      title: l.S.current.dashboard,
      parentRoute: 'Dashboard',
      childRoute: 'POS Admin',
    ),
    '/dashboard/earning-admin': RouteBreadcrumbModel(
      //title: 'Dashboard',
      title: l.S.current.dashboard,
      parentRoute: 'Dashboard',
      childRoute: 'Earning Admin',
    ),
    '/dashboard/sms-admin': RouteBreadcrumbModel(
      //title: 'Dashboard',
      title: l.S.current.dashboard,
      parentRoute: 'Dashboard',
      childRoute: 'SMS Admin',
    ),
    '/dashboard/influencer-admin': RouteBreadcrumbModel(
      //title: 'Dashboard',
      title: l.S.current.dashboard,
      parentRoute: 'Dashboard',
      childRoute: 'Influencer Admin',
    ),
    '/dashboard/hrm-admin': RouteBreadcrumbModel(
      //title: 'Dashboard',
      title: l.S.current.dashboard,
      parentRoute: 'Dashboard',
      childRoute: 'HRM Admin',
    ),
    '/dashboard/news-admin': RouteBreadcrumbModel(
      //title: 'Dashboard',
      title: l.S.current.dashboard,
      parentRoute: 'Dashboard',
      childRoute: 'News Admin',
    ),
    '/dashboard/ecommerce-admin': RouteBreadcrumbModel(
      //title: 'Dashboard',
      title: l.S.current.dashboard,
      parentRoute: 'Dashboard',
      childRoute: 'eCommerce Admin',
    ),
    '/widgets/general-widgets': RouteBreadcrumbModel(
      // title: 'General',
      title: l.S.current.general,
      parentRoute: 'Widgets',
      childRoute: 'General',
    ),
    '/widgets/chart-widgets': RouteBreadcrumbModel(
      //title: 'Chart',
      title: l.S.current.chart,
      parentRoute: 'Widgets',
      childRoute: 'Chart',
    ),
    '/calendar': RouteBreadcrumbModel(
      //title: 'Calendar',
      title: l.S.current.calendar,
      parentRoute: 'Application',
      childRoute: 'Calendar',
    ),
    '/chat': RouteBreadcrumbModel(
      //title: 'Chat',
      title: l.S.current.chat,
      parentRoute: 'Application',
      childRoute: 'Chat',
    ),
    
    '/projects': RouteBreadcrumbModel(
      //title: 'Projects',
      title: l.S.current.projects,
      parentRoute: 'Application',
      childRoute: 'Projects',
    ),
    '/kanban': RouteBreadcrumbModel(
      // title: 'Kanban',
      title: l.S.current.kanban,
      parentRoute: 'Application',
      childRoute: 'Kanban',
    ),
    '/ecommerce/product-list': RouteBreadcrumbModel(
      // title: 'eCommerce',
      title: l.S.current.eCommerce,
      parentRoute: 'eCommerce ',
      childRoute: 'Product List',
    ),
    '/ecommerce/product-details': RouteBreadcrumbModel(
      // title: 'eCommerce',
      title: l.S.current.eCommerce,
      parentRoute: 'eCommerce ',
      childRoute: 'Product Details',
    ),
    '/ecommerce/cart': RouteBreadcrumbModel(
      // title: 'eCommerce',
      title: l.S.current.eCommerce,
      parentRoute: 'eCommerce ',
      childRoute: 'Cart',
    ),
    '/ecommerce/checkout': RouteBreadcrumbModel(
      //title: 'eCommerce',
      title: l.S.current.eCommerce,
      parentRoute: 'eCommerce ',
      childRoute: 'Checkout',
    ),
    '/pos-inventory/sale': RouteBreadcrumbModel(
      // title: 'POSInventory',
      title: l.S.current.POSInventory,
      parentRoute: 'POS & Inventory',
      childRoute: 'POS Sale',
    ),
    '/pos-inventory/sale-list': RouteBreadcrumbModel(
      // title: 'POSInventory',
      title: l.S.current.POSInventory,
      parentRoute: 'POS & Inventory',
      childRoute: 'Sale List',
    ),
    '/pos-inventory/purchase': RouteBreadcrumbModel(
      // title: 'POSInventory',
      title: l.S.current.POSInventory,
      parentRoute: 'POS & Inventory',
      childRoute: 'Purchase',
    ),
    '/pos-inventory/purchase-list': RouteBreadcrumbModel(
      // title: 'POSInventory',
      title: l.S.current.POSInventory,
      parentRoute: 'POS & Inventory',
      childRoute: 'Purchase List',
    ),
    '/pos-inventory/product': RouteBreadcrumbModel(
      // title: 'POSInventory',
      title: l.S.current.POSInventory,
      parentRoute: 'POS & Inventory',
      childRoute: 'Product',
    ),
    '/open-ai/ai-writter': RouteBreadcrumbModel(
      //title: 'AI Writer',
      title: l.S.current.aIWriter,
      parentRoute: 'Application / Open AI',
      childRoute: 'AI Writer',
    ),
    '/open-ai/ai-image': RouteBreadcrumbModel(
      //title: 'AI Image',
      title: l.S.current.aIImage,
      parentRoute: 'Application / Open AI',
      childRoute: 'AI Image',
    ),
    '/open-ai/ai-chat': RouteBreadcrumbModel(
      //title: 'AI Chat',
      title: l.S.current.aIChat,
      parentRoute: 'Application / Open AI',
      childRoute: 'AI Chat',
    ),
    '/open-ai/ai-code': RouteBreadcrumbModel(
      //title: 'AI Code',
      title: l.S.current.aICode,
      parentRoute: 'Application / Open AI',
      childRoute: 'AI Code',
    ),
    '/open-ai/ai-voiceover': RouteBreadcrumbModel(
      //title: 'AI Voiceover',
      title: l.S.current.aIVoiceover,
      parentRoute: 'Application / Open AI',
      childRoute: 'AI Voiceover',
    ),
    '/users/user-list': RouteBreadcrumbModel(
      //title: 'Users List',
      title: l.S.current.usersList,
      parentRoute: 'Application / Users',
      childRoute: 'Users List',
    ),
    '/users/user-grid': RouteBreadcrumbModel(
      //title: 'Users Grid',
      title: l.S.current.usersGrid,
      parentRoute: 'Application / Users',
      childRoute: 'Users Grid',
    ),
    '/users/user-profile': RouteBreadcrumbModel(
      //title: 'User Profile',
      title: l.S.current.userProfile,
      parentRoute: 'Application / Users',
      childRoute: 'User Profile',
    ),
    '/tables/basic-table': RouteBreadcrumbModel(
      //title: 'Basic Table',
      title: l.S.current.basicTable,
      parentRoute: 'Tables & Forms',
      childRoute: 'Basic Table',
    ),
    '/tables/data-table': RouteBreadcrumbModel(
      //title: 'Data Table',
      title: l.S.current.dataTable,
      parentRoute: 'Tables & Forms',
      childRoute: 'Data Table',
    ),
    '/forms/basic-forms': RouteBreadcrumbModel(
      //title: 'Basic Forms',
      title: l.S.current.basicForms,
      parentRoute: 'Table & Forms',
      childRoute: 'Basic Forms',
    ),
    '/forms/form-select': RouteBreadcrumbModel(
      // title: 'Form Select',
      title: l.S.current.formSelect,
      parentRoute: 'Tables & Forms',
      childRoute: 'Form Select',
    ),
    '/forms/form-validation': RouteBreadcrumbModel(
      //title: 'Form Validation',
      title: l.S.current.formValidation,
      parentRoute: 'Tables & Forms',
      childRoute: 'Form Validation',
    ),
    '/components/buttons': RouteBreadcrumbModel(
      //title: 'Buttons',
      title: l.S.current.buttons,
      parentRoute: 'Components',
      childRoute: 'Buttons',
    ),
    '/components/colors': RouteBreadcrumbModel(
      //title: 'Colors',
      title: l.S.current.colors,
      parentRoute: 'Components',
      childRoute: 'Colors',
    ),
    '/components/alerts': RouteBreadcrumbModel(
      //title: 'Alerts',
      title: l.S.current.alerts,
      parentRoute: 'Components',
      childRoute: 'Alerts',
    ),
    
    '/components/cards': RouteBreadcrumbModel(
      //title: 'Cards',
      title: l.S.current.cards,
      parentRoute: 'Components',
      childRoute: 'Cards',
    ),
    '/components/avatars': RouteBreadcrumbModel(
      //title: 'Avatars',
      title: l.S.current.avatars,
      parentRoute: 'Components',
      childRoute: 'Avatars',
    ),
    '/components/dragndrop': RouteBreadcrumbModel(
      //title: 'Drag & Drop',
      title: l.S.current.dragDrop,
      parentRoute: 'Components',
      childRoute: 'Drag & Drop',
    ),
    
    '/pages/tabs-and-pills': RouteBreadcrumbModel(
      // title: 'Tabs & Pills',
      title: l.S.current.tabsPills,
      parentRoute: 'Pages',
      childRoute: 'Tabs & Pills',
    ),
   
    '/pages/404': RouteBreadcrumbModel(
      //title: '404',
      title: l.S.current.error,
      parentRoute: 'Pages',
      childRoute: '404',
    ),
    '/pages/privacy-policy': RouteBreadcrumbModel(
      // title: 'Privacy & Policy',
      title: l.S.current.privacyPolicy,
      parentRoute: 'Pages',
      childRoute: 'Privacy & Policy',
    ),
    '/pages/terms-conditions': RouteBreadcrumbModel(
      // title: 'Terms & Conditions',
      title: l.S.current.termsConditions,
      parentRoute: 'Pages',
      childRoute: 'Terms & Conditions',
    ),
  };
}
