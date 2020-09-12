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
| birthday        | string | null: false |

### Association

- has_many :items
- has_many :purcahses

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| image           | string     | null: false                    |
| name            | string     | null: false                    |
| content         | text       | null: false                    |
| category        | string     | null: false                    |
| item_status     | string     | null: false                    |
| delivery_fee    | string     | null: false                    |
| seller_area     | string     | null: false                    |
| days_to_ship    | string     | null: false                    |
| price           | integer    | null: false                    |
| user_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one : purchase

## purchases テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| sold_out        | boolean    | null: false                    |
| user_id         | references | null: false, foreign_key: true |
| item_id         | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :credit_card
- has_one :receive_address

## credit_cards テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| card_number     | string     | null: false                    |
| expiration_date | string     | null: false                    |
| security_cord   | string     | null: false                    |
| purchase_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase

## receive_addresses テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| postal_cord     | string     | null: false                    |
| prefecture      | string     | null: false                    |
| city            | string     | null: false                    |
| block_number    | string     | null: false                    |
| building        | string     |                                |
| phone_number    | string     | null: false                    |
| purchase_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase