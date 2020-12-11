class Post < ApplicationRecord
  validates :content, {presence: true, length: {maximum: 300}}
  validates :user_id, {presence: true}
  
  def user
    return User.find_by(id: self.user_id)
  end
  def self.search(search) #self.はUser.を意味する
    if search
      where(['content LIKE ?', "%#{search}%"]) #検索とuseanameの部分一致を表示。
    else
      all #全て表示させる
   end
  end

end

