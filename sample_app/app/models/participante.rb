# == Schema Information
# Schema version: 20101226133802
#
# Table name: participantes
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  concurso_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#  dataRegisto :datetime
#

class Participante < ActiveRecord::Base
  belongs_to :concurso
  
  attr_accessor :chave
  attr_accessible :chave, :concurso_id, :user_id, :dataRegisto
  
  validate :user_id, :presence => true
  validate :concurso_id, :presence=>true
  validate :intervalo
  validate :chave, :presence => true
  
  before_save :current_time
  
  private
  
  def current_time
    self.dataRegisto = DateTime.now
  end
  
  def intervalo
    i = Concurso.find(concurso_id).inicio
    f = Concurso.find(concurso_id).fim
    unless (i<=DateTime.now && f>=DateTime.now)
      errors.add(:fim,"Ainda nao pode registar-se neste concurso!")
    end
  end

end
