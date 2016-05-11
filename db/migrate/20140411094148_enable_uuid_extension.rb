class EnableUuidExtension < ActiveRecord::Migration[5.0]
  def change

    if Rails.env.development? || Rails.env.test?
      enable_extension 'uuid-ossp'
    end
    # on production run CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
    # manually using postgres superuser
  end
end
