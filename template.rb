require "net/http"
require "uri"
require "yaml"

require "active_support/core_ext/hash/keys"

LOCALES = %w[ar en]

DOCKER_COMPOSE_CONFIG = {
  "services": {
    "postgres": {
      "image": "postgres:17.5",
      "restart": "unless-stopped",
      "command": "postgres -c \"shared_preload_libraries=pg_stat_statements\" -c \"pg_stat_statements.track=all\" -c \"pg_stat_statements.max=10000\" -c \"track_activity_query_size=2048\"",
      "ports": [
        "5433:5432"
      ],
      "volumes": [
        "postgres-data:/var/lib/postgresql/data"
      ],
      "environment": [
        "POSTGRES_USER=#{@app_name}",
        "POSTGRES_PASSWORD=#{@app_name}",
        "POSTGRES_DB=#{@app_name}_development"
      ]
    },
    "meilisearch": {
      "image": "getmeili/meilisearch:v1.15.2",
      "restart": "unless-stopped",
      "ports": [
        "7701:7700"
      ],
      "volumes": [
        "meilisearch-data:/meili_data"
      ]
    },
    "redis": {
      "image": "valkey/valkey:8.1",
      "restart": "unless-stopped",
      "ports": [
        "6380:6379"
      ],
      "volumes": [
        "redis-data:/data"
      ]
    }
  },
  "volumes": {
    "postgres-data": nil,
    "meilisearch-data": nil,
    "redis-data": nil
  }
}

TOPTAL_GITIGNORE_URL = "https://www.toptal.com/developers/gitignore/api/linux,macos,rails,windows,yarn,node"
BASE_TEMPLATE_URL    = "https://raw.githubusercontent.com/ieasybooks/ruby-on-rails-template/refs/heads/main/template/"

# Static controller files.
STATIC_CONTROLLER_URL = BASE_TEMPLATE_URL + "static_controller/static_controller.rb"
STATIC_HOME_VIEW_URL  = BASE_TEMPLATE_URL + "static_controller/home.rb"
STATIC_SPEC_URL       = BASE_TEMPLATE_URL + "static_controller/static_spec.rb"

# Documentation files.
README_URL    = BASE_TEMPLATE_URL + "README.md"
README_EN_URL = BASE_TEMPLATE_URL + "README.en.md"

# Development environment files.
VSCODE_RECOMMENDED_EXTENSIONS_URL = BASE_TEMPLATE_URL + "vscode/extensions.json"
VSCODE_SETTINGS_URL               = BASE_TEMPLATE_URL + "vscode/settings.json"
MISE_CONFIG_URL                   = BASE_TEMPLATE_URL + "mise/mise.toml"
PRETTIER_CONFIG_URL               = BASE_TEMPLATE_URL + "prettier/.prettierrc"

# Production gems files.
DEVISE_CUSTOM_I18N_URL                     = BASE_TEMPLATE_URL + "devise/{locale}.yml"
DEVISE_OVERRIDES_URL                       = BASE_TEMPLATE_URL + "devise/devise_overrides.rb"
MEILISEARCH_RAILS_INITIALIZER_URL          = BASE_TEMPLATE_URL + "meilisearch_rails/initializer.rb"
PAGY_INITIALIZER_URL                       = "https://ddnexus.github.io/pagy/gem/config/pagy.rb"
PGHERO_RECURRING_CONFIG_URL                = BASE_TEMPLATE_URL + "pghero/recurring.yml"
PHLEX_BASE_VIEW_URL                        = BASE_TEMPLATE_URL + "phlex/views/base.rb"
PHLEX_BASE_COMPONENT_URL                   = BASE_TEMPLATE_URL + "phlex/components/base.rb"
PHLEX_HEAD_COMPONENT_URL                   = BASE_TEMPLATE_URL + "phlex/components/head.rb"
PHLEX_LAYOUT_COMPONENT_URL                 = BASE_TEMPLATE_URL + "phlex/components/layout.rb"
PHLEX_FLASH_COMPONENT_URL                  = BASE_TEMPLATE_URL + "phlex/components/flash.rb"
RACK_ATTACK_INITIALIZER_URL                = BASE_TEMPLATE_URL + "rack_attack/initializer.rb"
RACK_MINI_PROFILER_INITIALIZER_URL         = BASE_TEMPLATE_URL + "rack_mini_profiler/initializer.rb"
RACK_MINI_PROFILER_SPEC_URL                = BASE_TEMPLATE_URL + "rack_mini_profiler/rack_mini_profiler_spec.rb"
RAILS_CLOUDFLARE_TURNSTILE_INITIALIZER_URL = BASE_TEMPLATE_URL + "rails_cloudflare_turnstile/initializer.rb"
RAILS_CLOUDFLARE_TURNSTILE_CONTROLLER_URL  = BASE_TEMPLATE_URL + "rails_cloudflare_turnstile/controller.js"
SITEMAP_GENERATOR_INITIALIZER_URL          = BASE_TEMPLATE_URL + "sitemap_generator/initializer.rb"
SITEMAP_GENERATOR_JOB_URL                  = BASE_TEMPLATE_URL + "sitemap_generator/generate_sitemap_job.rb"
SITEMAP_GENERATOR_JOB_SPEC_URL             = BASE_TEMPLATE_URL + "sitemap_generator/generate_sitemap_job_spec.rb"
SOLID_ERRORS_MIGRATION_URL                 = BASE_TEMPLATE_URL + "solid_errors/migration.rb"

# Development gems files.
ACTIVE_RECORD_DOCTOR_CONFIG_URL = BASE_TEMPLATE_URL + "active_record_doctor/.active_record_doctor.rb"
ANNOTATERB_RAKE_TASK_URL        = BASE_TEMPLATE_URL + "annotaterb/annotate_rb.rake"

# Test gems files.
WEBMCK_CONFIG_URL = BASE_TEMPLATE_URL + "webmock/webmock.rb"

# CI files.
GITHUB_CI_WORKFLOW_URL        = BASE_TEMPLATE_URL + "github/ci.yml"
GITHUB_KAMAL_RUN_WORKFLOW_URL = BASE_TEMPLATE_URL + "github/kamal-run.yml"

DEVISE_VIEWS_INFO = [
  {
    erb_path: "app/views/devise/sessions/new.html.erb",
    erb_content: "<%= render Views::Devise::Sessions::New.new %>\n",
    phlex_path: "app/views/devise/sessions/new.rb",
    phlex_content_url: BASE_TEMPLATE_URL + "devise/sessions/new.rb"
  },
  {
    erb_path: "app/views/devise/registrations/new.html.erb",
    erb_content: "<%= render Views::Devise::Registrations::New.new %>\n",
    phlex_path: "app/views/devise/registrations/new.rb",
    phlex_content_url: BASE_TEMPLATE_URL + "devise/registrations/new.rb"
  },
  {
    erb_path: "app/views/devise/registrations/edit.html.erb",
    erb_content: "<%= render Views::Devise::Registrations::Edit.new %>\n",
    phlex_path: "app/views/devise/registrations/edit.rb",
    phlex_content_url: BASE_TEMPLATE_URL + "devise/registrations/edit.rb"
  },
  {
    erb_path: "app/views/devise/passwords/new.html.erb",
    erb_content: "<%= render Views::Devise::Passwords::New.new %>\n",
    phlex_path: "app/views/devise/passwords/new.rb",
    phlex_content_url: BASE_TEMPLATE_URL + "devise/passwords/new.rb"
  },
  {
    erb_path: "app/views/devise/passwords/edit.html.erb",
    erb_content: "<%= render Views::Devise::Passwords::Edit.new %>\n",
    phlex_path: "app/views/devise/passwords/edit.rb",
    phlex_content_url: BASE_TEMPLATE_URL + "devise/passwords/edit.rb"
  },
  {
    erb_path: "app/views/devise/confirmations/new.html.erb",
    erb_content: "<%= render Views::Devise::Confirmations::New.new %>\n",
    phlex_path: "app/views/devise/confirmations/new.rb",
    phlex_content_url: BASE_TEMPLATE_URL + "devise/confirmations/new.rb"
  },
  {
    erb_path: "app/views/devise/unlocks/new.html.erb",
    erb_content: "<%= render Views::Devise::Unlocks::New.new %>\n",
    phlex_path: "app/views/devise/unlocks/new.rb",
    phlex_content_url: BASE_TEMPLATE_URL + "devise/unlocks/new.rb"
  }
]

def postgresql? = @options["database"] == "postgresql"
def mise_installed? = system("mise --version > /dev/null 2>&1")
def docker_installed? = system("docker --version > /dev/null 2>&1")
def remote_file_content(url) = Net::HTTP.get_response(URI(url)).body

def configure_development_environment(questions:)
  add_vscode_recommended_extensions
  add_vscode_settings
  add_mise_config
  add_prettier_config
  add_docker_compose_config(questions:)
  add_i18n_application_config
  enhance_gitignore
  configure_database if postgresql?
end

def add_vscode_recommended_extensions = create_file ".vscode/extensions.json", remote_file_content(VSCODE_RECOMMENDED_EXTENSIONS_URL)
def add_vscode_settings = create_file ".vscode/settings.json", remote_file_content(VSCODE_SETTINGS_URL).gsub("{app_name}", @app_name)
def add_mise_config = create_file "mise.toml", remote_file_content(MISE_CONFIG_URL)
def add_prettier_config = create_file ".prettierrc", remote_file_content(PRETTIER_CONFIG_URL)

def add_docker_compose_config(questions:)
  return unless postgresql? || questions[:meilisearch]

  docker_compose_config = DOCKER_COMPOSE_CONFIG

  unless postgresql?
    docker_compose_config["services".to_sym].delete("postgres".to_sym)
    docker_compose_config["volumes".to_sym].delete("postgres-data".to_sym)
  end

  unless questions[:meilisearch]
    docker_compose_config["services".to_sym].delete("meilisearch".to_sym)
    docker_compose_config["volumes".to_sym].delete("meilisearch-data".to_sym)
  end

  unless questions[:rails_performance]
    docker_compose_config["services".to_sym].delete("redis".to_sym)
    docker_compose_config["volumes".to_sym].delete("redis-data".to_sym)
  end

  create_file "dev-docker-compose.yml", YAML.dump(docker_compose_config.deep_stringify_keys)
end

def add_i18n_application_config
  insert_into_file "config/application.rb", before: /\n  end\nend$/ do
    <<~CONTENT.gsub(/^/, "    ")


    config.i18n.available_locales = %i[ar en]
    config.i18n.default_locale = :ar
    config.i18n.load_path += Rails.root.glob("config/locales/**/*.yml")
    CONTENT
  end

  create_file "config/locales/ar.yml", <<~CONTENT
  ar:
    hello: مرحبا
  CONTENT
end

def enhance_gitignore
  remove_file ".gitignore"
  create_file ".gitignore", remote_file_content(TOPTAL_GITIGNORE_URL)

  insert_into_file ".gitignore", after: "### Rails ###\n" do
    <<~CONTENT
    app/assets/builds/*
    !app/assets/builds/.keep
    CONTENT
  end
end

def configure_database
  gsub_file "config/database.yml", "  #username:",  "  username:"
  gsub_file "config/database.yml", "  #password:",  "  password: #{@app_name}"
  gsub_file "config/database.yml", "  #host:",      "  host:"
  gsub_file "config/database.yml", "  #port: 5432", "  port: 5433"

  insert_into_file "config/database.yml", after: "  database: #{@app_name}_test\n" do
    <<~CONTENT.gsub(/^/, "  ")
    username: #{@app_name}
    password: #{@app_name}
    host: localhost
    port: 5433
    CONTENT
  end
end

def configure_production_gems(questions:)
  configure_avo if questions[:avo]
  configure_devise(questions:) if questions[:devise]
  configure_devise_i18n(questions:) if questions[:devise]
  configure_meilisearch_rails if questions[:meilisearch]
  configure_mission_control_jobs
  configure_pagy
  configure_pghero if postgresql?
  configure_phlex if questions[:phlex]
  configure_rack_attack if questions[:cloudflare]
  configure_rack_mini_profiler(questions:)
  configure_rails_cloudflare_turnstile if questions[:cloudflare]
  configure_rails_performance if questions[:rails_performance]
  configure_sitemap_generator
  configure_solid_errors
  configure_strict_ivars
end

def configure_avo
  generate "avo:install"

  unless docker_installed?
    generate "avo:resource User"

    insert_into_file "app/avo/resources/user.rb", "  self.devise_password_optional = true\n\n", before: "\n  def fields"
  end

  uncomment_lines "config/initializers/avo.rb", "current_user_method"
end

def configure_devise(questions:)
  generate "devise:install"
  remove_file "config/locales/devise.en.yml"

  create_file "app/models/concerns/devise_overrides.rb", remote_file_content(DEVISE_OVERRIDES_URL)

  generate "devise User"

  devise_migration = Dir.glob("#{destination_root}/db/migrate/*devise*.rb").first
  gsub_file devise_migration, "# frozen_string_literal: true\n\n", ""
  uncomment_lines devise_migration, ":" # Uncomment all lines with `:`.

  generate "migration add_role_to_users role:integer!"
  role_migration = Dir.glob("#{destination_root}/db/migrate/*add_role_to_users*.rb").first
  insert_into_file role_migration, ", default: 0", after: ", :integer"

  generate "migration add_suspended_at_to_users suspended_at:datetime"
  suspended_at_migration = Dir.glob("#{destination_root}/db/migrate/*suspended_at_to_users*.rb").first
  insert_into_file suspended_at_migration, ", default: nil", after: ", :datetime"

  inject_into_class "app/models/user.rb", "User", "  include DeviseOverrides\n\n"

  insert_into_file "app/models/user.rb",
    ",\n         :confirmable, :lockable, :timeoutable, :trackable",
    after: ":recoverable, :rememberable, :validatable"

  insert_into_file "app/models/user.rb", before: /end$/ do
    <<~CONTENT.gsub(/^/, "  ")

    validates :role, :encrypted_password, :sign_in_count, :failed_attempts, presence: true

    enum :role, { user: 0, admin: 1 }
    CONTENT
  end

  LOCALES.each do |locale|
    create_file "config/locales/devise/custom.#{locale}.yml", remote_file_content(DEVISE_CUSTOM_I18N_URL.gsub("{locale}", locale))
  end

  if questions[:phlex]
    DEVISE_VIEWS_INFO.each do |view_info|
      create_file view_info[:erb_path], view_info[:erb_content]
      create_file view_info[:phlex_path], remote_file_content(view_info[:phlex_content_url])
    end
  end

  gsub_file "spec/models/user_spec.rb", "RSpec.describe User, type: :model do", "RSpec.describe User do"

  gsub_file "spec/models/user_spec.rb", %(pending "add some examples to (or delete) \#{__FILE__}"\n), <<~CONTENT
  describe "enums" do
      it { is_expected.to define_enum_for(:role).with_values(user: 0, admin: 1) }
    end
  CONTENT
end

def configure_devise_i18n(questions:)
  generate "devise:i18n:views" unless questions[:phlex]

  LOCALES.each do |locale|
    generate "devise:i18n:locale #{locale}"
    copy_file "#{destination_root}/config/locales/devise.views.#{locale}.yml", "#{destination_root}/config/locales/devise/views.#{locale}.yml"
    remove_file "#{destination_root}/config/locales/devise.views.#{locale}.yml"

    gsub_file "config/locales/devise/views.#{locale}.yml", /\n.*leave_blank_if_you_don_t_want_to_change_it.*\n/, "\n"
    gsub_file "config/locales/devise/views.#{locale}.yml", /\n.*title.*\n/, "\n"
    gsub_file "config/locales/devise/views.#{locale}.yml", /\n.*unhappy.*\n/, "\n"
    gsub_file "config/locales/devise/views.#{locale}.yml", /\n.*we_need_your_current_password_to_confirm_your_changes.*\n/, "\n"

    gsub_file "config/locales/devise/views.#{locale}.yml", "signed_up_but_locked", "signed_up_but_locked_html"
    gsub_file "config/locales/devise/views.#{locale}.yml", "signed_up_but_unconfirmed", "signed_up_but_unconfirmed_html"
  end

  content = File.read("config/locales/devise/views.ar.yml", encoding: "UTF-8")

  content.gsub!(
    "locked: تم غلق حسابك.",
    'locked_html: تم غلق حسابك، قم بطلب تعليمات إلغاء قفل الحساب من <a class="hover:underline" href="/users/unlock/new">هنا</a>.'
  )

  content.gsub!(
    "unconfirmed: تحتاج إلى تأكيد عنوان بريدك الإلكتروني قبل المتابعة.",
    'unconfirmed_html: تحتاج إلى تأكيد عنوان بريدك الإلكتروني قبل المتابعة، قم بطلب تعليمات تأكيد الحساب من <a class="hover:underline" href="/users/confirmation/new">هنا</a>.'
  )

  File.write("config/locales/devise/views.ar.yml", content, encoding: "UTF-8")

  gsub_file "config/locales/devise/views.en.yml",
    "locked: Your account is locked.",
    'locked_html: Your account is locked, request unlock instructions from <a class="hover:underline" href="/users/unlock/new">here</a>.'

  gsub_file "config/locales/devise/views.en.yml",
    "unconfirmed: You have to confirm your email address before continuing.",
    'unconfirmed_html: You have to confirm your email address before continuing, request confirmation instructions from <a class="hover:underline" href="/users/confirmation/new">here</a>.'
end

def configure_meilisearch_rails = create_file "config/initializers/meilisearch.rb", remote_file_content(MEILISEARCH_RAILS_INITIALIZER_URL)

def configure_mission_control_jobs
  insert_into_file "config/application.rb", "\n    config.mission_control.jobs.http_basic_auth_enabled = false", before: /\n  end\nend$/
end

def configure_pagy
  create_file "config/initializers/pagy.rb", remote_file_content(PAGY_INITIALIZER_URL)

  inject_into_class "app/controllers/application_controller.rb", "ApplicationController", "  include Pagy::Backend\n\n"
  inject_into_module "app/helpers/application_helper.rb", "ApplicationHelper", "  include Pagy::Frontend\n"
end

def configure_pghero
  generate "pghero:query_stats"
  generate "pghero:space_stats"

  remove_file "config/recurring.yml"
  create_file "config/recurring.yml", remote_file_content(PGHERO_RECURRING_CONFIG_URL)
end

def configure_phlex
  generate "phlex:install"

  remove_file "app/views/base.rb"
  remove_file "app/components/base.rb"

  create_file "app/views/base.rb", remote_file_content(PHLEX_BASE_VIEW_URL)
  create_file "app/components/base.rb", remote_file_content(PHLEX_BASE_COMPONENT_URL)
  create_file "app/components/head.rb", remote_file_content(PHLEX_HEAD_COMPONENT_URL)
  create_file "app/components/layout.rb", remote_file_content(PHLEX_LAYOUT_COMPONENT_URL)
  create_file "app/components/flash.rb", remote_file_content(PHLEX_FLASH_COMPONENT_URL)

  remove_file "app/views/layouts/application.html.erb"
end

def configure_rack_attack = create_file "config/initializers/rack_attack.rb", remote_file_content(RACK_ATTACK_INITIALIZER_URL)

def configure_rack_mini_profiler(questions:)
  create_file "config/initializers/rack_mini_profiler.rb", remote_file_content(RACK_MINI_PROFILER_INITIALIZER_URL)

  if questions[:devise]
    insert_into_file "app/controllers/application_controller.rb", after: "allow_browser versions: :modern\n" do
      <<~CONTENT.gsub(/^/, "  ")

      before_action :check_rack_mini_profiler

      private

      def check_rack_mini_profiler
        Rack::MiniProfiler.authorize_request if current_user&.admin?
      end
      CONTENT
    end

    create_file "spec/requests/rack_mini_profiler_spec.rb", remote_file_content(RACK_MINI_PROFILER_SPEC_URL)
  end
end

def configure_rails_cloudflare_turnstile
  create_file "config/initializers/cloudflare_turnstile.rb", remote_file_content(RAILS_CLOUDFLARE_TURNSTILE_INITIALIZER_URL)

  generate "stimulus cloudflare-turnstile"
  remove_file "app/javascript/controllers/cloudflare_turnstile_controller.js"
  create_file "app/javascript/controllers/cloudflare_turnstile_controller.js", remote_file_content(RAILS_CLOUDFLARE_TURNSTILE_CONTROLLER_URL)
end

def configure_rails_performance
  generate "rails_performance:install"

  gsub_file "config/initializers/rails_performance.rb", "redis://127.0.0.1:6379/0", "redis://127.0.0.1:6380/0"
  gsub_file "config/initializers/rails_performance.rb", %(config.mount_at = "/rails/performance"), %(config.mount_at = "/performance")
  gsub_file "config/initializers/rails_performance.rb", %(config.ignored_paths = ["/rails/performance"]), %(config.ignored_paths = ["/performance", "up"])
end

def configure_sitemap_generator
  rake "sitemap:install"

  gsub_file "bin/docker-entrypoint", "./bin/rails db:prepare", "ENQUEUE_GENERATE_SITEMAP_JOB=1 ./bin/rails db:prepare"

  create_file "config/initializers/enqueue_generate_sitemap_job.rb", remote_file_content(SITEMAP_GENERATOR_INITIALIZER_URL)
  create_file "app/jobs/generate_sitemap_job.rb", remote_file_content(SITEMAP_GENERATOR_JOB_URL)
  create_file "spec/jobs/generate_sitemap_job_spec.rb", remote_file_content(SITEMAP_GENERATOR_JOB_SPEC_URL)
end

def configure_solid_errors
  create_file "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}_solid_errors.rb", remote_file_content(SOLID_ERRORS_MIGRATION_URL)
end

def configure_strict_ivars = append_to_file "config/boot.rb", %(\nrequire "strict_ivars"\n)

def configure_development_gems(questions:)
  configure_active_record_doctor
  configure_annotaterb
  configure_hotwire_spark if questions[:phlex]
  configure_i18n_tasks(questions:)
  configure_rubocop
  configure_ruby_ui if questions[:phlex]
end

def configure_active_record_doctor = create_file ".active_record_doctor.rb", remote_file_content(ACTIVE_RECORD_DOCTOR_CONFIG_URL)

def configure_annotaterb
  generate "annotate_rb:install"

  gsub_file ".annotaterb.yml", ":routes: false", ":routes: true"

  remove_file "lib/tasks/annotate_rb.rake"
  create_file "lib/tasks/annotate_rb.rake", remote_file_content(ANNOTATERB_RAKE_TASK_URL)
end

def configure_hotwire_spark
  insert_into_file "config/environments/development.rb", "\n\n  config.hotwire.spark.html_paths += %w[ app/components ]", before: /\nend$/
end

def configure_i18n_tasks(questions:)
  run "bundle binstubs i18n-tasks"
  run "cp $(i18n-tasks gem-path)/templates/config/i18n-tasks.yml config/"

  gsub_file "config/i18n-tasks.yml", "base_locale: en", "base_locale: ar"
  gsub_file "config/i18n-tasks.yml", "# locales: [es, fr]", "locales: [ar, en]"

  gsub_file "config/i18n-tasks.yml", "# - config/locales/%{locale}.yml", "- config/locales/%{locale}.yml"
  gsub_file "config/i18n-tasks.yml", "# - config/locales/**/*.%{locale}.yml", "- config/locales/**/*.%{locale}.yml"

  gsub_file "config/i18n-tasks.yml", "# relative_roots:", "relative_roots:"
  gsub_file "config/i18n-tasks.yml", "#   - app/controllers", "  - app/controllers"
  gsub_file "config/i18n-tasks.yml", "#   - app/helpers",     "  - app/helpers"
  gsub_file "config/i18n-tasks.yml", "#   - app/mailers",     "  - app/mailers"
  gsub_file "config/i18n-tasks.yml", "#   - app/presenters",  "  - app/presenters"

  if questions[:phlex]
    gsub_file "config/i18n-tasks.yml", "#   - app/views",       "  - app/views\n    - app/components"

    gsub_file "config/i18n-tasks.yml",
      "# relative_exclude_method_name_paths:\n  #  -",
      "relative_exclude_method_name_paths:\n    - app/views\n    - app/components"
  else
    gsub_file "config/i18n-tasks.yml", "#   - app/views",       "  - app/views"
  end

  if questions[:devise]
    gsub_file "config/i18n-tasks.yml", "# ignore_unused:", "ignore_unused:\n  - activerecord.*\n  - devise.*\n  - errors.*"
  else
    gsub_file "config/i18n-tasks.yml", "# ignore_unused:", "ignore_unused:\n  - activerecord.*\n  - errors.*"
  end
end

def configure_rubocop
  prepend_to_file ".rubocop.yml", <<~CONTENT
  plugins:
    - rubocop-rake
    - rubocop-rspec
    - rubocop-rspec_rails

  CONTENT

  append_to_file ".rubocop.yml", <<~CONTENT

  AllCops:
    TargetRubyVersion: 3.4.4
    NewCops: enable
    Exclude:
      - '**/._*'
      - 'db/schema.rb'
      - 'vendor/bundle/**/*'

  Bundler/OrderedGems:
    Enabled: true

  Metrics/ClassLength:
    CountAsOne: ['array', 'method_call']

  Metrics/MethodLength:
    CountAsOne: ['array', 'method_call']

  RSpec/ExampleLength:
    CountAsOne: ['array', 'method_call']
  CONTENT
end

def configure_ruby_ui
  remove_file "app/assets/stylesheets/application.tailwind.css"
  generate "ruby_ui:install"

  generate "ruby_ui:component Alert"
  generate "ruby_ui:component Button"
  generate "ruby_ui:component Card"
  generate "ruby_ui:component Checkbox"
  generate "ruby_ui:component Form"
  generate "ruby_ui:component Input"
  generate "ruby_ui:component Link"
  generate "ruby_ui:component Typography"
end

def configure_test_gems(questions:)
  configure_rspec(questions:)
  configure_factory_bot
  configure_shoulda_matchers
  configure_simplecov(questions:)
  configure_webmock(questions:)
end

def configure_rspec(questions:)
  generate "rspec:install"
  run "bundle binstubs rspec-core"
  gsub_file ".gitignore", ".rspec", "# .rspec"
  uncomment_lines "spec/rails_helper.rb", "infer_spec_type_from_file_location!"

  if questions[:devise]
    insert_into_file "spec/rails_helper.rb", "\n\n  config.include Devise::Test::IntegrationHelpers, type: :request", before: /\nend$/
  end
end

def configure_factory_bot
  insert_into_file "spec/rails_helper.rb",
    "  config.include FactoryBot::Syntax::Methods\n\n",
    before: "  # If you're not using ActiveRecord, or you'd prefer not to run each of your"
end

def configure_shoulda_matchers
  insert_into_file "spec/rails_helper.rb", after: "# Add additional requires below this line. Rails is not loaded until this point!" do
    <<~CONTENT


    Shoulda::Matchers.configure do |config|
      config.integrate do |with|
        with.test_framework :rspec
        with.library :rails
      end
    end
    CONTENT
  end
end

def configure_simplecov(questions:)
  content = <<~CONTENT
  require "simplecov"
  require "simplecov-json"

  SimpleCov.start "rails" do
    enable_coverage :branch
    minimum_coverage line: 100, branch: 100

    SimpleCov.formatters = SimpleCov::Formatter::MultiFormatter.new([
      SimpleCov::Formatter::SimpleFormatter,
      SimpleCov::Formatter::HTMLFormatter,
      SimpleCov::Formatter::JSONFormatter
    ])

    # Ignore components and views.
    add_filter "app/components"
    add_filter "app/views"

    # Ignore Avo resources, as they are mostly auto-generated.
    add_filter "app/avo"

    # Ignore annotate_rb rake task, as it just enhances the db:migrate task to run annotate_rb:annotate_routes.
    add_filter "lib/tasks/annotate_rb.rake"
  end

  CONTENT

  phlex_content = %(\n\n  # Ignore components and views.\n  add_filter "app/components"\n  add_filter "app/views")
  avo_content = %(\n\n  # Ignore Avo resources, as they are mostly auto-generated.\n  add_filter "app/avo")

  content = content.gsub(phlex_content, "") unless questions[:phlex]
  content = content.gsub(avo_content, "") unless questions[:avo]

  prepend_to_file "spec/spec_helper.rb", content
end

def configure_webmock(questions:)
  content = remote_file_content(WEBMCK_CONFIG_URL)

  content.gsub!(', allow: "http://localhost:7701"', '') unless questions[:meilisearch]

  create_file "spec/factories/webmock.rb", content
end

def generate_static_controller
  create_file "app/controllers/static_controller.rb", remote_file_content(STATIC_CONTROLLER_URL)
  create_file "app/views/static/home.rb", remote_file_content(STATIC_HOME_VIEW_URL)
  create_file "spec/requests/static_spec.rb", remote_file_content(STATIC_SPEC_URL)
end

def update_routes(questions:)
  gsub_file "config/routes.rb", %(# root "posts#index"), %(root "static#home")

  uncomment_lines "config/routes.rb", "as: :pwa_manifest"
  uncomment_lines "config/routes.rb", "as: :pwa_service_worker"

  return unless questions[:devise]

  gsub_file "config/routes.rb", "  mount_avo", ""

  content = <<~CONTENT.gsub(/^/, "  ")


  authenticate :user, ->(user) { user.admin? } do
    mount_avo
    mount MissionControl::Jobs::Engine, at: "/jobs"
    mount PgHero::Engine, at: "/pghero"
    mount SolidErrors::Engine, at: "/solid_errors"
  end
  CONTENT

  content = content.gsub("\n    mount_avo", "") unless questions[:avo]
  content = content.gsub("\n    mount PgHero::Engine, at: \"/pghero\"", "") unless postgresql?

  insert_into_file "config/routes.rb", content, before: /\nend$/
end

questions = {
  cloudflare:        yes?("Are you using Cloudflare? (y/N)"),
  meilisearch:       yes?("Do you want to install Meilisearch? (y/N)"),
  avo:               yes?("Do you want to install Avo? (y/N)"),
  devise:            yes?("Do you want to install Devise? (y/N)"),
  phlex:             yes?("Do you want to install Phlex? (y/N)"),
  rails_performance: yes?("Do you want to install Rails Performance? (y/N)"),
}

configure_development_environment(questions:)

remove_file ".ruby-version"
remove_file ".node-version"

remove_file ".github/workflows/ci.yml"
create_file ".github/workflows/ci.yml", remote_file_content(GITHUB_CI_WORKFLOW_URL).gsub("{app_name}", @app_name)
create_file ".github/workflows/kamal-run.yml", remote_file_content(GITHUB_KAMAL_RUN_WORKFLOW_URL).gsub("{app_name}", @app_name)

gsub_file "Dockerfile", "ARG NODE_VERSION=22.12.0", "ARG NODE_VERSION=24.1.0"
gsub_file "Dockerfile", "ARG YARN_VERSION=1.22.21", "ARG YARN_VERSION=4.9.1"
gsub_file "Dockerfile", "chown -R rails:rails db log storage tmp", "chown -R rails:rails db log storage tmp public"

gem "avo", "~> 3.21", ">= 3.21.1" if questions[:avo]
gem "devise", "~> 4.9", ">= 4.9.4" if questions[:devise]
gem "devise-i18n", "~> 1.14" if questions[:devise]
gem "goldiloader", "~> 5.4"
gem "meilisearch-rails", "~> 0.15.0" if questions[:meilisearch]
gem "memory_profiler", "~> 1.1", comment: "rack-mini-profiler dependency to profile memory usage."
gem "mission_control-jobs", "~> 1.0", ">= 1.0.2"
gem "oj", "~> 3.16", ">= 3.16.10"
gem "pagy", "~> 9.3", ">= 9.3.4"
gem "pghero", "~> 3.7" if postgresql?
gem "pg_query", "~> 6.1" if postgresql?
gem "phlex-icons", "~> 2.27" if questions[:phlex]
gem "phlex-rails", "~> 2.3", ">= 2.3.1" if questions[:phlex]
gem "rack-attack", "~> 6.7"
gem "rack-mini-profiler", "~> 4.0", comment: "Needs to be added after `pg` gem for auto-detection."
gem "rails_cloudflare_turnstile", "~> 0.4.1" if questions[:cloudflare]
gem "rails_performance", "~> 1.4", ">= 1.4.2" if questions[:rails_performance]
gem "rails-i18n", "~> 8.0", ">= 8.0.1"
gem "sitemap_generator", "~> 6.3"
gem "solid_errors", "~> 0.7.0"
gem "stackprof", "~> 0.2.27", comment: "rack-mini-profiler dependency to generate flamegraphs."
gem "strict_ivars", "~> 1.0", ">= 1.0.2", require: false
gem "tailwind_merge", "~> 1.2" if questions[:phlex]

if questions[:cloudflare]
  gem_group :production do
    gem "cloudflare-rails", "~> 6.2"
  end
end

gem_group :development do
  gem "annotaterb", "~> 4.16"
  gem "better_errors", "~> 2.10", ">= 2.10.1"
  gem "binding_of_caller", "~> 1.0", ">= 1.0.1"
  gem "hotwire-spark", "~> 0.1.13"
  gem "i18n-tasks", "~> 1.0", ">= 1.0.15"
  gem "rubocop-rake", "~> 0.7.1"
  gem "rubocop-rspec", "~> 3.6"
  gem "rubocop-rspec_rails", "~> 2.31"
  gem "ruby_ui", "~> 1.0", ">= 1.0.1" if questions[:phlex]
end

gem_group :test do
  gem "factory_bot_rails", "~> 6.5"
  gem "shoulda-matchers", "~> 6.5"
  gem "simplecov", "~> 0.22.0", require: false
  gem "simplecov-json", "~> 0.2.3"
  gem "webmock", "~> 3.25", ">= 3.25.1"
end

gem_group :development, :test do
  gem "active_record_doctor", github: "gregnavis/active_record_doctor"
  gem "rspec-rails", "~> 8.0", ">= 8.0.1"
end

after_bundle do
  configure_production_gems(questions:)
  configure_development_gems(questions:)
  configure_test_gems(questions:)

  gsub_file "Gemfile", %(gem "web-console"\nend), %(gem "web-console"\nend\n)

  generate_static_controller
  update_routes(questions:)

  if mise_installed?
    run "mise install"

    run "mise exec -- bundle install"
    run "mise exec -- yarn install"

    %w[@tailwindcss/cli @tailwindcss/forms @tailwindcss/typography tailwindcss tw-animate-css prettier].each do |package|
      run "mise exec -- yarn remove #{package}" unless package == "prettier"
      run "mise exec -- yarn add -D #{package}"
    end

    run "mise exec -- bundle exec rubocop -a"
    run "mise exec -- i18n-tasks normalize"

    gsub_file "package.json", %(--minify"), %(--minify",\n    "format:js": "npx prettier ./app/javascript/ --write")
  end

  if docker_installed?
    run "mise docker:start"
    rails_command "db:create db:migrate"

    if questions[:avo]
      generate "avo:resource User"

      insert_into_file "app/avo/resources/user.rb", "\n  self.devise_password_optional = true\n", before: "\n  def fields"
      insert_into_file "app/avo/resources/user.rb", "\n    field :password, as: :password", after: "field :email, as: :text"
    end

    run "mise docker:stop"
  end

  remove_file "README.md"
  create_file "README.md", remote_file_content(README_URL)
  create_file "README.en.md", remote_file_content(README_EN_URL)

  git add: "."
  git commit: "-m 'Initial commit'"
end
