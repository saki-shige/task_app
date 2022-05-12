class Task < ApplicationRecord
    validates :name, presence: true, length: { maximum: 30 }
    validates :start_at, presence: true
    validates :end_at, presence: true
    validates :note, length: {maximum: 100}
    validate :start_cannot_be_in_the_past
    validate :end_cannot_be_earlier_than_start

    private
    def start_cannot_be_in_the_past
        if start_at.present? && start_at < Date.today
          errors.add(:start_at, "に過去の日時は使用できません")
        end
    end
    def end_cannot_be_earlier_than_start
      if end_at.present? && start_at.present? && (end_at.before? start_at)
        errors.add(:end_at, "は開始日時以降を指定してください")
      end
    end
end
