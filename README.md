## users テーブル

| Column              | Type    | Options     |
| ------------------- | ------- | ----------- |
| nickname            | string  | null: false |
| email               | string  | null: false |
| encrypted_password  | string  | null: false |
| last_name           | string  | null: false |
| first_name          | string  | null: false |
| prefecture_code_id  | integer | null: false |

### Association

- has_many :tweets
- has_many :comments

## tweets テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| image      |            | null: false                    |
| text       | text       | null: false                    |
| user_id    | integer    | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many   :comments
- has_many   :tweet_tag_relations
- has_many   :tags, through: :tweet_tag_relations

## tags テーブル

| Column   | Type    | Options                        |
| -------  | ------- | ------------------------------ |
| name     | string  | null: false, uniqueness: true  |

### Association
- has_many :tweet_tag_relations
- has_many :tweets, through: :tweet_tag_relations


## tweet_tag_relations テーブル

| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| tweet_id   | references | null: false, foreign_key: true |
| tag_id     | references | null: false, foreign_key: true |

### Association

- belongs_to :tweet
- belongs_to :tag

## comments テーブル

| Column   | Type       | Options                        |
| -------  | ---------- | ------------------------------ |
| text     | text       | null: false                    |
| user_id  | integer    | null: false, foreign_key: true |
| tweet_id | integer    | null: false, foreign_key: true |

### Association
- belong_to :user
- belong_to :tweet

