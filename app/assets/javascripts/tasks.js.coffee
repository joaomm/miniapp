$ ->
	$(".task").live("hover", toggle_actions)
	$(".owner.task").live("click", ajax_edition);

toggle_actions = () ->
	$(@).find(".task_actions").toggle();
	
ajax_edition = () ->
	$.ajax($(@).attr("data-edit-url"));
