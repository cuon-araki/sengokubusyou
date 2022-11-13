class Post < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  belongs_to :user
  has_many :likes, dependent: :destroy
  has_many :liked_users, through: :likes, source: :user
  has_many :comments, dependent: :destroy

  validates :name, presence: true, length: { maximum: 30 }, uniqueness: true# rubocop:disable all
  validates :furigana_name, presence: true
  validates :furigana_initial, presence: true
  validates :prefecture_name, presence: true
  validates :commentary, presence: true
  mount_uploader :image, ImageUploader, uniqueness: true

  def liked_by?(user)
    likes.any? { |like| like.user_id == user.id }
  end

  enum furigana_initial: {
    あ行: 1, か行: 2, さ行: 3, た行: 4, な行: 5,
    は行: 6, ま行: 7, や行: 8, ら行: 9, わ行: 10
  }

  enum prefecture_name: {
    北海道: 1, 青森県: 2, 岩手県: 3, 宮城県: 4, 秋田県: 5, 山形県: 6, 福島県: 7,
    茨城県: 8, 栃木県: 9, 群馬県: 10, 埼玉県: 11, 千葉県: 12, 東京都: 13, 神奈川県: 14,
    新潟県: 15, 富山県: 16, 石川県: 17, 福井県: 18, 山梨県: 19, 長野県: 20,
    岐阜県: 21, 静岡県: 22, 愛知県: 23, 三重県: 24,
    滋賀県: 25, 京都府: 26, 大阪府: 27, 兵庫県: 28, 奈良県: 29, 和歌山県: 30,
    鳥取県: 31, 島根県: 32, 岡山県: 33, 広島県: 34, 山口県: 35,
    徳島県: 36, 香川県: 37, 愛媛県: 38, 高知県: 39,
    福岡県: 40, 佐賀県: 41, 長崎県: 42, 熊本県: 43, 大分県: 44, 宮崎県: 45, 鹿児島県: 46,
    沖縄県: 47
  }

# rubocop:disable all
  def self.select_furigana_initial(furigana_initial)
    case furigana_initial
    when "あ行"
      where(furigana_initial: "あ行")
    when "か行"
      where(furigana_initial: "か行")
    when "さ行"
      where(furigana_initial: "さ行")
    when "た行"
      where(furigana_initial: "た行")
    when "な行"
      where(furigana_initial: "な行")
    when "は行"
      where(furigana_initial: "は行")
    when "ま行"
      where(furigana_initial: "ま行")
    when "や行"
      where(furigana_initial: "や行")
    when "ら行"
      where(furigana_initial: "ら行")
    when "わ行"
      where(furigana_initial: "わ行")
    end
  end

  def self.prefecture_name(prefecture_name)
    case prefecture_name
    when "北海道"
      where(furigana_initial: "北海道")
    end
    when "青森県"
      where(furigana_initial: "青森県")
    end
    when "岩手県"
      where(furigana_initial: "岩手県")
    end
    when "宮城県"
      where(furigana_initial: "宮城県")
    end
    when "秋田県"
      where(furigana_initial: "秋田県")
    end
    when "山形県"
      where(furigana_initial: "山形県")
    end
    when "福島県"
      where(furigana_initial: "福島県")
    end
    when "茨城県"
      where(furigana_initial: "茨城県")
    end
    when "栃木県"
      where(furigana_initial: "栃木県")
    end
    when "群馬県"
      where(furigana_initial: "群馬県")
    end
    when "埼玉県"
      where(furigana_initial: "埼玉県")
    end
    when "千葉県"
      where(furigana_initial: "千葉県")
    end
    when "東京都"
      where(furigana_initial: "東京都")
    end
    when "神奈川県"
      where(furigana_initial: "神奈川県")
    end
    when "新潟県"
      where(furigana_initial: "新潟県")
    end
    when "富山県"
      where(furigana_initial: "富山県")
    end
    when "石川県"
      where(furigana_initial: "石川県")
    end
    when "福井県"
      where(furigana_initial: "福井県")
    end
    when "山梨県"
      where(furigana_initial: "山梨県")
    end
    when "長野県"
      where(furigana_initial: "長野県")
    end
    when "岐阜県"
      where(furigana_initial: "岐阜県")
    end
    when "静岡県"
      where(furigana_initial: "静岡県")
    end
    when "愛知県"
      where(furigana_initial: "愛知県")
    end
    when "三重県"
      where(furigana_initial: "三重県")
    end
    when "滋賀県"
      where(furigana_initial: "滋賀県")
    end
    when "京都府"
      where(furigana_initial: "京都府")
    end
    when "大阪府"
      where(furigana_initial: "大阪府")
    end
    when "兵庫県"
      where(furigana_initial: "兵庫県")
    end
    when "奈良県"
      where(furigana_initial: "奈良県")
    end
    when "和歌山県"
      where(furigana_initial: "和歌山県")
    end
    when "鳥取県"
      where(furigana_initial: "鳥取県")
    end
    when "島根県"
      where(furigana_initial: "島根県")
    end
    when "岡山県"
      where(furigana_initial: "岡山県")
    end
    when "広島県"
      where(furigana_initial: "広島県")
    end
    when "徳島県"
      where(furigana_initial: "徳島県")
    end
    when "香川県"
      where(furigana_initial: "香川県")
    end
    when "愛媛県"
      where(furigana_initial: "愛媛県")
    end
    when "高知県"
      where(furigana_initial: "高知県")
    end
    when "福岡県"
      where(furigana_initial: "福岡県")
    end
    when "佐賀県"
      where(furigana_initial: "佐賀県")
    end
    when "長崎県"
      where(furigana_initial: "長崎県")
    end
    when "熊本県"
      where(furigana_initial: "熊本県")
    end
    when "大分県"
      where(furigana_initial: "大分県")
    end
    when "宮崎県"
      where(furigana_initial: "宮剤県")
    end
    when "鹿児島県"
      where(furigana_initial: "鹿児島県")
    end
    when "沖縄県"
      where(furigana_initial: "沖縄県")
    end
  end
  # rubocop:enable all
end
