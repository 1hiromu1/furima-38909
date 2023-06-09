# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | unique: true, null: false |
| encrypted_password | string | null: false               |
| first_name         | string | null: false               |
| last_name          | string | null: false               |
| first_name_kana    | string | null: false               |
| last_name_kana     | string | null: false               |
| birth_date         | date   | null: false               |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| user              | references | foreign_key: true, null: false |
| item_name         | string     | null: false,                   |
| item_description  | text       | null: false,                   |
| category_id       | integer    | null: false,                   |
| item_condition_id | integer    | null: false,                   |
| delivery_id       | integer    | null: false,                   |
| prefecture_id     | integer    | null: false                    |
| days_to_ship_id   | integer    | null: false,                   |
| price             | integer    | null: false,                   |


### Association

- has_one :order
- belongs_to :user

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | foreign_key: true, null: false |
| item   | references | foreign_key: true, null: false |

### Association

- belongs_to :user
- belongs_to :item
- has_one :information

## informations テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| order            | references | foreign_key: true, null: false |
| post_code        | string     | null: false                    |
| prefecture_id    | integer    | null: false                    |
| municipalities   | string     | null: false                    |
| address          | string     | null: false                    |
| building_name    | string     |                                |
| telephone_number | string     | null: false                    |


### Association

- belongs_to :order
