<aura:application extends="force:slds">
    <!--<c:treeGrid/>-->
    
   <!-- <c:lwcBusinessVertical></c:lwcBusinessVertical>-->
    <table aria-multiselectable="true" class="slds-table slds-table_bordered slds-table_edit slds-table_fixed-layout slds-table_resizable-cols slds-tree slds-table_tree" role="treegrid" aria-label="Example default tree grid">
<thead>
<tr class="slds-line-height_reset">
<th class="slds-text-align_right" scope="col" style="width:3.25rem">
<span id="column-group-header" class="slds-assistive-text">Choose a row</span>
<div class="slds-th__action slds-th__action_form">
<div class="slds-checkbox">
<input type="checkbox" name="options" id="checkbox-unique-id-197" value="checkbox-unique-id-197" tabindex="-1" aria-labelledby="check-select-all-label column-group-header" />
<label class="slds-checkbox__label" for="checkbox-unique-id-197" id="check-select-all-label">
<span class="slds-checkbox_faux"></span>
<span class="slds-form-element__label slds-assistive-text">Select All</span>
</label>
</div>
</div>
</th>
<th aria-sort="none" class="slds-has-button-menu slds-is-resizable slds-is-sortable" scope="col">
<a class="slds-th__action slds-text-link_reset" href="#" role="button" tabindex="-1">
<span class="slds-assistive-text">Sort by: </span>
<div class="slds-grid slds-grid_vertical-align-center slds-has-flexi-truncate">
<span class="slds-truncate" title="Account Name">Account Name</span>
<span class="slds-icon_container slds-icon-utility-arrowdown">
</span>
</div>
</a>
<button class="slds-button slds-button_icon slds-th__action-button slds-button_icon-x-small" aria-haspopup="true" tabindex="-1" title="Show Account Name column actions">
<span class="slds-assistive-text">Show Account Name column actions</span>
</button>
<div class="slds-resizable">
<input type="range" aria-label="Account Name column width" class="slds-resizable__input slds-assistive-text" id="cell-resize-handle-146" max="1000" min="20" tabindex="-1" />
<span class="slds-resizable__handle">
<span class="slds-resizable__divider"></span>
</span>
</div>
</th>
<th aria-sort="none" class="slds-has-button-menu slds-is-resizable slds-is-sortable" scope="col">
<a class="slds-th__action slds-text-link_reset" href="#" role="button" tabindex="-1">
<span class="slds-assistive-text">Sort by: </span>
<div class="slds-grid slds-grid_vertical-align-center slds-has-flexi-truncate">
<span class="slds-truncate" title="Employees">Employees</span>
<span class="slds-icon_container slds-icon-utility-arrowdown">
</span>
</div>
</a>
<button class="slds-button slds-button_icon slds-th__action-button slds-button_icon-x-small" aria-haspopup="true" tabindex="-1" title="Show Employees column actions">
<span class="slds-assistive-text">Show Employees column actions</span>
</button>
<div class="slds-resizable">
<input type="range" aria-label="Employees column width" class="slds-resizable__input slds-assistive-text" id="cell-resize-handle-147" max="1000" min="20" tabindex="-1" />
<span class="slds-resizable__handle">
<span class="slds-resizable__divider"></span>
</span>
</div>
</th>
<th aria-sort="none" class="slds-has-button-menu slds-is-resizable slds-is-sortable" scope="col">
<a class="slds-th__action slds-text-link_reset" href="#" role="button" tabindex="-1">
<span class="slds-assistive-text">Sort by: </span>
<div class="slds-grid slds-grid_vertical-align-center slds-has-flexi-truncate">
<span class="slds-truncate" title="Phone Number">Phone Number</span>
<span class="slds-icon_container slds-icon-utility-arrowdown">
</span>
</div>
</a>
<button class="slds-button slds-button_icon slds-th__action-button slds-button_icon-x-small" aria-haspopup="true" tabindex="-1" title="Show Phone Number column actions">
<span class="slds-assistive-text">Show Phone Number column actions</span>
</button>
<div class="slds-resizable">
<input type="range" aria-label="Phone Number column width" class="slds-resizable__input slds-assistive-text" id="cell-resize-handle-148" max="1000" min="20" tabindex="-1" />
<span class="slds-resizable__handle">
<span class="slds-resizable__divider"></span>
</span>
</div>
</th>
<th aria-sort="none" class="slds-has-button-menu slds-is-resizable slds-is-sortable" scope="col">
<a class="slds-th__action slds-text-link_reset" href="#" role="button" tabindex="-1">
<span class="slds-assistive-text">Sort by: </span>
<div class="slds-grid slds-grid_vertical-align-center slds-has-flexi-truncate">
<span class="slds-truncate" title="Account Owner">Account Owner</span>
<span class="slds-icon_container slds-icon-utility-arrowdown">
</span>
</div>
</a>
<button class="slds-button slds-button_icon slds-th__action-button slds-button_icon-x-small" aria-haspopup="true" tabindex="-1" title="Show Account Owner column actions">
<span class="slds-assistive-text">Show Account Owner column actions</span>
</button>
<div class="slds-resizable">
<input type="range" aria-label="Account Owner column width" class="slds-resizable__input slds-assistive-text" id="cell-resize-handle-149" max="1000" min="20" tabindex="-1" />
<span class="slds-resizable__handle">
<span class="slds-resizable__divider"></span>
</span>
</div>
</th>
<th aria-sort="none" class="slds-has-button-menu slds-is-resizable slds-is-sortable" scope="col">
<a class="slds-th__action slds-text-link_reset" href="#" role="button" tabindex="-1">
<span class="slds-assistive-text">Sort by: </span>
<div class="slds-grid slds-grid_vertical-align-center slds-has-flexi-truncate">
<span class="slds-truncate" title="Billing City">Billing City</span>
<span class="slds-icon_container slds-icon-utility-arrowdown">
</span>
</div>
</a>
<button class="slds-button slds-button_icon slds-th__action-button slds-button_icon-x-small" aria-haspopup="true" tabindex="-1" title="Show Billing City column actions">
<span class="slds-assistive-text">Show Billing City column actions</span>
</button>
<div class="slds-resizable">
<input type="range" aria-label="Billing City column width" class="slds-resizable__input slds-assistive-text" id="cell-resize-handle-150" max="1000" min="20" tabindex="-1" />
<span class="slds-resizable__handle">
<span class="slds-resizable__divider"></span>
</span>
</div>
</th>
<th class="" scope="col" style="width:3.25rem">
<div class="slds-truncate slds-assistive-text" title="Actions">Actions</div>
</th>
</tr>
</thead>
<tbody>
<tr aria-level="1" aria-posinset="1" aria-selected="false" aria-setsize="4" class="slds-hint-parent" tabindex="0">
<td class="slds-text-align_right" role="gridcell" style="width:3.25rem">
<div class="slds-checkbox">
<input type="checkbox" name="options" id="checkbox-0173" value="checkbox-0173" aria-labelledby="check-button-label-0173 column-group-header" />
<label class="slds-checkbox__label" for="checkbox-0173" id="check-button-label-0173">
<span class="slds-checkbox_faux"></span>
<span class="slds-form-element__label slds-assistive-text">Select item 173</span>
</label>
</div>
</td>
<th class="slds-tree__item" data-label="Account Name" scope="row">
<button class="slds-button slds-button_icon slds-button_icon-x-small slds-m-right_x-small slds-is-disabled" aria-hidden="true" tabindex="-1" title="Expand Rewis Inc">
<span class="slds-assistive-text">Expand Rewis Inc</span>
</button>
<div class="slds-truncate" title="Rewis Inc">
<a href="#" tabindex="-1">Rewis Inc</a>
</div>
    <lightning:icon iconName="action:approval" alternativeText="Approved" title="Approved" size="xx-small" style="margin-left:20px;"/>
        <lightning:icon iconName="action:delete" alternativeText="Delete" title="Delete" size="xx-small"/>
        <lightning:icon iconName="action:new_note" alternativeText="New note" title="New note" size="xx-small" />
        <lightning:icon iconName="action:preview" alternativeText="Preview" title="Preview" size="xx-small"/>
</th>
<td data-label="Employees" role="gridcell">
<div class="slds-truncate" title="3,100">3,100</div>
</td>
<td data-label="Phone Number" role="gridcell">
<div class="slds-truncate" title="837-555-1212">837-555-1212</div>
</td>
<td data-label="Account Owner" role="gridcell">
<div class="slds-truncate" title="Jane Doe">
<a href="#" tabindex="-1">Jane Doe</a>
</div>
</td>
<td data-label="Billing City" role="gridcell">
<div class="slds-truncate" title="Phoenix, AZ">Phoenix, AZ</div>
</td>
<td role="gridcell" style="width:3.25rem">
<button class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" tabindex="-1" title="More actions for Rewis Inc">
<span class="slds-assistive-text">More actions for Rewis Inc</span>
</button>
</td>
</tr>
<tr aria-expanded="false" aria-level="1" aria-posinset="2" aria-selected="false" aria-setsize="4" class="slds-hint-parent">
<td class="slds-text-align_right" role="gridcell" style="width:3.25rem">
<div class="slds-checkbox">
<input type="checkbox" name="options" id="checkbox-0174" value="checkbox-0174" aria-labelledby="check-button-label-0174 column-group-header" />
<label class="slds-checkbox__label" for="checkbox-0174" id="check-button-label-0174">
<span class="slds-checkbox_faux"></span>
<span class="slds-form-element__label slds-assistive-text">Select item 174</span>
</label>
</div>
</td>
<th class="slds-tree__item" data-label="Account Name" scope="row">
<button class="slds-button slds-button_icon slds-button_icon-x-small slds-m-right_x-small" aria-hidden="true" tabindex="-1" title="Expand Acme Corporation">
<span class="slds-assistive-text">Expand Acme Corporation</span>
</button>
<div class="slds-truncate" title="Acme Corporation">
<a href="#" tabindex="-1">Acme Corporation</a>
</div>
</th>
<td data-label="Employees" role="gridcell">
<div class="slds-truncate" title="10,000">10,000</div>
</td>
<td data-label="Phone Number" role="gridcell">
<div class="slds-truncate" title="837-555-1212">837-555-1212</div>
</td>
<td data-label="Account Owner" role="gridcell">
<div class="slds-truncate" title="John Doe">
<a href="#" tabindex="-1">John Doe</a>
</div>
</td>
<td data-label="Billing City" role="gridcell">
<div class="slds-truncate" title="San Francisco, CA">San Francisco, CA</div>
</td>
<td role="gridcell" style="width:3.25rem">
<button class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" tabindex="-1" title="More actions for Acme Corporation">
<span class="slds-assistive-text">More actions for Acme Corporation</span>
</button>
</td>
</tr>
<tr aria-expanded="false" aria-level="1" aria-posinset="3" aria-selected="false" aria-setsize="4" class="slds-hint-parent">
<td class="slds-text-align_right" role="gridcell" style="width:3.25rem">
<div class="slds-checkbox">
<input type="checkbox" name="options" id="checkbox-0175" value="checkbox-0175" aria-labelledby="check-button-label-0175 column-group-header" />
<label class="slds-checkbox__label" for="checkbox-0175" id="check-button-label-0175">
<span class="slds-checkbox_faux"></span>
<span class="slds-form-element__label slds-assistive-text">Select item 175</span>
</label>
</div>
</td>
<th class="slds-tree__item" data-label="Account Name" scope="row">
<button class="slds-button slds-button_icon slds-button_icon-x-small slds-m-right_x-small" aria-hidden="true" tabindex="-1" title="Expand Rohde Enterprises">
<span class="slds-assistive-text">Expand Rohde Enterprises</span>
</button>
<div class="slds-truncate" title="Rohde Enterprises">
<a href="#" tabindex="-1">Rohde Enterprises</a>
</div>
</th>
<td data-label="Employees" role="gridcell">
<div class="slds-truncate" title="6,000">6,000</div>
</td>
<td data-label="Phone Number" role="gridcell">
<div class="slds-truncate" title="837-555-1212">837-555-1212</div>
</td>
<td data-label="Account Owner" role="gridcell">
<div class="slds-truncate" title="John Doe">
<a href="#" tabindex="-1">John Doe</a>
</div>
</td>
<td data-label="Billing City" role="gridcell">
<div class="slds-truncate" title="New York, NY">New York, NY</div>
</td>
<td role="gridcell" style="width:3.25rem">
<button class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" tabindex="-1" title="More actions for Rohde Enterprises">
<span class="slds-assistive-text">More actions for Rohde Enterprises</span>
</button>
</td>
</tr>
<tr aria-level="1" aria-posinset="4" aria-selected="false" aria-setsize="4" class="slds-hint-parent">
<td class="slds-text-align_right" role="gridcell" style="width:3.25rem">
<div class="slds-checkbox">
<input type="checkbox" name="options" id="checkbox-0176" value="checkbox-0176" aria-labelledby="check-button-label-0176 column-group-header" />
<label class="slds-checkbox__label" for="checkbox-0176" id="check-button-label-0176">
<span class="slds-checkbox_faux"></span>
<span class="slds-form-element__label slds-assistive-text">Select item 176</span>
</label>
</div>
</td>
<th class="slds-tree__item" data-label="Account Name" scope="row">
<button class="slds-button slds-button_icon slds-button_icon-x-small slds-m-right_x-small slds-is-disabled" aria-hidden="true" tabindex="-1" title="Expand Cheese Corp">
<span class="slds-assistive-text">Expand Cheese Corp</span>
</button>
<div class="slds-truncate" title="Cheese Corp">
<a href="#" tabindex="-1">Cheese Corp</a>
</div>
</th>
<td data-label="Employees" role="gridcell">
<div class="slds-truncate" title="1,234">1,234</div>
</td>
<td data-label="Phone Number" role="gridcell">
<div class="slds-truncate" title="837-555-1212">837-555-1212</div>
</td>
<td data-label="Account Owner" role="gridcell">
<div class="slds-truncate" title="Jane Doe">
<a href="#" tabindex="-1">Jane Doe</a>
</div>
</td>
<td data-label="Billing City" role="gridcell">
<div class="slds-truncate" title="Paris, France">Paris, France</div>
</td>
<td role="gridcell" style="width:3.25rem">
<button class="slds-button slds-button_icon slds-button_icon-border-filled slds-button_icon-x-small" aria-haspopup="true" tabindex="-1" title="More actions for Cheese Corp">
<span class="slds-assistive-text">More actions for Cheese Corp</span>
</button>
</td>
</tr>
</tbody>
</table>
    
    
</aura:application>