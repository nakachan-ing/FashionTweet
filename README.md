# README
[**English**](README_EN.md)
## アプリ名
### FashionTweet
--------------------------------------
## 概要
### FashionTweetはBaby, Kids向けのコーディネート検索サイトである。 ユーザー登録の有無にかかわらず、すべての利用者は投稿一覧と詳細閲覧とスナップの検索が可能となっている。 外部サイトにアクセスしてアイテムを検索することも可能である。 登録ユーザーのみがスナップを投稿、編集、削除及びコメントの投稿、削除が可能だ。 SNS認証によるログインにも対応しており、GoogleとFacebookがサポート対象である。
--------------------------------------
## 本番環境
###
--------------------------------------
## 制作背景
### 大人向けのファッションサイトは数多く存在し、コーディネートの検索がしやすいですが、子供向けに特化したサイトは検索しても結果にヒットするものが少ないことが今回の制作背景である。
### 利用対象者は下記のように想定している。
- 20代から30代の母親とそのパートナー
- 共働きもしくは一人親世帯
- ユーザー自身が服が好き
### そして、
- 仕事中のスキマ時間や休憩時間に暇潰しでスマホを見る時
- 子どもと自宅で過ごしているときのコミュニケーションツールの一つとして
- 実際に店頭に行かずにコーディネートを考えたい時
### といった時に利用してもらえるよう制作した。
### そして、このアプリケーション一つで、子供の成長に合わせて、性別、価格、アイテム、フリーワードなどのさまざまな条件で服を検索できるようにしている。
--------------------------------------
## 要件定義
### ユーザー機能
- ログインすることによって、スナップの投稿やコメント投稿、スナップ編集、削除などを可能にする
### マイページ機能
- ユーザー自身が投稿したスナップの一覧表示やプロフィールを表示することを可能にする
### スナップ投稿機能
- スナップの投稿を可能にする
### スナップ一覧表示機能
- ユーザー以外もスナップ閲覧できることを可能にする
- ある程度のカテゴリにあらかじめ分けておいて、カテゴリの一覧表示されることを可能にする
### スナップ詳細表示機能
- 投稿されたスナップの詳細が表示されることを可能にする
### スナップ編集機能
- スナップの編集を可能にする
### スナップ削除機能
- スナップの削除を可能にする
### スナップ検索機能
- 複数条件を指定した上で参考にしたいスナップの検索を可能にする
### コメント投稿機能
- スナップ投稿者に対して、コーディネートに対する質問、コメントを可能にする
### コメント削除機能
- 投稿済みのコメントの削除を可能にする
### SNS認証
- SNSアカウント（Googleアカウン、Facebookアカウント）を利用したログイン方法を選択肢として追加する
--------------------------------------
## DEMO
### トップページ（スナップ一覧表示画面）
[![Image from Gyazo](https://i.gyazo.com/d0a8eb301deb108cafb2a2b0de1987d4.gif)](https://gyazo.com/d0a8eb301deb108cafb2a2b0de1987d4)
- ログインの有無に関わらず、スナップ一覧の閲覧は可能である。
- ヘッダー、サイドバー部分には様々な条件で検索できるよう項目表示している。

### トップページ（スナップ検索表示）
[![Image from Gyazo](https://i.gyazo.com/93e24a46f1c2af72fe7a320a40946b5c.gif)](https://gyazo.com/93e24a46f1c2af72fe7a320a40946b5c)
- ログインの有無に関わらず、スナップの検索は可能である。
- ジャンル、値段、外部サイト、タグ、フリーワードでスナップの検索を可能にしている。

### 新規登録画面
[![Image from Gyazo](https://i.gyazo.com/94512ef5462bf7f82ff7fad1e395a6a3.gif)](https://gyazo.com/94512ef5462bf7f82ff7fad1e395a6a3)
- first_name, last_name, email, passwordを全て正しく入力すると新規登録ができる。
- いずれの項目が空もしくは正しく入力されていない時は新規登録できない。

### マイページ画面（詳細表示、編集表示画面）
[![Image from Gyazo](https://i.gyazo.com/cc77cf68f8b4b372b6bb0243d7bdfacd.gif)](https://gyazo.com/cc77cf68f8b4b372b6bb0243d7bdfacd)
[![Image from Gyazo](https://i.gyazo.com/e7eeded143ce9335d6de6cab620332b9.gif)](https://gyazo.com/e7eeded143ce9335d6de6cab620332b9)
- マイページではfirst_name, last_name, email, introductionが編集、更新できるようになっている。
### スナップ新規投稿画面
[![Image from Gyazo](https://i.gyazo.com/8aa6c3e576007b83a61f9de691a2ff88.gif)](https://gyazo.com/8aa6c3e576007b83a61f9de691a2ff88)
[![Image from Gyazo](https://i.gyazo.com/ef5dc4ccceb8566c9d607512ad1c4949.gif)](https://gyazo.com/ef5dc4ccceb8566c9d607512ad1c4949)
- 全ての項目を正しく入力すると新規投稿ができる
- 新規投稿画面でタグの新規登録も可能である。
### スナップ詳細画面
[![Image from Gyazo](https://i.gyazo.com/30b81b59e61016bc766b8cd22224eff1.gif)](https://gyazo.com/30b81b59e61016bc766b8cd22224eff1)
### スナップ編集画面
[![Image from Gyazo](https://i.gyazo.com/e68c9d72c123a728ac82663e25c8d039.gif)](https://gyazo.com/e68c9d72c123a728ac82663e25c8d039)
### スナップ削除画面
[![Image from Gyazo](https://i.gyazo.com/c325e9191251e0735e04bcab1290e558.gif)](https://gyazo.com/c325e9191251e0735e04bcab1290e558)
### コメント投稿画面
[![Image from Gyazo](https://i.gyazo.com/1b147edc0641d88bbe6f6e3a67322e5c.gif)](https://gyazo.com/1b147edc0641d88bbe6f6e3a67322e5c)
### 投稿削除画面
[![Image from Gyazo](https://i.gyazo.com/60909269e4147f06c0d98509cd838030.gif)](https://gyazo.com/60909269e4147f06c0d98509cd838030)

--------------------------------------
## 使用技術（開発環境）
### バックエンド
- Ruby, Ruby on Rails

--------------------------------------
### フロントエンド
- HTML, CSS, JavaScript, JQuery, Ajax

--------------------------------------
### データベース
- MySQL, SequelPro

--------------------------------------
### インフラ
--------------------------------------
### Webサーバ（本番環境）
--------------------------------------
### アプリケーションサーバ（本番環境）
--------------------------------------
### ソース管理
- Github, GitHubDesktop

--------------------------------------
### テスト
- RSpec

--------------------------------------
### エディタ
- VSCode

--------------------------------------
## DB設計
[![Image from Gyazo](https://i.gyazo.com/4a621b7ec7b29ce76f3026b8c0e1857e.png)](https://gyazo.com/4a621b7ec7b29ce76f3026b8c0e1857e)

### users table
| Column        | Type          | Options     |
| ------------  | --------------| ----------- |
| first_name    | string        | null: false |
| last_name     | string        | null: false |
| nickname      | string        | null: false |
| email         | string        | null: false |
| password      | string        | null: false |
| introduction  | string        |             |
| profile_image | ActiveStorage |             |

### Association
- has_many :photos
- has_many :comments


### photos table
| Column      | Type          | Options                        |
| ----------- | ------------- | ------------------------------ |
| snap        | ActiveStorage | null: false                    |
| title       | string        | null: false                    |
| description | string        | null: false                    |
| price_id    | integer       | null: false                    |
| user_id     | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :photo_tags
- has_many :tags, through: :photo_tags
- has_many :comments


### tags table
| Column | Type    | Options     |
| ------ | ------- | ----------- |
| name   | integer | null: false |

### Association
- has_many :photo_tags
- has_many :photos, through: :photo_tags


### photo_tags table
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| photo_id | references | null: false, foreign_key: true |
| tag_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :photo
- belongs_to :tag

### comments table
| Column  | Type       | Options                        |
| ------  | :--------- | ------------------------------ |
| text    | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| photo   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :photo

--------------------------------------
## How to work in the local environment