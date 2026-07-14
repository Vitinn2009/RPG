import 'package:hive/hive.dart';
import '../utils/app_logger.dart';
import '../utils/result.dart';

/// Serviço genérico de leitura/escrita sobre uma [Box] do Hive.
///
/// Repositories de cada feature devem usar este serviço em vez de
/// acessar `Hive.box(...)` diretamente — isso mantém toda regra de
/// acesso a dados centralizada e testável.
class StorageService<T> {
  final Box<T> _box;

  StorageService(this._box);

  Result<T?> get(String key) {
    try {
      return Result.success(_box.get(key));
    } catch (e, st) {
      AppLogger.error('Erro ao ler chave $key', error: e, stackTrace: st, tag: 'STORAGE');
      return Result.failure('Falha ao ler dado local', e);
    }
  }

  List<T> getAll() => _box.values.toList();

  Future<Result<void>> put(String key, T value) async {
    try {
      await _box.put(key, value);
      return const Result.success(null);
    } catch (e, st) {
      AppLogger.error('Erro ao salvar chave $key', error: e, stackTrace: st, tag: 'STORAGE');
      return Result.failure('Falha ao salvar dado local', e);
    }
  }

  Future<Result<void>> delete(String key) async {
    try {
      await _box.delete(key);
      return const Result.success(null);
    } catch (e, st) {
      AppLogger.error('Erro ao remover chave $key', error: e, stackTrace: st, tag: 'STORAGE');
      return Result.failure('Falha ao remover dado local', e);
    }
  }

  Future<Result<void>> clear() async {
    try {
      await _box.clear();
      return const Result.success(null);
    } catch (e, st) {
      AppLogger.error('Erro ao limpar box', error: e, stackTrace: st, tag: 'STORAGE');
      return Result.failure('Falha ao limpar dados locais', e);
    }
  }
}
