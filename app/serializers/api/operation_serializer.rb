class Api::OperationSerializer < ActiveModel::Serializer
  attributes :id, :kind, :quantity, :unit_price, :discount, :total_value, :release_date, :status, :trade, :product, :created_at, :updated_at
end
