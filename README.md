# README

##users テーブル

|Column            |Type  |Options                  |
|------------------|------|-------------------------|
|last_name         |string|null: false              |
|first_name        |string|null: false              |
|last_name_kana    |string|null: false              |
first_name_kana    |string|null: false              |
|nickname          |string|null: false              |
|email             |string|null: false, unique: true|
|encrypted_password|string|null: false              |
|birthday          |date  |null: false              |

### Association

- has_many :items
- has_many :records


##items テーブル

|Column            |Type      |Options          |
|------------------|----------|-----------------|
|item_name         |string    |null: false      | 
|item_text         |text      |null: false      |
|category_id       |integer   |null: false      |
|condition_id      |integer   |null: false      |
|shopping_charge_id|integer   |null: false      |
|prefecture_id     |integer   |null: false      |
|days_for_send_id  |integer   |null: false      |
|price             |integer   |null: false      |
|user              |references|foreign_key: true|

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

|Column        |Type      |Options          |
|--------------|----------|-----------------|
|address       |string    |null: false      |
|postcode      |string    |null: false      |
|prefecture_id |integer   |null: false      |
|city          |string    |null: false      |
|block         |string    |null: false      |
|building      |string    |                 |
|phone_number  |string    |null: false      |
|record        |references|foreign_key: true|

### Association

- belongs_to :record