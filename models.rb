class User < ActiveRecord::Base
  has_many :posts

  def fullname
  	return "#{fname} #{lname}"
  end
end

class Post < ActiveRecord::Base
	belongs_to :user
end
