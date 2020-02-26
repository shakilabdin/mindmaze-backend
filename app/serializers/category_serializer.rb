class CategorySerializer < ActiveModel::Serializer
  attributes :id, :name
end

class ShowCategorySerializer < CategorySerializer
  attributes :questions
end

