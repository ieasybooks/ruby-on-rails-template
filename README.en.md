# Ruby on Rails Template

The template used for setting up EasyBooks projects running on Ruby on Rails

![Ruby Version](https://img.shields.io/badge/Ruby-3.4.4-red?style=for-the-badge&logo=ruby)
![Rails Version](https://img.shields.io/badge/Rails-8.0.2-red?style=for-the-badge&logo=rubyonrails)
![Node.js Version](https://img.shields.io/badge/Node.js-24.1.0-green?style=for-the-badge&logo=node.js)
![Yarn Version](https://img.shields.io/badge/Yarn-4.9.1-blue?style=for-the-badge&logo=yarn)
![PostgreSQL Version](https://img.shields.io/badge/PostgreSQL-17.5-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Meilisearch Version](https://img.shields.io/badge/Meilisearch-1.15.2-deeppink?style=for-the-badge&logo=meilisearch)

<div align="center">

  [![ar](https://img.shields.io/badge/lang-ar-brightgreen.svg)](README.md)
  [![en](https://img.shields.io/badge/lang-en-red.svg)](README.en.md)

</div>

## 🚀 Creating a New Project Using the Template

### Prerequisites

1. Install Docker for your operating system through [this link](https://docs.docker.com/engine/install)
2. Install Mise for your operating system through [this link](https://mise.jdx.dev/installing-mise.html)
3. Install the `gpg` library for your operating system. For example, run this command if you're using macOS:
   ```
   brew install gnupg
   ```
4. Install the `libpq` library for your operating system. For example, run this command if you're using macOS:
   ```
   brew install libpq
   ```
5. Add the `libpq` library to the `PATH` variable for your operating system by following the instructions shown after installing the library. For example, run this command if you're using macOS with `Zsh`:
   ```
   echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> /Users/{user}/.zshrc
   ```

### Creating the Project

Use the following command to create your new project using the template:

```bash
~> rails new {app_name} --database=postgresql --css=tailwind --js=esbuild --skip-test \
  --template https://raw.githubusercontent.com/ieasybooks/ruby-on-rails-template/refs/heads/main/template.rb
```

### Project Creation Options

During project creation, you can specify 5 options (All of them are disabled by default):

- **Do you want to use Cloudflare?** You'll get the following libraries if you use it, along with the required configurations:
  - rails_cloudflare_turnstile
  - cloudflare-rails

- **Do you want to use Meilisearch?** You'll get the following libraries if you use it, along with the required configurations and its related Docker service:
  - meilisearch-rails

- **Do you want to use Avo?** You'll get the following libraries if you use it, along with the required configurations:
  - avo

- **Do you want to use Devise?** You'll get the following libraries if you use it, along with the required configurations:
  - devise
  - devise-i18n

- **Do you want to use Phlex?** You'll get the following libraries if you use it, along with the required configurations:
  - phlex-icons
  - phlex-rails
  - ruby_ui
  - tailwind_merge

### Installed Tools

You'll get the following tools by following the steps mentioned above:

- [Docker](https://docker.com)
- [Mise](https://mise.jdx.dev)
- [gnupg](https://www.gnupg.org)
- [libpq](https://postgresql.org/docs/current/libpq.html)
- [Ruby](https://ruby-lang.org) (3.4.4)
- [Rails](https://rubyonrails.org) (8.0.2)
- [Node.js](https://nodejs.org) (24.1.0)
- [Yarn](https://yarnpkg.com) (4.9.1)
- [PostgreSQL](https://postgresql.org) (17.5)
- [Meilisearch](https://meilisearch.com) (1.15.2)

### Ports and Services

You can access the services through the following ports:

- PostgreSQL → 5433 (localhost:5433)
- Meilisearch → 7701 (localhost:7701)

Once you stop the local development server by pressing `Cmd+C` or `Ctrl+C`, the `Docker` services (PostgreSQL and Meilisearch) will automatically stop working.

## ⚙️ Editor Setup

The template is configured to work with VSCode editor or similar editors like Cursor, Windsurf, and others. Once you open the project in one of these editors, you'll see a notification asking "Do you want to install the recommended extensions?". If you click the Install button, the installation process for the extensions found in the [`.vscode/extensions.json`](.vscode/extensions.json) file will begin.

Recommended extensions:

- [Ruby LSP](https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-lsp)
- [Rails DB Schema](https://marketplace.visualstudio.com/items?itemName=aki77.rails-db-schema)
- [Rails I18n](https://marketplace.visualstudio.com/items?itemName=aki77.rails-i18n)
- [Tailwind CSS IntelliSense](https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss)
- [vscode-gemfile](https://marketplace.visualstudio.com/items?itemName=bung87.vscode-gemfile)
- [GitLens — Git supercharged](https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens)
- [Mise VSCode](https://marketplace.visualstudio.com/items?itemName=hverlin.mise-vscode)
- [Stimulus LSP](https://marketplace.visualstudio.com/items?itemName=marcoroth.stimulus-lsp)
- [Live Preview](https://marketplace.visualstudio.com/items?itemName=ms-vscode.live-server)
- [SQLTools](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools)
- [SQLTools PostgreSQL/Cockroach Driver](https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools-driver-pg)
- [vscode-icons](https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons)
- [Git Blame](https://marketplace.visualstudio.com/items?itemName=waderyan.gitblame)

The settings for all these extensions are already present in the [`.vscode/settings.json`](.vscode/settings.json) file, so there's no need to configure them manually.

## 💎 Ruby Libraries Used

*Note: All libraries should be specified with a specific version to ensure stability and compatibility.*

### Authentication and Security
- [devise](https://github.com/heartcombo/devise)
- [devise-i18n](https://github.com/tigrish/devise-i18n)
- [rack-attack](https://github.com/rack/rack-attack)
- [rails_cloudflare_turnstile](https://github.com/instrumentl/rails-cloudflare-turnstile)

### Search, Performance, and Optimization
- [goldiloader](https://github.com/salsify/goldiloader)
- [meilisearch-rails](https://github.com/meilisearch/meilisearch-rails)
- [oj](https://github.com/ohler55/oj)
- [pagy](https://github.com/ddnexus/pagy)
- [sitemap_generator](https://github.com/kjvarga/sitemap_generator)

### User Interface
- [phlex-icons](https://github.com/AliOsm/phlex-icons)
- [phlex-rails](https://github.com/yippee-fun/phlex-rails)
- [rails-i18n](https://github.com/svenfuchs/rails-i18n)
- [ruby_ui](https://github.com/ruby-ui/ruby_ui)
- [tailwind_merge](https://github.com/gjtorikian/tailwind_merge)

### Development and Testing
- [active_record_doctor](https://github.com/gregnavis/active_record_doctor)
- [annotaterb](https://github.com/drwl/annotaterb)
- [better_errors](https://github.com/BetterErrors/better_errors)
- [binding_of_caller](https://github.com/banister/binding_of_caller)
- [factory_bot_rails](https://github.com/thoughtbot/factory_bot_rails)
- [hotwire-spark](https://github.com/hotwired/spark)
- [i18n-tasks](https://github.com/glebm/i18n-tasks)
- [rspec-rails](https://github.com/rspec/rspec-rails)
- [rubocop-rake](https://github.com/rubocop/rubocop-rake)
- [rubocop-rspec](https://github.com/rubocop/rubocop-rspec)
- [rubocop-rspec_rails](https://github.com/rubocop/rubocop-rspec_rails)
- [shoulda-matchers](https://github.com/thoughtbot/shoulda-matchers)
- [simplecov-json](https://github.com/vicentllongo/simplecov-json)
- [simplecov](https://github.com/simplecov-ruby/simplecov)
- [webmock](https://github.com/bblimke/webmock)

### Production and Monitoring
- [avo](https://github.com/avo-hq/avo)
- [cloudflare-rails](https://github.com/modosc/cloudflare-rails)
- [memory_profiler](https://github.com/SamSaffron/memory_profiler)
- [mission_control-jobs](https://github.com/rails/mission_control-jobs)
- [pg_query](https://github.com/pganalyze/pg_query)
- [pghero](https://github.com/ankane/pghero)
- [rack-mini-profiler](https://github.com/MiniProfiler/rack-mini-profiler)
- [solid_errors](https://github.com/fractaledmind/solid_errors)
- [stackprof](https://github.com/tmm1/stackprof)
- [strict_ivars](https://github.com/yippee-fun/strict_ivars)

In addition to the core Ruby on Rails framework libraries.

## 🟨 JavaScript Libraries Used

*Note: All libraries should be specified with a specific version to ensure stability and compatibility.*

- [@tailwindcss/forms](https://github.com/tailwindlabs/tailwindcss-forms)
- [@tailwindcss/typography](https://github.com/tailwindlabs/tailwindcss-typography)
- [tw-animate-css](https://github.com/Wombosvideo/tw-animate-css)

In addition to the core Ruby on Rails framework libraries. 