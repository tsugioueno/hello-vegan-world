# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

アプリケーション名:HelloVeganWorld

アプリケーション概要:Vegan（ヴィーガン：完全菜食主義者）に興味がある方。ダイエットや食生活改善を考えている方。市場が拡大している分野に興味がある方。
ニッチな分野への検索や商品紹介、購入の総合サイト。

URL:デプロイしたURL

テスト用アカウント
ID:admin
PASS:2222

利用方法：
目指した課題解決：
洗い出した要件：
実装した機能についてのGIFと説明：
実装予定の機能：
データベース設計：

# テーブル設計
## articles テーブル
| Column         | Type   | Options     |
| ---------------| ------ | ----------- |
| product_name   | string | null: false |
| produce_text   | text   | null: false |
| item           | references | foreign_key: true |
- belongs_to :item

## users テーブル
| Column         | Type   | Options     |
| ---------------| ------ | ----------- |
| nick_name      | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| last_name      | string | null: false |
| first_name     | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana| string | null: false |
| birthday       | data   | null: false |
### Association
- has_many :items
- has_many :item_purchases

## items テーブル
| Column              | Type       | Options     |
| --------------------| -----------| ----------- |
| product_name        | string     | null: false |
| product_text        | text       | null: false |
| category_id         | integer    | null: false |
| product_condition_id| integer    | null: false |
| shipping_charges_id | integer    | null: false |
| shipping_area_id    | integer    | null: false |
| days_to_ship_id     | integer    | null: false |
| price               | integer    | null: false |
| user                | references | foreign_key: true |
### Association
- belongs_to :user
- has_many :item_purchases
- belongs_to_active_hash :category
- belongs_to_active_hash :product_condition
- belongs_to_active_hash :shipping_charges
- belongs_to_active_hash :shipping_area
- belongs_to_active_hash :days_to_ship

## buyers テーブル
| Column                 | Type       | Options     |
| -----------------------| -----------| ----------- |
| postal_code            | string     | null: false |
| shipping_area_id       | integer    | null: false |
| city                   | string     | null: false |
| addresses              | string     | null: false |
| building_name          | string     |             |
| phone_number           | string     | null: false |
| item_purchase          | references | null: false, foreign_key: true |
- belongs_to :item_purchase
- belongs_to_active_hash :prefectures

## item_purchases テーブル　
| user              | references | null: false, foreign_key: true |
| item              | references | null: false, foreign_key: true |
- belongs_to :user
- belongs_to :item
- has_one :buyer



ローカルでの動作方法：
