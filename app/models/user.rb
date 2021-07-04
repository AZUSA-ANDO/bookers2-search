class User < ApplicationRecord
  has_many :books, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  attachment :profile_image, destroy: false

  validates :introduction, presence: false, length: { maximum: 50 } # 自己紹介の最高文字数は50文字
  validates :name, length: {maximum: 20, minimum: 2}, uniqueness: true
  
  
  
def self.search(search,word)
        　　if search == "forward_match"
                        　　　@user = User.where("name LIKE?","#{word}%")
        　　elsif search == "backward_match"
                        　　　@user = User.where("name LIKE?","%#{word}")
        　　elsif search == "perfect_match"
                        　　@user = User.where(name: "#{word}")
                        　　　@user = User.where("name LIKE?","%#{word}%")
        　　else
                        　　　@user = User.all
            end　
end

  
  
end
