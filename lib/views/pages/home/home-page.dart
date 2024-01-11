// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:peanut_app_task/app/constatns/app_size.dart';
import 'package:peanut_app_task/app/constatns/string.dart';
import 'package:peanut_app_task/app/route.dart';
import 'package:peanut_app_task/app/theme.dart';
import 'package:peanut_app_task/app/utils.dart';
import 'package:peanut_app_task/controllers/home-controller.dart';
import 'package:peanut_app_task/controllers/initial-controller.dart';
import 'package:peanut_app_task/data/model/response/account-info-response-model.dart';
import 'package:peanut_app_task/data/model/response/trade-response-model.dart';
import 'package:peanut_app_task/views/pages/login/login-page.dart';
import 'package:peanut_app_task/views/widgets/button.dart';
import 'package:peanut_app_task/views/widgets/circle-border-value.dart';
import 'package:peanut_app_task/views/widgets/text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<HomeController>().getAllData();
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppTheme.primaryColor,
          onPressed: () {
            totalProfitSheet();
          },
          label: const Icon(
            Icons.calculate,
            color: AppTheme.whiteColor,
          )),
      body: RefreshIndicator(
        onRefresh: () async {
          Get.find<HomeController>().getTrade();
        },
        child: const CustomScrollView(
          slivers: <Widget>[
            TopBar(),
            TradeList(),
          ],
        ),
      ),
    );
  }

  Future<dynamic> totalProfitSheet() {
    return Get.bottomSheet(Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: AppSize.s80,
        padding: const EdgeInsets.all(AppSize.s15),
        decoration: BoxDecoration(
            color: AppTheme.whiteColor,
            borderRadius: BorderRadius.circular(10)),
        child: Obx(() => Column(
              children: [
                PText(
                  text: "Total Profit",
                  color: themdata().primaryColor,
                ),
                box(2),
                PText(
                    text: Get.find<HomeController>()
                        .totalProfit
                        .toStringAsFixed(4)),
              ],
            )),
      ),
    ));
  }
}

class TradeList extends StatelessWidget {
  const TradeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    return Obx(() {
      return controller.loadingTrade.isFalse
          ? SliverList(
              delegate: SliverChildBuilderDelegate(
                (_, int index) {
                  return TradeListItem(data: controller.tradeList[index]);
                },
                childCount: controller.tradeList.length,
              ),
            )
          : const SliverFillRemaining(
              child: Center(
                child: CircularProgressIndicator(
                  color: AppTheme.primaryColor,
                ),
              ),
            );
    });
  }
}

class TradeListItem extends StatelessWidget {
  const TradeListItem({
    super.key,
    required this.data,
  });
  final TradeReponseModel data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          left: AppSize.s10, right: AppSize.s10, top: AppSize.s10),
      child: Card(
        elevation: 0.0,
        child: Container(
          margin: const EdgeInsets.symmetric(
              horizontal: AppSize.s10, vertical: AppSize.s10),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    PText(text: "➡️${data.symbol}"),
                  ],
                ),
                box(4),
                Row(
                  children: [
                    PText(
                      text: "DIGIT:${data.digits}",
                      color: themdata().primaryColor,
                      fontSize: AppSize.s12,
                    ),
                    box(AppSize.s30),
                    PText(
                      text: "SWAPS:${data.swaps}",
                      color: const Color.fromARGB(255, 251, 47, 47),
                      fontSize: AppSize.s12,
                    ),
                  ],
                ),
              ],
            ),
            box(5),
            Container(
                alignment: Alignment.center,
                height: AppSize.s50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: themdata().primaryColor.withOpacity(0.2),
                ),
                child:
                    PText(text: "\$${data.currentPrice.toStringAsFixed(2)}")),
          ]),
        ),
      ),
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final contrller = Get.find<HomeController>();
    return SliverAppBar(
      expandedHeight: 290.0,
      flexibleSpace: SafeArea(
        child: FlexibleSpaceBar(
          background: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: AppSize.s20, vertical: AppSize.s15),
            child: Obx(() {
              return contrller.loadingData.isFalse
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const TitleBar(),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: PText(
                            textAlign: TextAlign.left,
                            text: contrller.userData.value.name,
                            fontSize: AppSize.s18,
                            color: AppTheme.whiteColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: PText(
                            fontSize: AppSize.s18,
                            text: contrller.phoneNo.value,
                            color: AppTheme.whiteColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                        box(AppSize.s20),
                        ValueArea(data: contrller.userData.value),
                        box(5),
                        StateArea(data: contrller.userData.value),
                        AddressArea(address: contrller.userData.value.address)
                      ],
                    )
                  : const Center(
                      child:
                          CircularProgressIndicator(color: AppTheme.whiteColor),
                    );
            }),
          ),
        ),
      ),
    );
  }
}

class ValueArea extends StatelessWidget {
  const ValueArea({
    super.key,
    required this.data,
  });
  final AccountInfoResponseModel data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleBorderValue(
            color: const Color.fromARGB(255, 74, 255, 80),
            type: "Balance",
            value: data.balance.toString()),
        box(AppSize.s15),
        CircleBorderValue(
            color: const Color.fromARGB(255, 247, 92, 255),
            type: "Count",
            value: data.totalTradesCount.toString()),
        box(AppSize.s15),
        CircleBorderValue(
            color: const Color.fromARGB(255, 255, 155, 68),
            type: "Volume",
            value: data.totalTradesVolume.toString())
      ],
    );
  }
}

class StateArea extends StatelessWidget {
  const StateArea({
    super.key,
    required this.data,
  });
  final AccountInfoResponseModel data;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Row(
          children: [
            const Icon(Icons.location_city),
            box(5),
            PText(
              text: data.city,
              fontSize: 13,
              color: AppTheme.whiteColor,
              fontWeight: FontWeight.normal,
            ),
          ],
        ),
        box(5),
        Row(
          children: [
            const Icon(Icons.wordpress_outlined),
            box(5),
            PText(
              text: data.country,
              fontSize: 13,
              color: AppTheme.whiteColor,
              fontWeight: FontWeight.normal,
            ),
          ],
        )
      ],
    );
  }
}

class AddressArea extends StatelessWidget {
  const AddressArea({
    Key? key,
    required this.address,
  }) : super(key: key);
  final String address;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 253, 170, 6),
          borderRadius: BorderRadius.circular(AppSize.s20)),
      padding: const EdgeInsets.symmetric(
        horizontal: AppSize.s10,
        vertical: 5,
      ),
      child: Row(
        children: [
          const Icon(Icons.location_on_outlined),
          box(5),
          PText(
            fontSize: AppSize.s12,
            text: address,
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
    );
  }
}

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        PText(
          text: AppString.appName,
          color: AppTheme.whiteColor,
          fontSize: AppSize.s24,
        ),
        CircleBtn(
          bgColor: const Color.fromARGB(255, 255, 19, 19),
          onTap: () async {
            await Get.find<InitialController>()
                .logOutUser()
                .whenComplete(() => Get.offAll(const LoginPage()));
          },
          widget: const Icon(
            Icons.logout,
            color: AppTheme.whiteColor,
          ),
        )
      ],
    );
  }
}
