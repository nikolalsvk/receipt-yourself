class Company < ActiveRecord::Base
	has_many :users

	validates :name, presence: true,
									 unique: true
end
