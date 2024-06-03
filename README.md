# テーブル設計

## users テーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |


### Association

- has_many :records

## records テーブル

| Column                | Type        | Options                        |
| ------------------    | ------      | -----------                    |
| content               | text        | null: false                    |
| prefecture_id         | integer     | null: false                    |
| user                  | references  | null: false, foreign_key: true |
