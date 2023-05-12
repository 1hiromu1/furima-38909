# テーブル設計

## users テーブル

| Column             | Type   | Options      |
| ------------------ | ------ | ------------ |
| nickname           | string | null: false  |
| email              | string | unique: true |
| password           | string | null: false  |
| encrypted_password | string | null: false  |
| first_name         | string | null: false  |
| last_name          | string | null: false  |
| first_name_kana    | string | null: false  |
| last_name_kana     | string | null: false  |
| birth_date         | string | null: false  |


### Association

- has_many :items
- has_many :orders

## items テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| item_user        | references | foreign_key: true |
| item_name        | string     | null: false,      |
| item_description | text       | null: false,      |
| category         | string     | null: false,      |
| item_condition   | string     | null: false,      |
| delivery         | string     | null: false,      |
| region           | string     | null: false,      |
| days_to_Ship     | string     | null: false,      |
| price            | string     | null: false,      |


### Association

- has_one :orders
- belongs_to :users

## orders テーブル

| Column     | Type       | Options           |
| ---------- | ---------- | ----------------- |
| order_user | references | foreign_key: true |
| order_item | references | foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items
- has_one :informations

## informations テーブル

| Column           | Type       | Options           |
| ---------------- | ---------- | ----------------- |
| information_user | references | foreign_key: true |
| post_code        | string     | null: false       |
| prefectures      | string     | null: false       |
| municipalities   | string     | null: false       |
| address          | string     | null: false       |
| building_name    | string     | null: true        |
| telephone_number | string     | null: false       |


### Association

- belongs_to :orders
