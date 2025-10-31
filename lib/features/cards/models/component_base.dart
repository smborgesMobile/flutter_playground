import 'package:equatable/equatable.dart';

abstract class Component extends Equatable {
  final String type;
  const Component(this.type);
}

class UnknownComponent extends Component {
  const UnknownComponent(super.type);

  @override
  List<Object?> get props => [type];
}
