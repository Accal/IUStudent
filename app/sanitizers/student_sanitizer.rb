class Student::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:name, :faculty, :major, :semester]);
    permit(:account_update, keys: [:name, :faculty, :major, :semester]);
  end
end