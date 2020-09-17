# テーブル設計

## users テーブル  

| Column          | Type   | Options     |
| --------------- | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false |
| passsword       | string | null: false |
| family_name     | string | null: false |
| first_name      | string | null: false |
| family_kananame | string | null: false |
| first_kananame  | string | null: false |
| birthday        | date   | null: false |

### Association

- has_many :items
- has_many :oders

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| name            | string     | null: false                    |
| content         | text       | null: false                    |
| category_id     | integer    | null: false                    |
| item_status_id  | integer    | null: false                    |
| delivery_fee_id | integer    | null: false                    |
| seller_area_id  | integer    | null: false                    |
| days_to_ship_id | integer    | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one : order

## orders テーブル

| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| user         | references | null: false, foreign_key: true |
| item         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :receive_address

## receive_addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_cord     | string     | null: false                    |
| prefecture      | integer    | null: false                    |
| city            | string     | null: false                    |
| block_number    | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| purchase        | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase