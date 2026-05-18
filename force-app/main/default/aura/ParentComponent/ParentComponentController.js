({
	updateStatusHandler : function(component, event, helper) {
        console.log('Event received');
		var status = event.getParam("status");
        console.log('Status from Child component is '+status);
        component.set("v.ChildStatus",status);
	},
    handleParentButtonClick : function(component, event, helper){
        var childComp = component.find('childComp1');
        childComp.callChild();
    }
})