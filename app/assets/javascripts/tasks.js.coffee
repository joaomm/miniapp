$ ->
	$(".task").live("hover", toggle_actions)

toggle_actions = () ->
	$(@).find(".task_actions").toggle();