# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| email    | string | null: false |
| password | string | null: false |
| name     | string | null: false |
| profile  | text   | null: false |
|occupation| text   | null: false |
| position | text   | null: false |

### Association
- has_many :comment_users
- has_many :comments, through: comment_users
- has_many :prototype_users
- has_many :prototypes, through: prototype_users

## comments テーブル

| Column   | Type     | Options     |
| -------- | -------- | ----------- |
| text     | text     | null: false |
| user     |references| null: false |
| prototype|references| null: false |

### comment_users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| comment| references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :comment


## prototypes テーブル

| Column   | Type     | Options     |
| -------- | -------- | ----------- |
| title    | string   | null: false |
|catch_copy| text     | null: false |
| concept  | text     | null: false |
| user     |references| null: false |
| user     |ActiveStorageで実装     |

### Association
- has_many :comment_prototypes
- has_many :comments, through: comment_prototypes

### comment_users テーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| prototype| references | null: false, foreign_key: true |
| comment  | references | null: false, foreign_key: true |

### Association

- belongs_to :prototype
- belongs_to :comment