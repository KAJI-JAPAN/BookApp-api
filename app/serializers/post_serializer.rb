class PostSerializer < ActiveModel::Serializer
  attributes :id, :title, :author, :image
end
