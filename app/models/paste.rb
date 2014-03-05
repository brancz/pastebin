class Paste < ActiveRecord::Base
  belongs_to :user

  validates :content,
    presence: true

  after_initialize :init

  def init
    if content.present? && title.blank?
      self.title = "unnamed"
    end
  end

  def formatted
    if language.blank?
      Pygments.highlight(content, options: {encoding: 'utf-8'}).html_safe
    else
      Pygments.highlight(content, 
                         lexer: Pygments.lexers[language][:aliases][0], 
                         options: {encoding: 'utf-8'}).html_safe
    end
  end

  def self.feed
    Paste.all.order('created_at DESC').limit(5)
  end
end
