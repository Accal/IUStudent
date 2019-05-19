class Admin::ParameterSanitizer < Devise::ParameterSanitizer
  def initialize(*)
    super
    permit(:sign_up, keys: [:name, :position, :phoneNumber]);
    permit(:account_update, keys: [:name, :position, :phoneNumber]);
  end
end