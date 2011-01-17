# == Schema Information
# Schema version: 20110113191331
#
# Table name: baterias
#
#  id           :integer         not null, primary key
#  nome         :string(255)
#  input        :string(255)
#  output       :string(255)
#  created_at   :datetime
#  updated_at   :datetime
#  enunciado_id :integer
#

class Bateria < ActiveRecord::Base
  belongs_to :enunciado
  
  attr_accessible :nome, :input, :output
  
  validate :enunciado_id, :presence=>true
end
