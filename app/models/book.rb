class Book < ApplicationRecord

    validates :title, presence: true
    validates :author, presence: true
    validates :is_borrowed, inclusion: { in: [true, false] }
  
   
  end
  