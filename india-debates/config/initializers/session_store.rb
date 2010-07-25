# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_india-decides_session',
  :secret      => '3dcb3a345feb0c5f78b0fa1cec1f23b5dd9a5f7c3586f4d701db7406607aeffe2eaec0a9f5a9dab74a33c76e7ac35c2fa8b310bab8278c96dce38e5a5520a710'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
