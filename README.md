# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false ,ユニーク制約|
| encrypted_password | string | null: false |
| nickname | string | null: false |
| last_name| string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
|birthday_year| string | null: false |
|birthday_month| string | null: false |
|birthday_day| string | null: false |


### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| item_name | string | null: false |
| item_information| text| null: false |
| item_condition | string | null: false |
| item_category| string | null: false |
| item_sender| string | null: false |
| item_shipping| string | null: false |
| item_delivery_days| string | null: false |
| item_price | integer | null: false |
| user | references | null: false,foreign_key: true |

### Association

- belongs to :user
- has_one :buyer

## buyers テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| zip| string | null: false |
| state| string | null: false |
| city | string | null: false |
| addressline1 | string | null: false |
| addressline2 | string |  
| tell | string | null: false |
| buyer  | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer