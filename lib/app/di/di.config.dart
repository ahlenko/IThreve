// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:ithreve_web/data/data_source/local_data_source.dart' as _i560;
import 'package:ithreve_web/data/data_source/remove_data_souce.dart' as _i229;
import 'package:ithreve_web/data/network/client.dart' as _i506;
import 'package:ithreve_web/data/repository/repository_impl.dart' as _i1015;
import 'package:ithreve_web/domain/repository/repository.dart' as _i730;
import 'package:ithreve_web/domain/usecase/login_usecase.dart' as _i1062;
import 'package:ithreve_web/ui/pages/auth/login/login_page_cubit.dart' as _i441;
import 'package:ithreve_web/ui/pages/auth/signup/sign_up_page_cubit.dart'
    as _i509;
import 'package:ithreve_web/ui/pages/main/dashboard/dashboard_page_cubit.dart'
    as _i774;
import 'package:ithreve_web/ui/pages/main/dashboard/job/create_job_page_selector_cubit.dart'
    as _i332;
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/main/market_data_main_page_cubit.dart'
    as _i923;
import 'package:ithreve_web/ui/pages/main/dashboard/pages/messages/main/messages_main_page_cubit.dart'
    as _i802;
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/dialogs/edit/roles_edit_dialog_cubit.dart'
    as _i831;
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/dialogs/review/roles_review_dialog_cubit.dart'
    as _i491;
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/main/roles_main_page_cubit.dart'
    as _i712;
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/messages/roles_messages_page_cubit.dart'
    as _i254;
import 'package:ithreve_web/ui/pages/main/dashboard/pages/open_roles/roles_page_controller_cubit.dart'
    as _i108;
import 'package:ithreve_web/ui/pages/main/dashboard/pages/profile/main/profile_main_page_cubit.dart'
    as _i206;
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/dialogs/filters_dialog/filters_owerlay_dialog_cubit.dart'
    as _i702;
import 'package:ithreve_web/ui/pages/main/dashboard/pages/swipes/main/swipes_main_page_cubit.dart'
    as _i407;
import 'package:ithreve_web/ui/pages/main/landing/landing_page_cubit.dart'
    as _i719;
import 'package:ithreve_web/ui/pages/register/company/register_company_page_cubit.dart'
    as _i231;
import 'package:ithreve_web/ui/pages/register/vacancy/register_vacancy_page_cubit.dart'
    as _i333;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.factory<_i509.SignUpPageCubit>(() => _i509.SignUpPageCubit());
    gh.factory<_i333.RegisterVacancyPageCubit>(
        () => _i333.RegisterVacancyPageCubit());
    gh.factory<_i231.RegisterCompanyPageCubit>(
        () => _i231.RegisterCompanyPageCubit());
    gh.factory<_i719.LandingPageCubit>(() => _i719.LandingPageCubit());
    gh.factory<_i774.DashboardPageCubit>(() => _i774.DashboardPageCubit());
    gh.factory<_i332.CreateJobPageSelectorCubit>(
        () => _i332.CreateJobPageSelectorCubit());
    gh.factory<_i923.MarketDataMainPageCubit>(
        () => _i923.MarketDataMainPageCubit());
    gh.factory<_i802.MessagesMainPageCubit>(
        () => _i802.MessagesMainPageCubit());
    gh.factory<_i702.FiltersOwerlayDialogCubit>(
        () => _i702.FiltersOwerlayDialogCubit());
    gh.factory<_i407.SwipesMainPageCubit>(() => _i407.SwipesMainPageCubit());
    gh.factory<_i206.ProfileMainPageCubit>(() => _i206.ProfileMainPageCubit());
    gh.factory<_i108.RolesPageControllerCubit>(
        () => _i108.RolesPageControllerCubit());
    gh.factory<_i254.RolesMessagesPageCubit>(
        () => _i254.RolesMessagesPageCubit());
    gh.factory<_i831.RolesEditDialogCubit>(() => _i831.RolesEditDialogCubit());
    gh.factory<_i491.RolesReviewDialogCubit>(
        () => _i491.RolesReviewDialogCubit());
    gh.factory<_i712.RolesMainPageCubit>(() => _i712.RolesMainPageCubit());
    gh.lazySingleton<_i506.DioFactory>(() => _i506.DioFactory());
    gh.lazySingleton<_i560.LocalDataSource>(
        () => _i560.LocalDataSourceImplementer());
    gh.factory<_i229.RemoteDataSource>(() => _i229.RemoteDataSourceImpl());
    gh.factory<_i730.Repository>(
        () => _i1015.MainRepositoryImpl(gh<_i229.RemoteDataSource>()));
    gh.factory<_i1062.LoginUseCase>(
        () => _i1062.LoginUseCase(gh<_i730.Repository>()));
    gh.factory<_i441.LoginPageCubit>(
        () => _i441.LoginPageCubit(gh<_i1062.LoginUseCase>()));
    return this;
  }
}
