var Tv = Tv || {};

Tv.Listeners = {};

Tv.Listeners.onSenderProfileChange = function(){

    if($(this).val() === "profile_api_smsbump"){
        $("#smshare_api_url").val("http://api.smsbump.com/send/{apikey}.json");
        $("#smshare_api_http_method option[value=get]").prop('selected', true);
        $("#smshare_api_dest_var").val("to");
        $("#smshare_api_msg_var").val("message");
        
    }else if($(this).val() === "profile_api"){
        $("#smshare_api_url").val("");
        $("#smshare_api_http_method option[value=get]").prop('selected', true);
        $("#smshare_api_dest_var").val("");
        $("#smshare_api_msg_var").val("");    
    }
}

Tv.Listeners.hideUnwantedSendingDetails = function(){
    
    if($(this).val() === "profile_android"){
        $("#profile_android_settings").show();
        $("#profile_api_settings").hide();

    }else{    //profile_api
        $("#profile_android_settings").hide();
        $("#profile_api_settings").show();
    }
};


Tv.addEventListenersForSendingProfileSelector = function(){
    $("#smshare_sender_profile").on("change", Tv.Listeners.hideUnwantedSendingDetails);
    $("#smshare_sender_profile").on("change", Tv.Listeners.onSenderProfileChange);
};

/**
 * 
 */
Tv.addEventListenersForFieldsCreation = function(){


	$("#smshare-add-new-field").click(function(e){

		e.preventDefault();

		var $tmplClone = $("#data-tv-fields-tmpl").clone();
		$tmplClone.attr('id', null);
		$tmplClone.find('input').val('');
		$("#fields-wrapper").append($tmplClone);

	});

	$("#add-order-observer").click(function(e){
		e.preventDefault();
		
		var $tmplClone = $("#data-tv-observer-tmpl").clone();
		$tmplClone.attr('id', null);
		$tmplClone.find('select option').first().attr('selected', true);
		$tmplClone.find('textarea').val('');
		$("#observers-wrapper").append($tmplClone);
	});

	$(document.body).on('click', 'a[data-tv-remove]', function(e){
		e.preventDefault();
		$(this).parents("div[data-tv-kv]").not('[id=data-tv-fields-tmpl]').remove();
	});


	$("#smshare-form").submit(function(){
		
		/*
		 * Gateway params
		 */
		var i = 0;
		$("div[data-tv-kv]").each(function(index, element){
			$("input[data-tv-kv-key]", 	  element).attr("name", "smshare_api_kv[" + i + "][key]");
			$("input[data-tv-kv-val]", 	  element).attr("name", "smshare_api_kv[" + i + "][val]");
			$("input[data-tv-kv-encode]", element).attr("name", "smshare_api_kv[" + i + "][encode]");
			i++;
		});

		/*
		 * Order observers
		 */
		i = 0;
		$("div[data-tv-observer]").each(function(index, element){
			$("select[data-tv-observer-status]", element).attr("name", "smshare_cfg_odr_observers[" + i + "][key]");
			$textareas = $("textarea[data-tv-observer-msg]",  element);
			$textareas.each(function(arg1, textarea){
			    $textarea = $(textarea);
			    $textarea.attr("name", "smshare_cfg_odr_observers[" + i + "][val][" + $textarea.attr("data-tv-lg") + "]");
			});
			i++;
		});
		
		
	});

};

$(function() {
	Tv.addEventListenersForFieldsCreation();
	Tv.addEventListenersForSendingProfileSelector();    //Add listener
	Tv.Listeners.hideUnwantedSendingDetails.call(document.getElementById("smshare_sender_profile"));               //Run the listener for the first time.
});