# == Schema Information
#
# Table name: mx_app_store_orders
#
#  id                                     :bigint(8)        not null, primary key
#  mx_app_store_id                        :bigint(8)
#  buyer_id( 买家)                          :bigint(8)
#  currency_id(支付币种)                      :bigint(8)
#  total(订单总价)                            :decimal(, )
#  items_total(商品总价)                      :decimal(, )
#  shipment_total(运费总价)                   :decimal(, )
#  number(订单编号)                           :string
#  state(订单状态)                            :string
#  memo(备注)                               :string
#  payment_started_at(发起支付时间)             :datetime
#  payment_expired_at(支付超时时间)             :datetime
#  payment_completed_at(支付完成时间)           :datetime
#  processing_shipment_started_at(开始发货时间) :datetime
#  shipment_shipped_at(发货时间)              :datetime
#  cancelled_at(订单取消时间)                   :datetime
#  completed_at(订单完成时间)                   :datetime
#  created_at                             :datetime         not null
#  updated_at                             :datetime         not null
#
# Indexes
#
#  index_mx_app_store_orders_on_buyer_id         (buyer_id)
#  index_mx_app_store_orders_on_currency_id      (currency_id)
#  index_mx_app_store_orders_on_mx_app_store_id  (mx_app_store_id)
#
# Foreign Keys
#
#  fk_rails_...  (buyer_id => mx_app_users.id)
#  fk_rails_...  (currency_id => currencies.id)
#  fk_rails_...  (mx_app_store_id => mx_apps.id)
#

require 'rails_helper'

RSpec.describe MxAppStoreOrder, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
