# frozen_string_literal: true

class User < ApplicationRecord
  has_many :lotteries, dependent: :destroy
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
