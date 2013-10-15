class Paste < ActiveRecord::Base
  belongs_to :user

	validates :title,
    presence: true

  validates :content,
		presence: true

  after_initialize :init

  attr_accessor :user

  def init
    if self.content.present? && self.title.blank?
      self.title = "unnamed"
    end
  end

  def to_s
    String str = self.title
    str += " by "
    if self.user_id != nil
      str += User.find(self.user_id).name
    else
      str += "Anonymous"
    end
    str
  end

	def self.feed
		Paste.all.order('created_at DESC').limit(5)
	end
end
