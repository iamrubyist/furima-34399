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
# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | unique:true | null: false |
| password | encrypted_password | null: false |
| last_name | string | null: false |
| name_jap | string | null: false |
| last_name_jap | string | null: false |
| birthday | string | null: false |

## association
- has_many :markets
- has_many :comments

## markets　テーブル

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| item         | string | null: false |
| item_text    | text   | null: false |
| user_id      | text   | null: false |
## association
- belongs_to :user
- belongs_to :message

## comments テーブル

| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| comments        | string | null: false |

# association
- belongs_to :user
- belongs_to market

## buy_markets テーブル
| Column          | Type   | Options     |
| --------        | ------ | ----------- |
| buy_markets        | string | null: false |
