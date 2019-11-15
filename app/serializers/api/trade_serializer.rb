class Api::TradeSerializer < ActiveModel::Serializer
  attributes :id, :kind, :discount, :total_value, :release_date, :status, :operations, :user, :created_at, :updated_at
end
