# == Schema Information
#
# Table name: mx_app_users
#
#  id         :bigint(8)        not null, primary key
#  mx_app_id  :bigint(8)
#  user_id    :bigint(8)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_mx_app_users_on_mx_app_id  (mx_app_id)
#  index_mx_app_users_on_user_id    (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (mx_app_id => mx_apps.id)
#  fk_rails_...  (user_id => users.id)
#

class CircleAppUser < MxAppUser
  belongs_to :circle_app, foreign_key: 'mx_app_id'

  has_one :membership, class_name: 'CircleAppUserMembership'

  after_create :create_membership

  def owner?
    user == circle_app.owner
  end

  def member?
    membership.activated?
  end
end
