module ApplicationHelper
   def body_class
     action = case action_name
       when 'create' then 'New'
       when 'update' then 'Edit'
      else action_name
     end.camelize

     "Views.#{controller_path.split('/').map(&:camelize).join('.')}.#{action}View"
   end
end
