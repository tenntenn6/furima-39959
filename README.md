##userテーブル
| Column             | Type   | Options                  |
| ------------------ | ------ | -------------------------|
| nickname           | string | null: false, unique: true|
| email              | string | null: false              |
| encrypted_password | string | null: false              |
| family_name        | string | null: false              |
| family_name(kana)  | string | null: false              |
| birth              | string | null: false              |

### Association
- has_many :items
- has_one :destination

  


##itemテーブル
| Column             | Type      | Options                       |
| ------------------ | ----------| ------------------------------|
| name               | text      | null: false, unique: true     |
| status             | string    | null: false                   |
| explanation        | text      | null: false                   |
| price              | string    | null: false                   |
| shipping_sources   | text      | null: false                   |
| user               | references| null: false, foreign_key: true|
| category           | references| null: false, foreign_key: true|
| brand              | references| null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :category
- belongs_to :brand
- has_one_attached :image





##destinationテーブル
| Column             | Type          | Options                       |
| ------------------ | ------------- | ------------------------------|
| post_code          | string        | null: false, unique: true     |
| prefecture         | string        | null: false                   |
| cities             | string        | null: false                   |
| street_address     | text          | null: false                   |
| building           | text          | null: false                   |
| telephone          | text          | null: false                   |
| shipping_date      | text          | null: false                   |
| user               | references    | null: false, foreign_key: true|

### Association
- belongs_to :user






##categoryテーブル
| Column             | Type       | Options                       |
| ------------------ | -----------| ------------------------------|
| category           | string     | null: false                   |
| item               | references | null: false, foreign_key: true|

### Association
- has_many :items





##brandテーブル
| Column             | Type       | Options                       |
| ------------------ | -----------| ------------------------------|
| brand              | string     | null: false                   |
| item               | references | null: false, foreign_key: true|

### Association
- has_many :items