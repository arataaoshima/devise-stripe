class Post < ApplicationRecord
  has_many :post_categories
  has_many :categories, through: :post_categories

  def self.search(search) #self.でクラスメソッドとしている
    if search # Controllerから渡されたパラメータが!= nilの場合は、titleカラムを部分一致検索
      Post.where(['title LIKE ?', "%#{search}%"])
    else
      Post.all #全て表示。
    end
  end
end
