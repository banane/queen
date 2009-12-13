class Queen < ActiveRecord::Base
   validates_presence_of :name, :in=>true 
   validates_presence_of :email, :in=>true
   validates_presence_of :kingdom, :in=>true
end
