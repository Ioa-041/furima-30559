# README

## usersテーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birth_year      | date   | null: false |
| birth_month     | date   | null: false |
| birth_day       | date   | null: false |

### Association
- has_many :items
- has_many :buyers

## itemsテーブル

| Column              | Type       | Options           |
| ------------------- | ---------- | ----------------- |
| name                | string     | null: false       |
| explain             | text       | null: false       |
| category            | string     | null: false       |
| sales_status        | string     | null: false       |
| shipping_fee_status | string     | null: false       |
| prefecture          | string     | null: false       |
| scheduled           | string     | null: false       |
| price               | integer    | null: false       |
| user                | references | foreign_key: true |

### Association
- belongs_to :user
- has_many :buyers

## buyersテーブル

| Column         | Type       | Options           |
| -------------- | ---------- | ----------------- |
| card_number    | integer    | null: false       |
| card_exp_month | integer    | null: false       |
| card_exp_year  | integer    | null: false       |
| card_cvv       | integer    | null: false       |
| user           | references | foreign_key: true |
| item           | references | foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :shopping_address

## shopping_addressesテーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | integer | null: false |
| prefecture   | string  | null: false |
| city         | string  | null: false |
| address      | string  | null: false |
| building     | string  |             |
| phone_number | integer | null: false |

### Association
- belongs_to :buyer