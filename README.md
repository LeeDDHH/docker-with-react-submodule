# 概要

- react ベースのプロジェクトを docker コンテナ内で動かすためのプロジェクト

## 前提

- react プロジェクトはサブモジュールとして指定
  - [LeeDDHH/react-typescript-webpack](https://github.com/LeeDDHH/react-typescript-webpack/)
- 本番用・開発用ともに、Docker イメージ作成中に `npm install` をして、 `node_modules` を生成する
- 開発用のみ、PC 側の `frontVolume` のソースを使いながら、コンテナ内に `node_modules` をバインドする
- 本番用と開発用で `docker-compose.yml` のファイルを分ける
  |用途|ファイル|備考|
  |:---:|:---:|:---:|
  |本番用| `docker-compose.yml` | `node` イメージでビルドをして、 `nginx` イメージにビルド結果を置く|
  |開発用| `docker-compose.dev.yml` |サブモジュールのプロジェクトを docker コンテナ内の `/src` に配置する|

## コマンド

### 開発

```shell
# コマンド
docker compsoe -f docker-compose.dev.yml up -d

# 起動・終了スクリプト
sh bin/dev.sh

# イメージの削除も含めた起動・終了スクリプト
sh bin/dev_rebuild.sh
```

### 本番

```shell
# コマンド
docker compsoe up -d

# 起動・終了スクリプト
sh bin/prod.sh

# イメージの削除も含めた起動・終了スクリプト
sh bin/prod_rebuild.sh
```

### 注意点

- イメージ削除、キャッシュ削除はこまめにする
  - `docker image rm イメージ名`
  - `docker builder prune`
