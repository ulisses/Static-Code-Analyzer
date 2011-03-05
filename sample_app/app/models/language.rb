# == Schema Information
# Schema version: 20110304144950
#
# Table name: languages
#
#  id                :integer         not null, primary key
#  ling              :string(255)
#  created_at        :datetime
#  updated_at        :datetime
#  compString        :string(255)
#  execString        :string(255)
#  complexExecString :string(255)
#

class Language < ActiveRecord::Base
    attr_accessible :ling, :compString, :execString, :complexExecString
    
    validates :ling, :presence=>true,:length => { :maximum => 200 }
    validates :compString, :presence=>true,:length => { :maximum => 200 }
    validates :execString, :presence=>true,:length => { :maximum => 200 }        
    validates :complexExecString, :presence=>true,:length => { :maximum => 200 }         
end
