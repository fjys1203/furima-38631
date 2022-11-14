# README

##users テーブル

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|name              |string|null: false              |
|nickname          |string|null: false              |
|email             |string|null: false, unique: true|
|password          |string|null: false              |
|encrypted_password|string|null: false              |
|birthday          |date  |null: false              |

### Association

- has_many :items
- has_many :records


##items テーブル

|Column            |Type   |Options     |
|------------------|-------|------------|
|item_name         |string |null: false | 
|item_text         |text   |null: false |
|category          |string |null: false |
|condition         |string |null: false |
|price             |integer|null: false |
|shopping_charge   |string |null: false |
|region            |string |null: false |
|days_for_send     |integer|null: false |

### Association

- belongs_to :user
- has_one :record

##records テーブル

|Column|Type      |Options                        |
|------|----------|-------------------------------|
|user  |references|null: false, foreign_key: true |
|item  |references|null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :buyer


##buyers テーブル

|Column        |Type   |Options    |
|--------------|-------|-----------|
|address       |string |null: false|
|postcode      |integer|null: false|
|prefecture    |string |null: false|
|municipalities|string |null: false|
|house_number  |integer|null: false|
|house_name    |string |null: false|
|phone_number  |integer|null: false|

### Association

- belongs_to :item
- belongs_to :record