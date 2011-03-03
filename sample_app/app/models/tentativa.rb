# == Schema Information
# Schema version: 20110303170356
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
#  execStop     :boolean
#  passedTests  :float
#  tExec        :float
#  language_id  :integer
#

class Tentativa < ActiveRecord::Base
	belongs_to :enunciado
	
	attr_accessible :user_id, :path, :compilou, :passedTests, :execStop, :tExec, :language_id
	
end
