$ ->
	$(".task").live("hover", toggle_actions)
	$(".owner.task").live("click", ajax_edition)
	$(".edit_task").live("blur", submit_edit_task_form)

toggle_actions = () ->
	$(@).find(".task_actions").toggle()
	
ajax_edition = () ->
	$.ajax($(@).attr("data-edit-url"))

submit_edit_task_form = () ->
	$(@).submit()