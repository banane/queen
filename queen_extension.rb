# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application_controller'

class QueenExtension < Radiant::Extension
  version "1.0"
  description "Describe your extension here"
  url "http://yourwebsite.com/queen"
  
 define_routes do |map|
    map.resources :queens
  end

  def activate
    # admin.tabs.add "Queen", "/admin/queen", :after => "Layouts", :visibility => [:all]
  end
  
  def deactivate
    # admin.tabs.remove "Queen"
  end
  
end
