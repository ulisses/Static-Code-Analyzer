# == Schema Information
# Schema version: 20110102170455
#
# Table name: functions
#
#  id         :integer         not null, primary key
#  func       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Function < ActiveRecord::Base
  attr_accessible :func
  
  validates :func, :presence=>true, :length => { :maximum => 200 }
end
