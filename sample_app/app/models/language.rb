# == Schema Information
# Schema version: 20110102170455
#
# Table name: languages
#
#  id         :integer         not null, primary key
#  ling       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Language < ActiveRecord::Base
    attr_accessible :ling
    
    validates :ling, :presence=>true,:length => { :maximum => 200 }
end
