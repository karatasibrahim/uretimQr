// 📦 Package imports:
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

// 🌎 Project imports:
import '../pages/pages.dart';
import '../providers/providers.dart';

abstract class AcnooAppRoutes {
  //--------------Navigator Keys--------------//
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _emailShellNavigatorKey = GlobalKey<NavigatorState>();
  //--------------Navigator Keys--------------//

  static const _initialPath = '/';
  static final routerConfig = GoRouter(
    navigatorKey: GlobalKey<NavigatorState>(),
    initialLocation: _initialPath,
    routes: [
      // Landing Route Handler
      GoRoute(
        path: _initialPath,
        redirect: (context, state) {
          final _appLangProvider = Provider.of<AppLanguageProvider>(context);

          if (state.uri.queryParameters['rtl'] == 'true') {
            _appLangProvider.isRTL = true;
          }
          return '/dashboard/erp-admin';
        },
      ),

      // Global Shell Route
      ShellRoute(
        navigatorKey: _rootNavigatorKey,
        pageBuilder: (context, state, child) {
          return NoTransitionPage(
            child: ShellRouteWrapper(child: child),
          );
        },
        routes: [
          // Dashboard Routes
          GoRoute(
            path: '/dashboard',
            redirect: (context, state) async {
              if (state.fullPath == '/dashboard') {
                return '/dashboard/erp-admin';
              }
              return null;
            },
            routes: [
        
          
              GoRoute(
                path: 'erp-admin',
                pageBuilder: (context, state) => const NoTransitionPage(
                  child: ERPAdminDashboardView(),
                ),
              ),
             
      
     
       
         
            ],
          ),

          // Widgets Routes
          GoRoute(
            path: '/widgets',
            redirect: (context, state) async {
              if (state.fullPath == '/widgets') {
                return '/widgets/general-widgets';
              }
              return null;
            },
        
          ),

          //--------------Application Section--------------//
          

          // Email Shell Routes
          GoRoute(
            path: '/email',
            redirect: (context, state) async {
              if (state.fullPath == '/email') {
                return '/email/inbox';
              }
              return null;
            },
        
          ),

          GoRoute(
            path: '/projects',
            pageBuilder: (context, state) => const NoTransitionPage<void>(
              child: ProjectsView(),
            ),
          ),
        
 
           
          // Users Route
          GoRoute(
            path: '/users',
            redirect: (context, state) async {
              if (state.fullPath == '/users') {
                return '/users/user-list';
              }
              return null;
            },
            routes: [
              GoRoute(
                path: 'user-list',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: UsersListView(),
                ),
              ),
              GoRoute(
                path: 'user-grid',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: UsersGridView(),
                ),
              ),
              GoRoute(
                path: 'user-profile',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: UserProfileView(),
                ),
              ),
            ],
          ),

          //--------------Application Section--------------//

          //--------------Tables & Forms--------------//
          GoRoute(
            path: '/tables',
            redirect: (context, state) async {
              if (state.fullPath == '/tables') {
                return '/tables/basic-table';
              }
              return null;
            },
         
          ),

          GoRoute(
            path: '/forms',
            redirect: (context, state) async {
              if (state.fullPath == '/forms') {
                return '/forms/basic-forms';
              }
              return null;
            },
            routes: [
              GoRoute(
                path: 'basic-forms',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: BasicFormsView(),
                ),
              ),
              GoRoute(
                path: 'form-select',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: FormSelectView(),
                ),
              ),
              GoRoute(
                path: 'form-validation',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: FormValidationView(),
                ),
              ),
            ],
          ),
          //--------------Tables & Forms--------------//

          //--------------Components--------------//
          GoRoute(
            path: '/components',
            redirect: (context, state) async {
              if (state.fullPath == '/components') {
                return '/components/buttons';
              }
              return null;
            },
           
          ),
          //--------------Components--------------//

          //--------------Pages--------------//
          GoRoute(
            path: '/pages',
            redirect: (context, state) async {
              if (state.fullPath == '/pages') {
                return '/pages/gallery';
              }
              return null;
            },
            routes: [
              
              GoRoute(
                path: 'tabs-and-pills',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: TabsNPillsView(),
                ),
              ),
              GoRoute(
                path: '404',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: NotFoundView(),
                ),
              ),
            
              GoRoute(
                path: 'privacy-policy',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: PrivacyPolicyView(),
                ),
              ),
              GoRoute(
                path: 'terms-conditions',
                pageBuilder: (context, state) => const NoTransitionPage<void>(
                  child: TermsConditionView(),
                ),
              ),
            ],
          ),
          //--------------Pages--------------//
        ],
      ),

      // Full Screen Pages
      GoRoute(
        path: '/authentication/signup',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SignupView(),
        ),
      ),
      GoRoute(
        path: '/authentication/signin',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SigninView(),
        ),
      )
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: NotFoundView(),
    ),
  );
}