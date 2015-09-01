class Account < ActiveRecord::Base

  after_create :create_tenant

  has_and_belongs_to_many :users

  RESTRICTED_SUBDOMAINS = %w(www)

  # belongs_to :owner, class_name: 'User'

  # validates :owner, presence: true
  validates :subdomain, presence: true,
                        uniqueness: { case_sensitive: false },
                        format: { with: /\A[\w\-]+\Z/i, message: 'contains invalid characters' },
                        exclusion: { in: RESTRICTED_SUBDOMAINS, message: 'restricted' }


  private
    def create_tenant
       Apartment::Tenant.create(subdomain)
    end




end
