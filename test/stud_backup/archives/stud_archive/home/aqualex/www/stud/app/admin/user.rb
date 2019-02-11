ActiveAdmin.register User do
  # belongs_to :group
  permit_params :email, :family, :name, :last_name, :group_id, :role
  filter :groups, as: :select, collection: Group.all.map {|u| [u.number, u.id]}

  index do
    column :id
    column 'groups' do |user|
        user.groups.map do|g|
          g.number
        end
    end
    column :family
    column :name
    column :last_name
    column :email
    column :role

    actions
  end

  form do |f|
    f.inputs do
      f.input :groups, as: :select, collection: Group.live.map {|u| [u.number, u.id]}, :include_blank => false
      f.input :family
      f.input :name
      f.input :email
      f.input :role, as: :select, collection: User::ROLE

    end

    f.actions
  end
end