class Paste < ActiveRecord::Base
	validates :title,
    presence: true

  validates :content,
		presence: true

  after_initialize :init

  def init
    if self.content.present? && self.title.blank?
      self.title = "unnamed"
    end
  end

	def self.feed
		Paste.all.order('created_at DESC').limit(5)
	end
end
