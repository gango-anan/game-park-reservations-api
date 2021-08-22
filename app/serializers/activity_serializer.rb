class ActivitySerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :title, :park, :image_url, :details
end
