({
	handleClick : function(component, event, helper) {
		console.log("event firing");
        var cmpEvent = component.getEvent("statusUpdateEvent");
        cmpEvent.setParams({
            "status" : "Completed" });
        cmpEvent.fire();
        console.log("event fired");

	},
    callChildMethod: function(component, event, helper){
        component.set("v.childStatus","In Progress");
    }
})