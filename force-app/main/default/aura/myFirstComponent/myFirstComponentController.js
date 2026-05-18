({
	handleClickPrevious : function(component, event, helper) {
		
        component.set("v.truthy2",false);
        component.set("v.truthy1",true);
	},
    handleClickNext : function(component, event, helper) {
		
        
        
        component.set("v.truthy1",false);
        component.set("v.truthy2",true);
	},
    handleRefreshView : function(component, event, helper) {
        
        $A.get('e.force:refreshView').fire();
        
        
    }
    
})