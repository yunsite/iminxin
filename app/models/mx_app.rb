# == Schema Information
#
# Table name: mx_apps
#
#  id                            :bigint(8)        not null, primary key
#  owner_id                      :bigint(8)
#  type                          :string
#  number(编号)                  :string
#  deleted_at(软删)              :datetime
#  client_id                     :string
#  client_secret                 :string
#  session_id                    :string
#  pin_token                     :string
#  private_key                   :text
#  raw(mixin 返回的 profile)     :json
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  audited_at(mixin账号审核时间) :datetime
#
# Indexes
#
#  index_mx_apps_on_number    (number) UNIQUE
#  index_mx_apps_on_owner_id  (owner_id)
#
# Foreign Keys
#
#  fk_rails_...  (owner_id => users.id)
#

class MxApp < ApplicationRecord
  include Numbering
  include SoftDeletable

  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'

  validates :client_id, presence: true
  validates :client_secret, presence: true
  validates :session_id, presence: true
  validates :pin_token, presence: true
  validates :private_key, format: { with: /\A-----BEGIN RSA PRIVATE KEY-----/i }

  to_param :number

  def name
    raw&.fetch('full_name', nil)
  end

  def identity_number
    raw&.fetch('identity_number', nil)
  end

  def avatar_url
    raw&.fetch('avatar_url', nil)
  end

  def mixin_api
    MixinBot::API.new({
      client_id: client_id,
      client_secret: client_secret,
      session_id: session_id,
      pin_token: pin_token,
      private_key: private_key
    })
  end

  def audit!
    r = mixin_api.read_me
    if r['error'].present?
      update! audited_at: nil
    else
      update! raw: r['data']
      touch :audited_at
    end
  end

  def audited?
    audited_at?
  end
end