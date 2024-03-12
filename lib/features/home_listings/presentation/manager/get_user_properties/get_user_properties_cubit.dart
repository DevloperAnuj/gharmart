import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gharmart/features/home_listings/domain/entities/property_entity.dart';
import 'package:gharmart/features/home_listings/presentation/manager/fetch_properties/fetch_properties_cubit.dart';
import 'package:gharmart/utils/config_file.dart';

part 'get_user_properties_state.dart';

class GetUserPropertiesCubit extends Cubit<GetUserPropertiesState> {
  GetUserPropertiesCubit() : super(GetUserPropertiesState.initial());

  final fetchedProperties = serviceConfig.get<FetchPropertiesCubit>();

  getUserProperties() async {
    final properties = fetchedProperties.state.properties
        .where(
          (property) =>
              property.owner == fetchedProperties.client.auth.currentUser!.id,
        )
        .toList();
    emit(state.copyWith(properties: properties));
  }

}
