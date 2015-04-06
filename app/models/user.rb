class User < ActiveRecord::Base

attr_accessor :password
validates_confirmation_of :password
validates_uniqueness_of :email
validates_length_of :email, :minimum => 1, :allow_blank => false
validates_length_of :password, :minimum => 1, :allow_blank => false
before_save :encrypt_password
def encrypt_password
self.password_salt = BCrypt::Engine.generate_salt
self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
end



def self.authenticate(email, password)
user = User.where(email: email).first
if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
user
else
nil
end
end


end
