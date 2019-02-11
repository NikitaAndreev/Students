ActiveAdmin.register Lesson do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  permit_params do
    permitted = [:user_id, :task_id, :lesson_date, :visited, :result, :lesson_type]
  #   permitted << :other if resource.something?
    permitted
  end

  # form do |f|
  #   f.inputs  do
  #     f.input :group, :collection =>  Group.current.collect { |p| [ p.kod, p.id ] }
  #     f.input :kod, :collection => Hash[Lesson::KODES.map{|kod| [t(kod),kod]}]
  #   end
  #   f.actions
  #
  # end

end
