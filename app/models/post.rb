class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 10 }
    validates :summary, length: { maximum: 100 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validate :is_clickbait?

    CLICKBAIT_PATTERN = [
        /Won't Believe/,
        /Secret/,
        /Top Number/,
        /Guess/
    ]

    def is_clickbait?
        if CLICKBAIT_PATTERN.none? { |pat| pat.match title }
        errors.add(:title, "Not a clickbait")
        end
    end
end
