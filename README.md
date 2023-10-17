##userテーブル

| Column             | Type   | Options                  |
| ------------------ | ------ | --------------           |
| nickname               | string | null: false, unique: true|
| email              | string | null: false              |
| encrypted_password | string | null: false              |
| profile            | text   | null: false              |
| occupation         | text   | null: false              |
| position           | text   | null: false              |

### Association
- has_many :prototypes
- has_many :comments
