# みんなの戦国武将

- アプリ → https://minnano-sengokubusyou.com
- Qiita → https://qiita.com/TS1engineer/items/7a5b5d33903d73992c49

![smart.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/2674841/e6648d34-1b93-31b4-f3fd-46f998fd564a.gif)

※スマートフォンにも対応しています！

![qrcode_minnano-sengokubusyou.com (1).png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/2674841/06ddf3a6-9fd5-06b4-e2fe-37412938b262.png)

# 1. 概要

- **200 人以上の豊富な戦国武将の中から、好きな武将を見つけたり、登録することができます。**
- **好きな武将にコメントを投稿することで、気の合う仲間とつながることができるアプリです。**

![pc2.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/2674841/ad409e7e-005f-e05f-4ff2-4e06ff18f04a.gif)

# 2. 開発背景

## 歴史が大好き

**2016 年大河ドラマ「真田丸」をきっかけに歴史に興味をもち、歴史の本を購入したりする中で、実際に現地に行くことが趣味になりました。**
中でも戦国武将について調べることが日課となっていて、特に気になる武将がいれば、ゆかりの地を巡ったりしています。

![haikei1jpg.jpg](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/2674841/103503f1-cac7-7602-b028-c073cc3582f7.jpeg)

## 歴史を通じて交流がしたい

そうした中で、現地に行って得られた体験を共有したかったのですが、同世代に好きな人がおらず、ひとりで楽しむ程度でした。
**そのため、「歴史に興味のある人との交流できたらいいな」と思っていたため、今回アプリを作ることを決めました。**
「あの戦国武将と自分の出身地が一緒」というだけでも興味を持ちやすいですし、そういう方にぜひ使ってもらいたいアプリです。

![haikei2.jpg](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/2674841/564068ac-88f1-ac76-4dca-6143aeddb9c6.jpeg)

# 3. 機能

## 機能一覧

| 項目         | 内容                                                      |
| ------------ | --------------------------------------------------------- |
| ログイン関連 | ログイン、ゲストログイン、ログアウト                      |
| ユーザー関連 | 登録、編集、削除                                          |
| 武将検索     | 名前検索、50 音検索、出身地検索                           |
| 武将登録     | 登録、編集、削除                                          |
| いいね       | 武将にいいねできる                                        |
| コメント     | 武将にコメントできる                                      |
| ランキング   | いいね数/コメント数ランキング                             |
| フォロー     | ユーザーのフォロー、アンフォロー                          |
| マイページ   | 登録/いいね/コメントした武将一覧、フォロー/フォロワー一覧 |

## 使い方

### 武将検索（50 音）

- 登録されている戦国武将を`50音（あ行〜わ行）`で検索することができます。

  ![index](https://user-images.githubusercontent.com/105146615/204918007-0e2f2fc2-5331-40ba-886a-d6a2aea3f146.gif)

### 武将検索（出身地）

- 登録されている戦国武将を`出身地（都道府県別）`で検索することができます。

  ![prefecture](https://user-images.githubusercontent.com/105146615/204918036-d40a3699-050d-4341-9916-2c82eb583395.gif)

### マイページ

- 登録されているアカウント情報の確認・変更をすることができます。
- アカウント情報には`登録・いいね・コメントした武将`や`フォロー・フォロワー`を一覧で確認することができます。

  ![mypage](https://user-images.githubusercontent.com/105146615/204918063-db0e3c09-2096-424a-8db8-6df72d4487b9.gif)

# 4. 開発環境

## 使用技術

| 項目           | 内容                                                          |
| -------------- | ------------------------------------------------------------- |
| バックエンド   | Ruby 3.1.2                                                    |
| フレームワーク | Ruby on Rails 6.1.7                                           |
| フロントエンド | HTML/scss/JavaScript                                          |
| 主な gem       | device/kaminari/carrierwave/ransack/bootstrap/webpacker/debug |
| データベース   | PostgreSQL                                                    |
| コード解析     | RuboCop                                                       |
| コード管理     | GitHub                                                        |
| デプロイ       | Capistrano                                                    |
| インフラ       | AWS(VPC/RDS/EC2/Route 53/ACM/ALB/S3/IAM/CloudFront)           |

## インフラ構成図

![インフラ構成図.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/2674841/2c78d352-ed2b-1c71-271b-43a50728c1e2.png)

## ER 図

![ER図（個人）.drawio.png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/2674841/d16834c7-b495-66d4-5310-efac30948c2d.png)

## 画面遷移図

![画面遷移図（個人）.drawio (1).png](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/2674841/5253276b-7980-e671-1a4b-11df7682fd41.png)

# 5. 工夫した点

## N+1 問題の解消

- 武将やユーザー一覧を表示する際の SQL 発行回数や処理速度改善のため、ActiveRecord の`includes`メソッドを採用しました。
- `includes`は絞り込みが必要な時は例外を投げずに`eager_load`に fallback するため、絞り込みができない`preload`や複数のクエリで絞り込めない`eager_load`より運用しやすいと考えました。
- 注意点として、`associationが複数あるときは個別に最適化できない`ため、クエリのデータ量を判断しながら、今後も最適化していきたいです。
- 今回は`user.following`でフォロー一覧を取得し、`passive_relationships`の受動的関係を`includes`することで、N ＋ 1 問題を解決しました。

![n+1.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/2674841/71dd3dad-3468-56fa-d694-451788631261.gif)

## いいねを非同期処理

- いいねボタンをクリックした際に、ページ全体をリロードするのではなく、いいねボタンのみ変化する非同期処理を実現しました。
- Ajax を利用することで、JSON を使って非同期にサーバとの間の通信を行うため、web プラウザから、html ファイルのタグで囲った一部の情報をリクエストするので、それ以外の部分は変わらない仕様にしました。

![hidouki.gif](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/2674841/9055e8eb-887c-ab14-f700-81ecd3eca7a1.gif)

## 実務開発を想定

- **実務開発を想定し、現職でも利用している PDCA サイクルを意識して取り組みました。**

  `PLAN`：大・中・小目標に分類して、独自のガントチャートを作成し、進捗を管理しながら進めました。
   `DO`：とにかく手を動かすことを意識し、20 分考えても分からない場合はメンターへ質問しながら進めました。
   `CHECK`：入会しているスクールの週次ミーティングで進捗状況やアプリのレビューを行い、内容を修正しながら進めました。
   `ACTION`：レビューで指摘された点はもちろん、同様の点が他にもないか考えながら、修正していきました。

  ![jitumu.jpg](https://qiita-image-store.s3.ap-northeast-1.amazonaws.com/0/2674841/b21a7544-0aac-3bcd-e1ce-fbef1fd28a09.jpeg)

# 6. 今後の課題

## Amazon SES の導入

ログインのセキュリティ強化に繋がるメールアドレス認証のため、Amazon SES を導入します。

## Docker や CircleCI の導入

実際の開発を想定したインフラ環境に近づけるため、Docker や CircleCI を導入します。

## Google Maps API の導入

戦国武将を地図上で直感的に検索できるようにするため、Google Maps API を導入します。

以上です。ここまでご覧いただき、誠にありがとうございました。
a
