<h1 dir="rtl">قالب Ruby on Rails</h1>

<p dir="rtl">القالب المستخدم في تجهيز مشاريع الكتب المُيسّرة العاملة بإستخدام Ruby on Rails</p>

<div dir="rtl">
  <img src="https://img.shields.io/badge/Ruby-3.4.4-red?style=for-the-badge&logo=ruby" alt="Ruby Version">
  <img src="https://img.shields.io/badge/Rails-8.0.2-red?style=for-the-badge&logo=rubyonrails" alt="Rails Version">
  <img src="https://img.shields.io/badge/Node.js-24.1.0-green?style=for-the-badge&logo=node.js" alt="Node.js Version">
  <img src="https://img.shields.io/badge/Yarn-4.9.1-blue?style=for-the-badge&logo=yarn" alt="Yarn Version">
  <img src="https://img.shields.io/badge/PostgreSQL-17.5-316192?style=for-the-badge&logo=postgresql&logoColor=white" alt="PostgreSQL Version">
  <img src="https://img.shields.io/badge/Meilisearch-1.15.2-deeppink?style=for-the-badge&logo=meilisearch" alt="Meilisearch Version">
</div>

<br>

<div align="center">

  [![ar](https://img.shields.io/badge/lang-ar-brightgreen.svg)](README.md)
  [![en](https://img.shields.io/badge/lang-en-red.svg)](README.en.md)

</div>

<h2 dir="rtl">🚀 إنشاء مشروع جديد باستخدام القالب</h2>

<h3 dir="rtl">المتطلبات الأساسية</h3>

<ol dir="rtl">
  <li>ثبّت Docker حسب نظام تشغيلك من خلال <a href="https://docs.docker.com/engine/install">هذا الرابط</a></li>
  <li>ثبّت Mise حسب نظام تشغيلك من خلال <a href="https://mise.jdx.dev/installing-mise.html">هذا الرابط</a></li>
  <li>ثبّت مكتبة <code>gpg</code> حسب نظام تشغيلك. على سبيل المثال، نفّذ هذا الأمر إذا كنت تستخدم نظام macOS:</li>
  <pre dir="ltr">brew install gnupg</pre>
  <li>ثبّت مكتبة <code>libpq</code> حسب نظام تشغيلك. على سبيل المثال، نفّذ هذا الأمر إذا كنت تستخدم نظام macOS:</li>
  <pre dir="ltr">brew install libpq</pre>
  <li>أضِف مكتبة <code>libpq</code> إلى متغير <code>PATH</code> حسب نظام تشغيلك باتباع التعليمات الموضّحة بعد تثبيت المكتبة. على سبيل المثال، نفّذ هذا الأمر إذا كنت تستخدم نظام macOS مع <code>Zsh</code>:</li>
  <pre dir="ltr">echo 'export PATH="/opt/homebrew/opt/libpq/bin:$PATH"' >> /Users/{user}/.zshrc</pre>
</ol>

<h3 dir="rtl">إنشاء المشروع</h3>

<p dir="rtl">استخدم الأمر التالي لإنشاء مشروعك الجديد باستخدام القالب</p>

```bash
~> rails new {app_name} --database=postgresql --css=tailwind --js=esbuild --skip-test \
  --template https://raw.githubusercontent.com/ieasybooks/ruby-on-rails-template/refs/heads/main/template.rb
```

<h3 dir="rtl">خيارات إنشاء المشروع</h3>

<p dir="rtl">خلال إنشاء المشروع يمكنك تحديد 5 أمور (جميعها مُعطّلة افتراضيًا):</p>

<ul dir="rtl">
  <li>
    هل تريد استخدام Cloudflare؟ ستحصل على المكتبات التالية إذا كنت ستستخدمه بالإضافة إلى الإعدادات المطلوبة:

<ul dir="rtl">
  <li>rails_cloudflare_turnstile</li>
  <li>cloudflare-rails</li>
</ul>
  </li>

  <li>
    هل تريد استخدام Meilisearch؟ ستحصل على المكتبات التالية إذا كنت ستستخدمه بالإضافة إلى الإعدادات المطلوبة وخدمة Docker المُتعلقة به:

<ul dir="rtl">
  <li>meilisearch-rails</li>
</ul>
  </li>

  <li>
    هل تريد استخدام Avo؟ ستحصل على المكتبات التالية إذا كنت ستستخدمه بالإضافة إلى الإعدادات المطلوبة:

<ul dir="rtl">
  <li>avo</li>
</ul>
  </li>

  <li>
    هل تريد استخدام Devise؟ ستحصل على المكتبات التالية إذا كنت ستستخدمه بالإضافة إلى الإعدادات المطلوبة:

<ul dir="rtl">
  <li>devise</li>
  <li>devise-i18n</li>
</ul>
  </li>

  <li>
    هل تريد استخدام Phlex؟ ستحصل على المكتبات التالية إذا كنت ستستخدمه بالإضافة إلى الإعدادات المطلوبة:

<ul dir="rtl">
  <li>phlex-icons</li>
  <li>phlex-rails</li>
  <li>ruby_ui</li>
  <li>tailwind_merge</li>
</ul>
  </li>
</ul>

<h3 dir="rtl">الأدوات المُثبتة</h3>

<p dir="rtl">ستحصل على الأدوات التالية باتباعك للخطوات المذكورة أعلاه:</p>

<ul>
  <li><a href="https://docker.com">Docker</a></li>
  <li><a href="https://mise.jdx.dev">Mise</a></li>
  <li><a href="https://www.gnupg.org">gnupg</a></li>
  <li><a href="https://postgresql.org/docs/current/libpq.html">libpq</a></li>
  <li><a href="https://ruby-lang.org">Ruby</a> (3.4.4)</li>
  <li><a href="https://rubyonrails.org">Rails</a> (8.0.2)</li>
  <li><a href="https://nodejs.org">Node.js</a> (24.1.0)</li>
  <li><a href="https://yarnpkg.com">Yarn</a> (4.9.1)</li>
  <li><a href="https://postgresql.org">PostgreSQL</a> (17.5)</li>
  <li><a href="https://meilisearch.com">Meilisearch</a> (1.15.2)</li>
</ul>

<h3 dir="rtl">المنافذ والخدمات</h3>

<p dir="rtl">يمكنك الوصول إلى الخدمات من خلال المنافذ التالية:</p>

<ul>
  <li>PostgreSQL → 5433 (localhost:5433)</li>
  <li>Meilisearch → 7701 (localhost:7701)</li>
</ul>

<p dir="rtl">وبمجرّد إيقاف تشغيل خادم التطوير المحلّي من خلال الضغط على <code>Cmd+C</code> أو <code>Ctrl+C</code>، ستتوقف خدمات <code>Docker</code> (PostgreSQL و Meilisearch) عن العمل تلقائيًا.</p>

<h2 dir="rtl">⚙️ تجهيز المحرر</h2>

<p dir="rtl">
أُعِدّ القالب ليعمل مع محرر VSCode أو ما يشبهه من المحررات مثل Cursor و Windsurf وغيرهما. بمجرّد فتح المشروع في أحد هذه المحررات سيظهر لك إشعار يسألك "هل تريد تثبيت الإضافات المُوصى بها؟"، وإذا ضغطت على زر Install ستبدأ عملية تثبيت الإضافات الموجودة في ملف <a href=".vscode/extensions.json"><code dir="ltr">.vscode/extensions.json</code></a>.
</p>

<p dir="rtl">الإضافات المُوصى بها:</p>

<ul>
  <li><a href="https://marketplace.visualstudio.com/items?itemName=Shopify.ruby-lsp">Ruby LSP</a></li>
  <li><a href="https://marketplace.visualstudio.com/items?itemName=aki77.rails-db-schema">Rails DB Schema</a></li>
  <li><a href="https://marketplace.visualstudio.com/items?itemName=aki77.rails-i18n">Rails I18n</a></li>
  <li><a href="https://marketplace.visualstudio.com/items?itemName=bradlc.vscode-tailwindcss">Tailwind CSS IntelliSense</a></li>
  <li><a href="https://marketplace.visualstudio.com/items?itemName=bung87.vscode-gemfile">vscode-gemfile</a></li>
  <li><a href="https://marketplace.visualstudio.com/items?itemName=eamodio.gitlens">GitLens — Git supercharged</a></li>
  <li><a href="https://marketplace.visualstudio.com/items?itemName=hverlin.mise-vscode">Mise VSCode</a></li>
  <li><a href="https://marketplace.visualstudio.com/items?itemName=marcoroth.stimulus-lsp">Stimulus LSP</a></li>
  <li><a href="https://marketplace.visualstudio.com/items?itemName=ms-vscode.live-server">Live Preview</a></li>
  <li><a href="https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools">SQLTools</a></li>
  <li><a href="https://marketplace.visualstudio.com/items?itemName=mtxr.sqltools-driver-pg">SQLTools PostgreSQL/Cockroach Driver</a></li>
  <li><a href="https://marketplace.visualstudio.com/items?itemName=vscode-icons-team.vscode-icons">vscode-icons</a></li>
  <li><a href="https://marketplace.visualstudio.com/items?itemName=waderyan.gitblame">Git Blame</a></li>
</ul>

<p dir="rtl">كما أن إعدادات جميع هذه الإضافات موجودة مسبقًا في ملف <a href=".vscode/settings.json"><code dir="ltr">.vscode/settings.json</code></a>، لذا لا داعي لإعدادها يدويًّا.</p>

<h2 dir="rtl">💎 المكتبات المستخدمة للغة Ruby</h2>

<p dir="rtl"><em>ملاحظة: جميع المكتبات يجب أن تكون مُحددة بإصدار مُعيّن لضمان الاستقرار والتوافق.</em></p>

<h3 dir="rtl">المصادقة والأمان</h3>
<ul>
  <li><a href="https://github.com/heartcombo/devise">devise</a></li>
  <li><a href="https://github.com/tigrish/devise-i18n">devise-i18n</a></li>
  <li><a href="https://github.com/rack/rack-attack">rack-attack</a></li>
  <li><a href="https://github.com/instrumentl/rails-cloudflare-turnstile">rails_cloudflare_turnstile</a></li>
  <li><a href="https://github.com/modosc/cloudflare-rails">cloudflare-rails</a></li>
</ul>

<h3 dir="rtl">البحث والأداء والتحسين</h3>
<ul>
  <li><a href="https://github.com/meilisearch/meilisearch-rails">meilisearch-rails</a></li>
  <li><a href="https://github.com/salsify/goldiloader">goldiloader</a></li>
  <li><a href="https://github.com/ddnexus/pagy">pagy</a></li>
  <li><a href="https://github.com/ohler55/oj">oj</a></li>
  <li><a href="https://github.com/kjvarga/sitemap_generator">sitemap_generator</a></li>
</ul>

<h3 dir="rtl">واجهة المستخدم</h3>
<ul>
  <li><a href="https://github.com/yippee-fun/phlex-rails">phlex-rails</a></li>
  <li><a href="https://github.com/AliOsm/phlex-icons">phlex-icons</a></li>
  <li><a href="https://github.com/ruby-ui/ruby_ui">ruby_ui</a></li>
  <li><a href="https://github.com/gjtorikian/tailwind_merge">tailwind_merge</a></li>
  <li><a href="https://github.com/svenfuchs/rails-i18n">rails-i18n</a></li>
</ul>

<h3 dir="rtl">التطوير والاختبار</h3>
<ul>
  <li><a href="https://github.com/gregnavis/active_record_doctor">active_record_doctor</a></li>
  <li><a href="https://github.com/drwl/annotaterb">annotaterb</a></li>
  <li><a href="https://github.com/BetterErrors/better_errors">better_errors</a></li>
  <li><a href="https://github.com/banister/binding_of_caller">binding_of_caller</a></li>
  <li><a href="https://github.com/hotwired/spark">hotwire-spark</a></li>
  <li><a href="https://github.com/glebm/i18n-tasks">i18n-tasks</a></li>
  <li><a href="https://github.com/rubocop/rubocop-rake">rubocop-rake</a></li>
  <li><a href="https://github.com/rubocop/rubocop-rspec">rubocop-rspec</a></li>
  <li><a href="https://github.com/rubocop/rubocop-rspec_rails">rubocop-rspec_rails</a></li>
  <li><a href="https://github.com/rspec/rspec-rails">rspec-rails</a></li>
  <li><a href="https://github.com/thoughtbot/factory_bot_rails">factory_bot_rails</a></li>
  <li><a href="https://github.com/thoughtbot/shoulda-matchers">shoulda-matchers</a></li>
  <li><a href="https://github.com/simplecov-ruby/simplecov">simplecov</a></li>
  <li><a href="https://github.com/vicentllongo/simplecov-json">simplecov-json</a></li>
  <li><a href="https://github.com/bblimke/webmock">webmock</a></li>
</ul>

<h3 dir="rtl">الإنتاج والمراقبة</h3>
<ul>
  <li><a href="https://github.com/avo-hq/avo">avo</a></li>
  <li><a href="https://github.com/rails/mission_control-jobs">mission_control-jobs</a></li>
  <li><a href="https://github.com/ankane/pghero">pghero</a></li>
  <li><a href="https://github.com/pganalyze/pg_query">pg_query</a></li>
  <li><a href="https://github.com/fractaledmind/solid_errors">solid_errors</a></li>
  <li><a href="https://github.com/MiniProfiler/rack-mini-profiler">rack-mini-profiler</a></li>
  <li><a href="https://github.com/SamSaffron/memory_profiler">memory_profiler</a></li>
  <li><a href="https://github.com/tmm1/stackprof">stackprof</a></li>
  <li><a href="https://github.com/yippee-fun/strict_ivars">strict_ivars</a></li>
</ul>

<p dir="rtl">بالإضافة إلى مكتبات إطار عمل Ruby on Rails الأساسية.</p>

<h2 dir="rtl">🟨 المكتبات المستخدمة للغة JavaScript</h2>

<p dir="rtl"><em>ملاحظة: جميع المكتبات يجب أن تكون مُحددة بإصدار مُعيّن لضمان الاستقرار والتوافق.</em></p>

<ul>
  <li><a href="https://github.com/Wombosvideo/tw-animate-css">tw-animate-css</a></li>
  <li><a href="https://github.com/tailwindlabs/tailwindcss-forms" dir="ltr">@tailwindcss/forms</a></li>
  <li><a href="https://github.com/tailwindlabs/tailwindcss-typography" dir="ltr">@tailwindcss/typography</a></li>
</ul>

<p dir="rtl">بالإضافة إلى مكتبات إطار عمل Ruby on Rails الأساسية.</p>
