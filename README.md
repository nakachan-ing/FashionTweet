# README

## users テーブル
| Column        | Type          | Options     |
| ------------  | --------------| ----------- |
| first_name    | string        | null: false |
| last_name     | string        | null: false |
| nickname      | string        | null: false |
| email         | string        | null: false |
| password      | string        | null: false |
| introduction  | string        |             |
| profile_image | ActiveStorage |             |

### Association
- has_many :photos


## photos テーブル
| Column      | Type          | Options                        |
| ----------- | ------------- | ------------------------------ |
| snap        | ActiveStorage | null: false                    |
| title       | string        | null: false                    |
| description | string        | null: false                    |
| price_id    | integer       | null: false                    |
| user_id     | references    | null: false, foreign_key: true |

### Association
- belongs_to :user
- has_many :photo_tags
- has_many :tags, through: :photo_tags


## tags テーブル
| Column | Type    | Options     |
| ------ | ------- | ----------- |
| name   | integer | null: false |

### Association
- has_many :photo_tags
- has_many :photos, through: :photo_tags


## photo_tags テーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| photo_id | references | null: false, foreign_key: true |
| tag_id   | references | null: false, foreign_key: true |

### Association
- belongs_to :photo
- belongs_to :tag

## comments テーブル
| Column  | Type       | Options                        |
| ------  | :--------- | ------------------------------ |
| text    | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| photo   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_to :photo