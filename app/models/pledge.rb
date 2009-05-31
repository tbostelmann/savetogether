# == Schema Information
# Schema version: 20090422073021
#
# Table name: invoices
#
#  id                 :integer(4)      not null, primary key
#  donor_id           :integer(4)
#  type               :string(255)
#  notification_email :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#

class Pledge < Invoice
  validates_email_format_of :notification_email
  validates_confirmation_of :notification_email, :message => "should match confirmation"
end
