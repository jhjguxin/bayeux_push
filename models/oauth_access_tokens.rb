class AccessToken
  include Mongoid::Document
  include Mongoid::Timestamps
  #store_in collection: :oauth_access_tokens
  store_in session: "oauth_server", collection: :oauth_access_tokens

  field :resource_owner_id, :type => Moped::BSON::ObjectId
  field :token, :type => String
  field :expires_in, :type => Integer
  field :revoked_at, :type => DateTime

  index({ token: 1 }, { unique: true })
  index({ refresh_token: 1 }, { unique: true, sparse: true })
  
  def self.is_vaild_token?(resource_owner_id, application_id, token)
    AccessToken.where(resource_owner_id: resource_owner_id, application_id: application_id, token: token).present?
  end
  
  def self.is_invaild_token?(resource_owner_id, application_id, token)
    !self.is_vaild_token?(resource_owner_id, application_id, token)
  end
end
