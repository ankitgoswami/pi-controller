# RailsSettings Model
class Setting < RailsSettings::Base
  cache_prefix { "v1" }

  # Define your fields
  # field :host, type: :string, default: "http://localhost:3000"
  # field :default_locale, default: "en", type: :string
  # field :confirmable_enable, default: "0", type: :boolean
  # field :admin_emails, default: "admin@rubyonrails.org", type: :array
  # field :omniauth_google_client_id, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_ID"] || ""), type: :string, readonly: true
  # field :omniauth_google_client_secret, default: (ENV["OMNIAUTH_GOOGLE_CLIENT_SECRET"] || ""), type: :string, readonly: true
  scope :magic_mirror do
    field :family_members, type: :hash, default: {
      dog: "Muffin",
      wife: "Dipti",
      husband: "Ankit"
    },
    validates: { presence: true, length: { in: 3..5 } }
  end

  scope :features do
    field :captcha_enable, type: :boolean, default: true
  end
end
