class Post < ApplicationRecord

  def self.order_list(sort_order)
    if sort_order == "latest" || sort_order.blank?
      order(created_at: :desc)
    elsif sort_order == "title"
      order(title: :asc)
    else
      order(created_at: :asc)
    end
  end
end