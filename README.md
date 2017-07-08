## users_groupsテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## usersテーブル(gemのdeviseで実装)
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foregin_key: true|
|name|string|null: false|
|email|string|null: false|

### Association
- has_many :users_groups
- has_many :messages
- has_many :groups, through: :users_groups

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foregin_key: true|
|name|string|null: false|

### Association
- has_many :users_groups
- has_many :messages
- has_many :users, through: :users_groups

## messeagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|image|string||
|group_id|integer|null: false, foregin_key: true|
|user_id|integer|null: false, foregin_key: true|

### Association
- belongs_to :user
- belongs_to :group
