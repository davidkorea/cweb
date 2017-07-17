class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


    has_many :ccases
    has_many :posts

    def admin?
      is_admin
    end

    def display_name
      if self.username.present?
        self.username
      else
        self.email.split("@").first
      end
    end

end
