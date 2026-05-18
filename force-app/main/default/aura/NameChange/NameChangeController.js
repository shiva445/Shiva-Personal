({
	doInit : function(component, event, helper) {
		component.set("v.outputValueVariable","Yshu");
	},
    changeName : function(component, event, helper) {
		var outputVarVal = component.get("v.outputValueVariable");
        if(outputVarVal=='Yshu'){
            component.set("v.outputValueVariable","Vaishnavi");            
        }else{
            component.set("v.outputValueVariable","Yshu"); 
        }
        
	}
})