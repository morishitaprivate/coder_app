class Post < ApplicationRecord
  belongs_to :user
  
  has_many :post_comments, dependent: :destroy
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :language, presence: true
  validates :content, presence: true
  
  enumerize :language, in: {
    cplus: 0,
    python: 1,
    java: 2,
    c: 3,
    ruby: 4,
    csharp: 5,
    haskell: 6,
    rust: 7,
    other: 99,
  }
  
end
