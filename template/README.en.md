# {Project Name}

{Project Description}

![Ruby Version](https://img.shields.io/badge/Ruby-3.4.4-red?style=for-the-badge&logo=ruby)
![Rails Version](https://img.shields.io/badge/Rails-8.0.2-red?style=for-the-badge&logo=rubyonrails)
![Node.js Version](https://img.shields.io/badge/Node.js-24.1.0-green?style=for-the-badge&logo=node.js)
![Yarn Version](https://img.shields.io/badge/Yarn-4.9.1-blue?style=for-the-badge&logo=yarn)
![PostgreSQL Version](https://img.shields.io/badge/PostgreSQL-17.5-316192?style=for-the-badge&logo=postgresql&logoColor=white)
![Meilisearch Version](https://img.shields.io/badge/Meilisearch-1.15.2-deeppink?style=for-the-badge&logo=meilisearch)
![Redis (Valkey) Version](https://img.shields.io/badge/Redis%20(Valkey)-8.1-red?style=for-the-badge&logo=redis)

<div align="center">

  [![ar](https://img.shields.io/badge/lang-ar-brightgreen.svg)](README.md)
  [![en](https://img.shields.io/badge/lang-en-red.svg)](README.en.md)

</div>

## 🚀 Development Environment Setup

### Prerequisites

1. Install Docker for your operating system from [this link](https://docs.docker.com/engine/install)
2. Install Mise for your operating system from [this link](https://mise.jdx.dev/installing-mise.html)
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

### Project Setup

1. Run the following command to clone the project repository to your computer:
   ```
   git clone git@github.com:{username}/{repository}.git
   ```
2. Open the command line inside the project folder and run the following command to install the required development tools through `Mise`:
   ```
   mise install
   ```
3. Run the following command to install project dependencies and start the local development server:
   ```
   mise dev
   ```
4. Open the link [`http://localhost:3000`](http://localhost:3000) in your browser to access the project's homepage

### Installed Tools

You will get the following tools by following the steps mentioned above:

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
- [Redis (Valkey)](https://valkey.io) (8.1)

### Ports and Services

You can access the following services through the following ports:

- PostgreSQL → 5433 (localhost:5433)
- Meilisearch → 7701 (localhost:7701)
- Redis → 6380 (localhost:6380)

Once you stop the local development server by pressing `Cmd+C` or `Ctrl+C`, the `Docker` services (PostgreSQL, Meilisearch, and Redis) will automatically stop working.

## ⚙️ Editor Setup

This project is configured to work with VSCode editor or similar editors such as Cursor, Windsurf, and others. Once you open the project in one of these editors, you will see a notification asking "Do you want to install the recommended extensions?", and if you click the Install button, the installation process for the extensions found in the [`.vscode/extensions.json`](.vscode/extensions.json) file will begin.

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

All the settings for these extensions are already present in the [`.vscode/settings.json`](.vscode/settings.json) file, so there's no need to configure them manually.

## 💎 Ruby Libraries Used

*Note: All libraries should be pinned to a specific version to ensure stability and compatibility.*

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
- [rails_performance](https://github.com/igorkasyanchuk/rails_performance)
- [solid_errors](https://github.com/fractaledmind/solid_errors)
- [stackprof](https://github.com/tmm1/stackprof)
- [strict_ivars](https://github.com/yippee-fun/strict_ivars)

In addition to the core Ruby on Rails framework libraries.

## 🟨 JavaScript Libraries Used

*Note: All libraries should be pinned to a specific version to ensure stability and compatibility.*

- [@tailwindcss/forms](https://github.com/tailwindlabs/tailwindcss-forms)
- [@tailwindcss/typography](https://github.com/tailwindlabs/tailwindcss-typography)
- [tw-animate-css](https://github.com/Wombosvideo/tw-animate-css)

In addition to the core Ruby on Rails framework libraries.

## 🧪 Running Tests

*Note: We strive in this project to maintain complete (100%) code coverage with accurate and useful test cases.*

1. Start the development server by running the `mise dev` command or start the project's Docker services by running the `mise docker:start` command
2. Run the `CI=1 bundle exec rspec` command to run the test cases
3. You will get a report of the source code coverage percentage and you can browse the detailed report found in `coverage/index.html`
4. Stop the development server or stop the Docker services if you started them by running the `mise docker:stop` command
