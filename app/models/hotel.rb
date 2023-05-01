# frozen_string_literal: true

class Hotel < ApplicationRecord
  extend FriendlyId

  # 喜愛清單關聯
  has_many :favorites, as: :favorable, dependent: :destroy
  has_many :comments, as: :commentable
  validates :name, :tel, :address, presence: true

  has_many :comments, as: :commentable, dependent: :destroy
  validates :name, :address, presence: true
  validates :tel, allow_blank: true,
                  format: { with: /\A(\(\d{2}\)|\d{2})\d{8}\z/, message: '請輸入有效的電話號碼，格式(02)12345678或0912123123' }
  validates :website, format: { with: URI::DEFAULT_PARSER.make_regexp, message: '請輸入有效的網址' }, if: lambda {
                                                                                                    website.present?
                                                                                                  }

  def self.search(keyword)
    where('name LIKE :keyword OR address LIKE :keyword OR hotel_types LIKE :keyword OR equipment::text ILIKE ANY (ARRAY[:keywords])',
          keyword: "%#{keyword}%", keywords: ["%#{keyword}%"],)
  end

  friendly_id :name, use: :slugged

  def should_generate_new_friendly_id?
    name_changed? || slug.blank?
  end

  def normalize_friendly_id(input)
    input.to_s.to_slug.normalize.to_s
  end
  paginates_per 6
  mount_uploader :image, ImageUploader
  mount_uploaders :images, ImageUploader
end
