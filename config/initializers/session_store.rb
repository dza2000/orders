# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_store_session',
  :secret      => '1fa4c141a26cf75817504473ae1235ca1ef43c754cedc0686f4838a8c7f67dc0c3f75b96ca114be0817a01519c971a83119507f5971c98da3eac044be670bf0d'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
 ActionController::Base.session_store = :active_record_store
