# Extend Faalis::User.class to add extra functionality
Faalis::User.class_eval do
  has_many :sites if Faalis::ORM.active_record?
  has_many :namespaces
end
