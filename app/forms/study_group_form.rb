class StudyGroupForm < Reform::Form
  property :title
  property :level

  validation do
    required(:title).filled
    required(:level) { filled? & int? }
  end
end
