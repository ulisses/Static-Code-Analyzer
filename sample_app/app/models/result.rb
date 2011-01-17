# == Schema Information
# Schema version: 20110113200625
#
# Table name: results
#
#  id           :integer         not null, primary key
#  bateria_id   :integer
#  tentativa_id :integer
#  output       :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#

class Result < ActiveRecord::Base
  	belongs_to :tentativa
  	
  	attr_accessible :bateria_id, :tentativa_id, :output
  	
  
end
