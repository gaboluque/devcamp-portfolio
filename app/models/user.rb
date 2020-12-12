# frozen_string_literal: true

# User Model
class User < ApplicationRecord
  ############################################################################################
  ## PeterGate Roles                                                                        ##
  ## The :user role is added by default and shouldn't be included in this list.             ##
  ## The :root_admin can access any page regardless of access settings. Use with caution!   ##
  ## The multiple option can be set to true if you need users to have multiple roles.       ##
  petergate(roles: %i[site_admin], multiple: false)                                       ##
  ############################################################################################ 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :trackable

  validates_presence_of :name

  has_many :comments, dependent: :destroy

  def first_name
    name.split.first
  end

  def last_name
    name.split.last
  end
end
