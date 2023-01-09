# テーブル設計

## usersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, UNIQUE            |
| password           | string     | null: false                    |
| name               | string     | null: false                    |
| birthday           | string     | null: false                    |

### Association
- has_many :items
- has_many :historys

## itemsテーブル
| Column             | Type       | Options                        |
| ------------------ | -----------| ------------------------------ |
| name               | string     | null: false                    |
| text               | text       | null: false                    |
| category           | string     | null: false                    |
| price              | integer    | null: false                    |
| seller             | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_one :history

## ordersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| buyer              | string     | null: false                    |
| name               | string     | null: false                    |
| user_id            | references | null: false, foreign_key: true |
| item_id            | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :ship

## shipsテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postalcode         | integer    | null: false                    |
| add                | string     | null: false                    |
| tel                | integer    | null: false                    |
| order_id           | references | null: false, foreign_key: true |

### Association
- belongs_to :order