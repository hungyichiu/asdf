class Candidate < ApplicationRecord
  validates :name, presence: true
  validates :age, numericality: { greater_than: 40}
  #validates(:name, {prensence: true})
  has_many :vote_logs, dependent: :destroy
  has_many :users, through: :vote_logs
end

# rails g model Candidate ...