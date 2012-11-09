$ ->
	$(".task_list").live("hover", toggle_actions)
 
toggle_actions = () ->
	$(@).find(".task_list_actions").toggle();
	