# == Schema Information
# Schema version: 20101226004105
#
# Table name: concursos
#
#  id         :integer         not null, primary key
#  tit        :string(255)
#  chave      :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  inicio     :datetime
#  fim        :datetime
#  dur        :time
#

class Concurso < ActiveRecord::Base
  belongs_to :user
  
  has_many :participantes, :dependent => :destroy
  has_many :enunciados, :dependent => :destroy
  
  #attr_accessor :chave
  attr_accessible :tit, :chave, :inicio, :fim, :dur
  
  validates :tit, :presence=>true, :length => { :maximum => 100 }, :uniqueness => { :case_sensitive => false }
  validates :chave, :presence=>true, :length => { :maximum => 100 }
  validates :inicio, :presence=>true
  validates :fim, :presence=>true
  validates :dur, :presence=>true
  validate :valid_date?, :on =>:new, :on=>:update, :on=>:create
  validate :valid_dur?

  private
  
    def valid_date?
      unless fim > inicio
        errors.add(:fim,"Data final tem de ser maior que inicial")
      end
    end
  
    def valid_dur?
      unless (dur.hour!=0 || dur.min!=0 )
        errors.add(:date, "Duracao tem de ser maior que 0")
      end
    end
      
end
