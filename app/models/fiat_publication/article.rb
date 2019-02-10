module FiatPublication
  class Article < ApplicationRecord
    include Tokenable
    # audited
    # has_associated_audits

    self.table_name = "fi_articles"

    belongs_to :publisher, polymorphic: true
    belongs_to :author
    has_many :content_blocks, as: :publishable
    has_many :custom_fields, as: :publishable, dependent: :destroy, inverse_of: :publishable
    accepts_nested_attributes_for :custom_fields, reject_if: :all_blank, allow_destroy: true
    has_many :content_label_assignments, as: :assignable, dependent: :destroy
    has_many :content_labels, through: :content_label_assignments

    has_one_attached :image

    validates :title, presence: true

    enum image_placement: {
      billboard: 0,
      right: 1
    }, _prefix: :image

    scope :published, lambda { where.not(published_at: nil).includes(:author) }
  end
end
