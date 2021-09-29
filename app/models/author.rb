class Author < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true
    validates :introduction, length: { maximum: 140 }
end
