# == Schema Information
# Schema version: 20110102170455
#
# Table name: tentativas
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  path         :string(255)
#  compilou     :boolean
#  enunciado_id :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class Tentativa < ActiveRecord::Base
	belongs_to :enunciado
	has_many :results
	
	attr_accessible :user_id, :path, :compilou
	
end
