class PostResource < JSONAPI::Resource
  attributes :title, :body
  has_one :author, class_name: 'User', foreign_key: 'user_id'
end

module V2
  class PostResource < ::PostResource; end
end

class UserResource < JSONAPI::Resource
  attributes :first_name, :last_name, :full_name
  attribute :full_name

  has_many :posts

  filter :first_name

  def full_name
    "#{@model.first_name} #{@model.last_name}"
  end
end

