# Não vou usar a linha de baixo, por enquanto, porque não tenho muitas pastas de teste para o I18n percorrer.
# I18n.load_path += Dir[Rails.root.join('config', 'locale', '*.{rb,yml}')]

I18n.available_locales = [:en, :'pt-BR']

I18n.default_locale = :'pt-BR'

# Não esqueça de subir o servidor novamente para ver as alterações.

# https://guides.rubyonrails.org/i18n.html#overview-of-other-built-in-methods-that-provide-i18n-support

# Para pegar o conteúdo em PT:
# https://raw.githubusercontent.com/svenfuchs/rails-i18n/master/rails/locale/pt-BR.yml