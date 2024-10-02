import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:ithreve_web/ui/pages/main/dashboard/pages/marker_data/main/market_data_main_page_state.dart';

@Injectable()
class MarketDataMainPageCubit extends Cubit<MarketDataMainPageState> {
  MarketDataMainPageCubit() : super(MarketDataMainPageState());
}
