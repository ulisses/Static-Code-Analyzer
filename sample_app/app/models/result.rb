# == Schema Information
# Schema version: 20110228222423
#
# Table name: results
#
#  id           :integer         not null, primary key
#  created_at   :datetime
#  updated_at   :datetime
#  user_id      :integer
#  concurso_id  :integer
#  enunciado_id :integer
#  bestRes      :float
#

class Result < ActiveRecord::Base
  	belongs_to :user
  	
  	attr_accessible :enunciado_id, :concurso_id, :bestRes
  	
  	validates :user_id, :presence => true
  
end
