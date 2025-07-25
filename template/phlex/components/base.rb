class Components::Base < RubyUI::Base
  include RubyUI
  include PhlexIcons

  include ::Devise::Controllers::UrlHelpers

  # Include any helpers you want to be available across all components
  include Phlex::Rails::Helpers::Flash
  include Phlex::Rails::Helpers::Routes
  include Phlex::Rails::Helpers::T
  include Phlex::Rails::Layout

  register_output_helper :cloudflare_turnstile_script_tag

  register_value_helper :cloudflare_turnstile
  register_value_helper :devise_mapping
  register_value_helper :params
  register_value_helper :resource
  register_value_helper :resource_class
  register_value_helper :resource_name
  register_value_helper :user_signed_in?

  def self.translation_path
    @translation_path ||= name&.dup.tap do |n|
      n.gsub!("::", ".")
      n.gsub!(/([a-z])([A-Z])/, '\1_\2')
      n.downcase!
      n.delete_prefix!("views.")
      n.delete_prefix!("components.")
    end
  end

  def rtl? = I18n.locale == :ar
  def direction = rtl? ? :rtl : :ltr
  def side = rtl? ? :right : :left

  if Rails.env.development?
    def before_template
      comment { "Before #{self.class.name}" }
      super
    end
  end
end
