class Api::ProductSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :sale_price, :created_at, :updated_at
end
