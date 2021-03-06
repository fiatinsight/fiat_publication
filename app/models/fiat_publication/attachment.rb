module FiatPublication
  class Attachment < ApplicationRecord
    include Tokenable

    self.table_name = "fi_attachments"

    belongs_to :publisher, polymorphic: true, required: false
    belongs_to :attachable, polymorphic: true, required: false
    belongs_to :authorable, polymorphic: true, required: false
    # has_many :navigation_items, as: :navigable

    has_one_attached :file

    validates :title, presence: true
    validates :file, presence: true
  end
end
