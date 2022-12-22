class Post < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  validates :title, presence: true
  validates :language, presence: true
  validates :content, presence: true
  
  enumerize :language, in: {
    Cplus: 0,
    Python: 1,
    Java: 2,
    C: 3,
    Ruby: 4,
    Csharp: 5,
    Haskell: 6,
    Rust: 7,
    Other: 99,
  }
  
end
