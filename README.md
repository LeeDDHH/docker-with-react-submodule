# 概要

- react ベースのプロジェクトを docker コンテナ内で動かすためのプロジェクト

## 前提

- react プロジェクトはサブモジュールとして指定
  - [LeeDDHH/react-typescript-webpack](https://github.com/LeeDDHH/react-typescript-webpack/)
  - react プロジェクトで `npm install` した結果をまるごとコピーして docker コンテナ内で扱う
- 本番用と開発用で `docker-compose.yml` のファイルを分ける
  |用途|ファイル|備考|
  |:---:|:---:|:---:|
  |本番用| `docker-compose.yml` | `node` イメージでビルドをして、 `nginx` イメージにビルド結果を置く|
  |開発用| `docker-compose.dev.yml` |サブモジュールのプロジェクトを docker コンテナ内の `/src` に配置する|

## コマンド

### 開発

```docker
docker compsoe -f docker-compose.dev.yml up -d
```

### 本番

```docker
docker compsoe up -d
```

### 注意点

- イメージ削除、キャッシュ削除はこまめにする
  - `docker image rm イメージ名`
  - `docker builder prune`
