# テーブル設計

## usersテーブル
| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| nickname           | string     | null: false                    |
| email              | string     | null: false, unique: true      |
| encrypted_password | string     | null: false                    |
| first_name         | string     | null: false                    |
| second_name        | string     | null: false                    |
| first_name_kana    | string     | null: false                    |
| second_name_kana   | string     | null: false                    |
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
| condition_id       | integer    | null: false                    |
| postage_id         | integer    | null: false                    |
| send_area_id       | integer    | null: false                    |
| send_day_id        | integer    | null: false                    |
| category_id        | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
# ActiveHash（プルダウン形式）を使用するカラムは、カラム名(単数系)の末尾に「_id」をつける
# ActiveHashファイルに対応するid番号が保存されるので、カラムの型は整数型になる


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
| postalcode         | string     | null: false                    |
| first_add_id       | integer    | null: false                    |
| second_add         | string     | null: false                    |
| address            | string     | null: false                    |
| building           | string     |                                |
| tel                | string     | null: false                    |
| order              | references | null: false, foreign_key: true |

### Association
- belongs_to :order