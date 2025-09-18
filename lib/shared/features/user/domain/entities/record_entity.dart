import 'package:app_posto/shared/features/user/domain/entities/user_entity.dart';
import 'package:floor/floor.dart';

@Entity(
  tableName: 'record',
  foreignKeys: [
    ForeignKey(
      childColumns: ['userCpf'],
      parentColumns: ['cpf'],
      entity: UserEntity,
      onDelete: ForeignKeyAction.cascade,
    ),
  ],
)
class RecordEntity {
  @PrimaryKey(autoGenerate: true)
  final int id;
  final String name;
  final String birthday;
  final String gender;
  final String moreInfo;
  final String userCpf;

  RecordEntity({
    required this.id,
    required this.name,
    required this.birthday,
    required this.gender,
    required this.moreInfo,
    required this.userCpf,
  });
}
