class Stock < ApplicationRecord
  CATEGORIES = ["肉類", "魚介類", "野菜", "果物", "乳製品", "調味料", "飲料", "菓子類", "その他"]

  belongs_to :user

  validates :name, presence: true, length: { maximum: 100 }

  validates :quantity, presence: true

  validates :expiration_date, presence: true
end
