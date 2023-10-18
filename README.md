##userテーブル
| Column                | Type   | Options                  |
| --------------------- | ------ | -------------------------|
| nickname              | string | null: false              |
| email                 | string | null: false, unique: true|
| encrypted_password    | string | null: false              |
| family_name(sei)      | string | null: false              |
| family_name(mei)      | string | null: false              |
| family_name(kana,sei) | string | null: false              |
| family_name(kana,mei) | string | null: false              |
| birth                 | date   | null: false              |

### Association
- has_many :items
- has_many :purchase

  


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




##purchaseテーブル
| Column             | Type       | Options                       |
| ------------------ | -----------| ------------------------------|
| user               | references | null: false, foreign_key: true|
| item               | references | null: false, foreign_key: true|

### Association
- belongs_to :user
- has_one :destination






##destinationテーブル
| Column             | Type          | Options                       |
| ------------------ | ------------- | ------------------------------|
| post_code          | string        | null: false, unique: true     |
| prefecture         | string        | null: false                   |
| cities             | string        | null: false                   |
| street_address     | text          | null: false                   |
| building           | string        |                               |
| telephone          | string        | null: false                   |

### Association
- belongs_to :purchase







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