## membersテーブル

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :group
- belongs_to :user
- has_many :messages

## userテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foregin_key: true|
|user_name|text|null: false|
|mail|text|null: false|

### Association
- has_many :members

## groupテーブル
|Column|Type|Options|
|------|----|-------|
|group_id|integer|null: false, foregin_key: true|
|gropu_name|text|null: false|

### Association
- has_many :members

## messeageテーブル
|Column|Type|Options|
|------|----|-------|
|messeage|text|null: false|
|image|string||
|group_id|integer|null: false, foregin_key: true|
|user_id|integer|null: false, foregin_key: true|

### Association
- belongs_to :members
