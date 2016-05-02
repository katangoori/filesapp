class Entity < ActiveRecord::Base
  belongs_to :entity, class_name: :Entity, foreign_key: :entity_id, dependent: :destroy
  has_many :sub_entities, class_name: :Entity, foreign_key: :entity_id

  validates :name, presence: true
  validate :dup, if: Proc.new { |entity| entity.entity_id }
  validate :root_dup, unless: Proc.new { |entity| entity.entity_id }

  
  def directory?
    self.entity_type == 'D'
  end
  
  def root_path
    sub_entity = self
	path = ''
	while(sub_entity) do
	  path = "/#{sub_entity.name}#{path}"
	  sub_entity = sub_entity.entity
	end
	path
  end
  
  private
  
  def dup
    if self.entity.sub_entities.pluck(:name).include? self.name
	  errors.add(:name, "already exists")
	end
  end
  
  def root_dup
    if Entity.where(entity_id: nil).pluck(:name).include? self.name
	   errors.add(:name, "already exists")
	end
  end
  
end
