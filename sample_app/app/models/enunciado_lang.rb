# == Schema Information
# Schema version: 20110112145528
#
# Table name: enunciado_langs
#
#  id           :integer         not null, primary key
#  enunciado_id :integer
#  language_id  :integer
#  created_at   :datetime
#  updated_at   :datetime
#

class EnunciadoLang < ActiveRecord::Base
   attr_accessible :enunciado_id, :language_id
   
   validates_uniqueness_of :enunciado_id, :scope => [:language_id]
   validates :enunciado_id, :presence=>true
   validates :language_id, :presence=>true
end
