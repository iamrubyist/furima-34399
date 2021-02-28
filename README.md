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

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| first_name         | string | null: false                |
| last_name          | string | null: false                |
| first_name_jap     | string | null: false                |
| last_name_jap      | string | null: false                |
| email              | string | null: false , unique: true |
| encrypted_password | string | null: false                |
| birthday           | date   | null: false                |

## association
- has_many :markets
- has_many :comments
- has_many :buy_markets

## markets　テーブル

| Column         | Type         | Options                      |
| -------------- | ------------ | ---------------------------- |
| name           | string       | null: false                  |
| item_text      | text         | null: false                  |
| user           | references   | null: false foreign_key: true|
| category _id   | integer      | null: false                  |
| item_status_id | integer      | null: false                  |
| delivery_id    | integer      | null: false                  |
| area_id        | integer      | null: false                  |
| days_to_ship_id| integer      | null: false                  |
| price          | integer      | null: false                  |
## association
- belongs_to :user
- belongs_to :comments
- has_one :buy_market

## comments テーブル

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| comments        | string | null: false |

# association
- belongs_to :user
- belongs_to market

## buy_markets テーブル
| Column        | Type       | Options                      |
| ------------- | ---------- | ---------------------------- |
| market        | references | null: false foreign_key: true|
| user          | references | null: false foreign_key: true|
## association
- belongs_to :user
- belongs_to :market
- has_one :shopping_address

## shopping_address テーブル
| Column           | Type       | Options                      |
| ---------------- | ---------- | ---------------------------- |
| postal_code_id   |  string    | null: false                  |
| prefectures_id   |  integer   | null: false                  |
| municipality     |  string    | null: false                  |
| address          |  string    | null: false                  |
| phone_number     |  string    | null: false                  |
| building_name    |  string    |                              |
| buy_market       | reference  | null: false foreign_key: true|
## association 
- belongs_to :buy_market