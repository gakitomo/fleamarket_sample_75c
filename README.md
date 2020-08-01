## usersテーブル

|Column|Type|Options|
|------|----|-------|
|nickname|string|null:false|
|email|string|null:false,unique:true|
|password|string|null:false|
|password_confirm|string|null:false|
|family_name|string|null:false|
|given_name|string|null:false|
|family_name_kana|string|null:false|
|given_name_kana|string|null:false|
|birthday|date|null:false|

### Association
- has_many :items, dependent: :destroy
- has_many :payments, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :addresses, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :points, dependent: :destroy

## addressesテーブル
|Column|Type|Options|
|------|----|-------|
|address_family_name|string|null:false|
|address_given_name|string|null:false|
|address_family_name_kana|string|null:false|
|address_given_name_kana|string|null:false|
|postal_code|string|null:false|
|prefecture|string|null:false|
|city|string|null:false|
|town|string|null:false|
|building|string||
|telephone|string|null:false|
|user|references|null:false,foreign_key:true|

### Association
- belongs_to :user
- belongs_to_active_hash :prefecture

## itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null:false|
|description|text|null:false|
|category|string|null:false|
|brand|string||
|condition|string|null:false|
|shipping_burden|string|null:false|
|shipping_method|string|null:false|
|shipping_area|string|null:false|
|shipping_date|integer|null:false|
|price|integer|null:false|
|user|references|null:false,foreign_key:true|

### Association
- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :item_images, dependent: :destroy
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_burden
- belongs_to_active_hash :shipping_method
- belongs_to_active_hash :prefecture


## item_imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image|text|null:false|
|item|references|null:false,foreign_key:true|

### Association
- belongs_to :item

## paymentsテーブル
|Column|Type|Options|
|------|----|-------|
|nominee|string|null:false|
|brand|string|null:false|
|card_number|integer|null:false,unique:true|
|expiration_month|integer|null:false|
|expiration_year|integer|null:false|
|serurity_code|integer|null:false|
|user|references|null:false,foreign_key:true|

### Association
- belongs_to :user

## pointsテーブル
|Column|Type|Options|
|------|----|-------|
|point|integer||
|user|references|null:false,foreign_key:true|

### Association
- belongs_to :user

## likesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null:false,foreign_key:true|
|item|references|null:false,foreign_key:true|

### Association
- belongs_to :user
- belongs_to :item

## commentsテーブル
|Column|Type|Options|
|------|----|-------|
|text|text|null:false|
|user|references|null:false,foreign_key:true|
|item|references|null:false,foreign_key:true|

### Association
- belongs_to :user
- belongs_to :item