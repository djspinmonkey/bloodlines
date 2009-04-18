# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_bloodlines_session',
  :secret      => '65e275e69ad1f28f45fee6fae44cd76026ade782f4032a263737d57c40533219123066195e4c581800c0ddf578f4f4b4cdfc59b1d99b50843efb6cd7eef0c4e3'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
