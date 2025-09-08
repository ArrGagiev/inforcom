import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inforcom/blocs/support/support_bloc.dart';
import 'package:inforcom/core/resources/app_colors.dart';
import 'package:inforcom/core/resources/app_icons.dart';
import 'package:inforcom/core/resources/app_images.dart';
import 'package:inforcom/core/resources/app_text_styles.dart';
import 'package:inforcom/core/services/url_launcher.dart';
import 'package:inforcom/data/models/support_phone_model.dart';

class SupportCard extends StatelessWidget {
  const SupportCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SupportBloc, SupportState>(
      builder: (context, state) {
        return _buildContent(context, state);
      },
    );
  }

  Widget _buildContent(BuildContext context, SupportState state) {
    if (state is SupportLoading) {
      return _buildLoading();
    } else if (state is SupportError) {
      return _buildError(context, state.error);
    } else if (state is SupportLoaded) {
      return _buildLoaded(context, state.phones);
    } else {
      // Initial state - можно показать заглушку или запустить загрузку
      return _buildInitial(context);
    }
  }

  Widget _buildInitial(BuildContext context) {
    // При первом отображении запускаем загрузку
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<SupportBloc>().add(LoadSupportPhones());
    });

    return _buildLoading();
  }

  Widget _buildLoading() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildError(BuildContext context, String error) {
    final inforcomLogo = Image.asset(
      AppImages.inforcomLogo,
      width: 197,
      height: 65,
    );
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    child: Text(
                      'Поддержка водителей',
                      style: AppTextStyles.h2.copyWith(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  inforcomLogo,
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SvgPicture.asset(
                          AppIcons.clock,
                          colorFilter: ColorFilter.mode(
                            AppColors.accent,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Text(
                        'Круглосуточно',
                        style: AppTextStyles.h3.copyWith(
                          color: AppColors.primaryText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  InkWell(
                    onTap: () => UrlLauncher.goTo('tel://+7 (495) 785-24-44'),
                    child: Text(
                      '+7 (495) 785-24-44',
                      style: AppTextStyles.h3.copyWith(
                        color: AppColors.accent2,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  InkWell(
                    onTap: () => UrlLauncher.goTo('tel://+ 7 (926) 226-30-82'),
                    child: Text(
                      '+ 7 (926) 226-30-82',
                      style: AppTextStyles.h3.copyWith(
                        color: AppColors.accent2,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildLoaded(BuildContext context, List<SupportPhoneModel> phones) {
    final inforcomLogo = Image.asset(
      AppImages.inforcomLogo,
      width: 197,
      height: 65,
    );

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  FittedBox(
                    child: Text(
                      'Поддержка водителей',
                      style: AppTextStyles.h2.copyWith(
                        color: AppColors.primaryText,
                      ),
                    ),
                  ),
                  SizedBox(height: 24),
                  inforcomLogo,
                  SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: SvgPicture.asset(
                          AppIcons.clock,
                          colorFilter: ColorFilter.mode(
                            AppColors.accent,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                      Text(
                        'Круглосуточно',
                        style: AppTextStyles.h3.copyWith(
                          color: AppColors.primaryText,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 24),
                  ...phones
                      .map(
                        (phone) => Padding(
                          padding: const EdgeInsets.only(bottom: 16),
                          child: InkWell(
                            onTap: () =>
                                UrlLauncher.goTo('tel://${phone.phone}'),
                            child: Text(
                              phone.phone,
                              style: AppTextStyles.h3.copyWith(
                                color: AppColors.accent2,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  if (phones.isEmpty) _buildNoPhones(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildNoPhones() {
    return Text(
      'Номера поддержки не найдены',
      style: AppTextStyles.h3.copyWith(color: AppColors.primaryText),
    );
  }
}
