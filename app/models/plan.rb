class Plan < ApplicationRecord

    validates :title, presence: true, length: {maximum: 20}
    validates :start, presence: true
    validates :end, presence: true
    validates :all_day, inclusion: [true, false]
    validates :memo, length: {maximum: 500}
    validate :date_rule
        def date_rule
            return if self.start.blank? || self.end.blank?
            errors.add(:end, "は開始日以降の日付で選択してください。") unless
            self.start <= self.end
        end
end
