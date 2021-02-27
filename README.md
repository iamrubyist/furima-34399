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
| email    | string | null: false |
| password | string | null: false |

## association
- has_many :markets
- has_many :comments

## markets　テーブル

| Column       | Type   | Options     |
| --------     | ------ | ----------- |
| item         | string | null: false |
| item_text    | text   | null: false |

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