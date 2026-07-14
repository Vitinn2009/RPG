# Flutter RPG Project

Base arquitetural de um RPG em Flutter, organizada por features.

## Stack

- **Riverpod** (`flutter_riverpod`) — estado e injeção de dependência.
- **GoRouter** — navegação declarativa.
- **Hive** — persistência local (banco de dados NoSQL embutido no app).
- Modelos imutáveis escritos à mão (`copyWith`, `toJson`/`fromJson`, adapters do Hive) —
  sem Freezed/JsonSerializable/build_runner, para o projeto compilar e rodar sem
  nenhuma etapa de geração de código.

## Estrutura

```
lib/
  core/
    constants/     # constantes globais (app, hive, assets)
    theme/          # cores, tipografia, ThemeData
    utils/          # logger, formatters, validators, Result<T>
    services/       # serviços de infraestrutura (ex.: StorageService)
    database/       # inicialização do Hive
    models/         # modelos persistidos (Freezed + Hive + Json)
    repositories/   # acesso a dados, camada única sobre o Hive
    providers/       # providers globais compartilhados entre features
  features/
    home/ battle/ dungeon/ inventory/ equipment/ skills/
    quests/ guild/ market/ craft/ chat/ player/ profile/ settings/
      <feature>_screen.dart      # apenas UI
      <feature>_providers.dart   # estado + orquestração (Riverpod)
      <feature>_service.dart     # regra de negócio pura (quando aplicável)
      <feature>_models.dart      # modelos locais à feature (quando aplicável)
  widgets/          # widgets reutilizáveis entre features
  routes/           # AppRoutes (paths) + GoRouter config
  main.dart
```

## Regra de separação de camadas

- **Screens**: só UI. Leem providers via `ref.watch`, disparam ações via `ref.read(...).metodo()`.
- **Providers**: orquestram estado, chamam Services/Repositories, nunca contêm regra de negócio complexa.
- **Services**: lógica de negócio pura, sem dependência de Flutter (fácil de testar).
- **Repositories**: única camada que acessa o Hive diretamente.

`battle/` é a feature de referência: `battle_service.dart` (regra pura de combate) +
`battle_providers.dart` (orquestração/estado) + `battle_screen.dart` (só UI).

## Setup local

```bash
flutter pub get
flutter run
```

Não há etapa de geração de código: os modelos (`PlayerModel`, `UserAccountModel`),
o estado de auth (`AuthState`) e os modelos de batalha (`Enemy`, `BattleState`) são
classes Dart comuns, e os adapters do Hive foram escritos à mão em
`lib/core/models/*.dart`.

O pacote `android/` já está incluído e configurado (Gradle + wrapper), então basta
abrir a pasta do projeto no Android Studio, deixar o Gradle sincronizar, escolher um
emulador e rodar.

## Features com scaffold completo

- `home` — menu principal, navegação para todas as features.
- `player` — leitura/criação/persistência do jogador (Hive).
- `battle` — exemplo completo do padrão Service → Provider → Screen.

## Features com scaffold mínimo (aguardando especificação)

`dungeon`, `inventory`, `equipment`, `skills`, `quests`, `guild`, `market`, `craft`, `chat`,
`profile`, `settings` — cada uma já possui `_screen.dart` (placeholder) e `_providers.dart`
(stub), prontas para receber a lógica definida pelo Arquiteto.
