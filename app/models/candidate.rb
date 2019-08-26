class Candidate < ApplicationRecord
  validates :name, presence: true
  validates :age, numericality: { greater_than: 40,less_than: 70 }
  #validates(:name, {prensence: true})
  has_many :vote_logs, dependent: :destroy
end

# rails g model Candidate ...