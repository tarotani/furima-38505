# テーブル設計

## usersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, UNIQUE            |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| second_name        | string     | null: false                    |
| first_name(kana)   | string     | null: false                    |
| second_name(kana)  | string     | null: false                    |
| birthday           | date       | null: false                    |

### Association
- has_many :items
- has_many :orders

## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | -----------| ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| price              | integer    | null: false                    |
| condition          | string     | null: false                    |
| postage            | string     | null: false                    |
| send_area          | string     | null: false                    |
| send_days          | string     | null: false                    |
| category           | string     | null: false                    |
| seller             | string     | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :order

## ordersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :ship

## shipsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postalcode         | integer    | null: false                    |
| add_1              | string     | null: false                    |
| add_2              | string     | null: false                    |
| add_3              | integer    | null: false                    |
| add_4              | string     | null: false                    |
| tel                | integer    | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association
- belongs_to :order