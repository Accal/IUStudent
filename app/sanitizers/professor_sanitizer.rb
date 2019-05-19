class Professor::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:name, :faculty, :position, :office, :phoneNumber]);
    permit(:account_update, keys: [:name, :faculty, :position, :office, :phoneNumber]);
  end
end