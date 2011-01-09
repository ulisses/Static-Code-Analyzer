# == Schema Information
# Schema version: 20101221174706
#
# Table name: concorrentes
#
#  id         :integer         not null, primary key
#  nome       :string(255)
#  num        :string(255)
#  email      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Concorrente < ActiveRecord::Base
  attr_accessible :nome, :email, :num
  
  belongs_to :user
  
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  validates :nome, :presence => true, :length => { :maximum => 140 }
  validates :email, :presence => true,
                    :format   => { :with => email_regex }
  validates :user_id, :presence => true
    
end
