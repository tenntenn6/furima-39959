##usersテーブル
| Column                | Type   | Options                  |
| --------------------- | ------ | -------------------------|
| nickname              | string | null: false              |
| email                 | string | null: false, unique: true|
| encrypted_password    | string | null: false              |
| family_name_sei       | string | null: false              |
| family_name_mei       | string | null: false              |
| family_name_kana_sei  | string | null: false              |
| family_name_kana_mei  | string | null: false              |
| birth                 | date   | null: false              |

### Association
- has_many :items
- has_many :purchases

  


##itemsテーブル
| Column             | Type      | Options                       |
| ------------------ | ----------| ------------------------------|
| name               | string    | null: false                   |
| status_id          | integer   | null: false                   |
| explanation        | text      | null: false                   |
| price              | integer   | null: false                   |
| prefecture_id      | integer   | null: false                   |
| category_id        | integer   | null: false                   |
| burden_id          | integer   | null: false                   |
| user               | references| null: false, foreign_key: true|


### Association
- belongs_to :user
- has_one :purchase
- has_one_attached :image




##purchasesテーブル
| Column             | Type       | Options                       |
| ------------------ | -----------| ------------------------------|
| user               | references | null: false, foreign_key: true|
| item               | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :item
- has_one    :destination






##destinationsテーブル
| Column             | Type          | Options                       |
| ------------------ | ------------- | ------------------------------|
| post_code          | string        | null: false                   |
| prefecture         | string        | null: false                   |
| cities             | string        | null: false                   |
| street_address     | string        | null: false                   |
| building           | string        |                               |
| telephone          | string        | null: false                   |
| purchase           | references    | null: false, foreign_key: true|

### Association
- belongs_to :purchase











