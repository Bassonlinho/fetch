ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
    end


    columns do
        column do
            panel "Tasks" do
                table do
                    tr do
                        th 'ID'
                        th 'Email'
                        th 'Url'
                        th 'Words'
                        th 'Status'
                    end
                    Task.all.map do |task|
                      tr do
                        td task.id
                        td task.email
                        td task.url
                        td task.words
                        td task.status?
                    end
                end
            end
        end
    end

    columns do
        column do
            panel "Users" do
                table do
                    tr do
                        th 'ID'
                        th 'Email'
                    end
                    User.all.map do |user|
                        tr do
                            td user.id
                            td user.email
                        end
                    end
                end
            end
        end
    end
end
end
end