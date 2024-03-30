import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_smart_dialog/flutter_smart_dialog.dart';
import 'package:mainventori/screens/home/tabs/tab_orders/widgets/add_new_order_dialog/widgets/content.dart';
import 'package:mainventori/screens/home/tabs/tab_orders/widgets/add_new_order_dialog/widgets/footer.dart';
import 'package:mainventori/screens/home/tabs/tab_orders/widgets/add_new_order_dialog/widgets/header.dart';
import 'package:mainventori/store/index.dart';
import 'package:mainventori/widgets/custom_dialog/index.dart';

class AddNewOrderDialog extends ConsumerStatefulWidget {
  final Function refreshDataOrders;

  const AddNewOrderDialog({
    Key? key,
    required this.refreshDataOrders,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AddNewOrderDialogState createState() => _AddNewOrderDialogState();
}

class _AddNewOrderDialogState extends ConsumerState<AddNewOrderDialog> {
  @override
  void initState() {
    super.initState();
    ref.read(ordersStore.notifier).initialize();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      width: 966,
      height: 1017,
      title: 'New Order',
      textConfirm: '',
      textCancel: '',
      onPressConfirm: () {},
      shouldShowFooter: false,
      onPressCancel: SmartDialog.dismiss,
      content: const [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              AddNewOrderDialogHeader(),
              AddNewOrderDialogContent(),
              AddNewOrderDialogFooter(),
            ],
          ),
        ),
      ],
    );
  }
}
