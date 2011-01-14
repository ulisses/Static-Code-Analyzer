# == Schema Information
# Schema version: 20110112145528
#
# Table name: enunciados
#
#  id          :integer         not null, primary key
#  titulo      :string(255)
#  desc        :string(255)
#  funcao_id   :integer
#  peso        :integer
#  concurso_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#

class Enunciado < ActiveRecord::Base
  belongs_to :concurso
  
  has_many :tentativas
  has_many :baterias#, :class_name => 'Teste' 
  has_many :enunciadoLangs
  
  attr_accessible :titulo, :desc, :funcao_id, :peso
  
  validates_uniqueness_of :titulo, :scope => [:concurso_id]
  validates :titulo, :presence=>true, :length => { :maximum => 100 }
  validates :desc, :presence=>true, :length => { :maximum => 240 }
  validates :funcao_id, :presence=>true
  validates :peso, :presence=>true
  validates :concurso_id, :presence=>true
end
