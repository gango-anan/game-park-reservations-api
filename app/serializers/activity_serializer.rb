class ActivitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :title, :park, :image_url, :details
  belongs_to :user
end
