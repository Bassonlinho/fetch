class TaskDecorator < Draper::Decorator
	delegate_all
	decorates :task

	def toggle_buttons
		if model.active?
			h.button_to('Off',h.inactive_task_path(model),:method => :put,:class => 'btn button-header')
		else
			h.button_to('On',h.active_task_path(model),:method => :put,:class => '
				btn button-header')
		end
	end
end
