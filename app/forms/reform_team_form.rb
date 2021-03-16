class TeamForm < Reform::Form
  property :name
  property :coach
  property :nationality

  validates :name, presence: true
  validates :coach, presence: true
  validates :nationality, inclusion: { in: %w(French British Vietnamese Chinese Russian Martian Austrian German Scottish Columbian Breton American Polish Lebanese), message: "%{value} is not a valid nationality" }

  collection :players, populate_if_empty: Player do
    property :first_name
    property :last_name
    property :nationality

    validates :first_name, presence: true
    validates :last_name, presence: true

    validate :fr_citizen?

    def fr_citizen?
      errors.add(:nationality, "The player is not a French player") if nationality != "French"
    end
  end
end
