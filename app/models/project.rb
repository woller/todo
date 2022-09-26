class Project < ApplicationRecord
  # 🚅 add concerns above.

  # 🚅 add attribute accessors above.

  belongs_to :team
  belongs_to :lead, class_name: "Membership", optional: true
  # 🚅 add belongs_to associations above.

  has_many :goals, dependent: :destroy
  has_many :applied_tags, class_name: "Projects::AppliedTag", dependent: :destroy
  has_many :tags, through: :applied_tags
  # 🚅 add has_many associations above.

  has_rich_text :description
  # 🚅 add has_one associations above.

  # 🚅 add scopes above.

  validates :name, presence: true
  validates :lead, scope: true
  # 🚅 add validations above.

  # 🚅 add callbacks above.

  # 🚅 add delegations above.

  def valid_leads
    team.memberships.current_and_invited
  end

  def valid_tags
    team.projects_tags
  end

  # 🚅 add methods above.
end
