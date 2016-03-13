class Question < ActiveRecord::Base

  validates_presence_of :question
  validates_presence_of :answer

  def correct?(submission)
    sanitize(answer) == sanitize(submission)
  end

  private

  def sanitize(string)
    string.
      gsub(/\s{2,}/, ' ').
      gsub(/\d+/){ |d| d.to_i.humanize }.
      strip.
      downcase
  end
end
