<aura:application extends="force:slds">
    <aura:attribute name="selectedLookUpRecord" type="sObject" default="{}"/>
    <div class="container">
        
       <!-- <c:fileUpload parentId="001f400000O90hm"/>-->
        <!--<c:FileUploader/>-->
        
        <!-- Create attribute to store lookup value as a sObject--> 
      
     
      <!--<c:CustomLookup objectAPIName="account" IconName="standard:account" selectedRecord="{!v.selectedLookUpRecord}" label="Account Name"/>-->
      
        
       <!-- <c:LightningDataTable /> -->
        <!--<c:NameChange />-->
        
        <!--<c:ContactList parentId="001f400000O90hnAAB"/>-->
        <c:ParentComponent/>
        
    </div>
    
    
    

    
</aura:application>