## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user

## usersテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foregin_key: true|
|name|string|null: false|
|email|string|null: false|

### Association
- has_many :members
- has_many :messages
- has_many :groups, through: :members

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|id|integer|null: false, foregin_key: true|
|name|string|null: false|

### Association
- has_many :members
- has_many :messages
- has_many :users, through: :members

## messeagesテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null: false|
|image|string||
|group_id|integer|null: false, foregin_key: true|
|user_id|integer|null: false, foregin_key: true|

### Association
- belongs_to :user
- belongs_to :group
