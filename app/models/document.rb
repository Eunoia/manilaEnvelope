class Document < ActiveRecord::Base
  belongs_to :user

  validates :case_number, presence: true
  validates :case_number, uniqueness: {message: "Someone has already submitted this case number, sorry"}
  validates :filepicker_url, presence: true
  validates :date_opened, presence: true
  validates :case_name, presence: true

end
