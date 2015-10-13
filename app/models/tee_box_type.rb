class TeeBoxType < ActiveRecord::Base

  include FrescaModules::ClassLevelInheritableAttributes

  inheritable_attributes :mens, :ladies, :both
  @mens='MENS'
  @ladies='LADIES'
  @both='BOTH'

  validates :tee_box_type, presence: true

  has_many :tee_boxes, :dependent => :destroy

end
