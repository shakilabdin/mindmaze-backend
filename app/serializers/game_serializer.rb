class GameSerializer < ActiveModel::Serializer
  attributes :id, :score, :user, :category
end
