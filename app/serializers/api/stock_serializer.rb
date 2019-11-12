class Api::StockSerializer < ActiveModel::Serializer
  attributes :id, :quantity, :cost, :status, :product, :created_at, :updated_at
end
