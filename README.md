# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| email              | string | null: false ,unique: true|
| encrypted_password | string | null: false |
| nickname | string | null: false |
| last_name| string | null: false |
| first_name | string | null: false |
| last_name_kana | string | null: false |
| first_name_kana | string | null: false |
|birthday| date | null: false |



### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name | string | null: false |
| information| text| null: false |
| condition_id | integer| null: false |
| category_id|  integer | null: false |
| state_id|  integer| null: false |
| shipping_id|  integer | null: false |
| delivery_day_id|  integer| null: false |
| item_price | integer | null: false |
| user | references | null: false,foreign_key: true |

### Association

- belongs to :user
- has_one :buyer
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :state
- belongs_to_active_hash :shipping
- belongs_to_active_hash :delivery_days

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
| state_id|  integer| null: false |
| city | string | null: false |
| addressline1 | string | null: false |
| addressline2 | string |  
| tell | string | null: false |
| buyer  | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer
- belongs_to_active_hash :state