# == Schema Information
# Schema version: 20110305165245
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
#  tentativa_id :integer
#

class Result < ActiveRecord::Base
  	belongs_to :user
  	
  	attr_accessible :enunciado_id, :concurso_id, :bestRes, :tentativa_id
  	
  	validates :user_id, :presence => true
  	validates :enunciado_id, :presence => true
  	validates :concurso_id, :presence => true
  	validates :bestRes, :presence => true
  	validates :tentativa_id, :presence => true	  	  	  	  	
  
end
