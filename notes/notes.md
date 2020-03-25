# Component Library

https://<myDomain>.lightning.force.com/docs/component-library
https://developer.salesforce.com/docs/component-library

# Where can I use LWC?

https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.get_started_supported_experiences

# Naming Conventions

https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.create_components_folder

**The LWC Component folder and its files must follow these naming rules:**

- Must begin with a lowercase letter
- Must contain only alphanumeric or underscore characters
- Must be unique in the namespace
- Can’t include whitespace
- Can’t end with an underscore
- Can’t contain two consecutive underscores
- Can’t contain a hyphen (dash)

`myComponent` = `<c-my-component></c-my-component>`  
`my_component` = `<c-my_component></c-my_component>` (NOT RECOMMENDED)

# Salesforce Import Modules

https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.reference_salesforce_modules

# Component Configuration Files

https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.reference_configuration_tags

Example:

```xml
<?xml version="1.0" encoding="UTF-8" ?>
<LightningComponentBundle xmlns="http://soap.sforce.com/2006/04/metadata">
  <apiVersion>47.0</apiVersion>
  <isExposed>true</isExposed>
  <masterLabel>Best Component Ever</masterLabel>
  <description>This is a demo component.</description>
  <targets>
      <target>lightning__RecordPage</target>
      <target>lightning__AppPage</target>
      <target>lightning__HomePage</target>
  </targets>
  <targetConfigs>
      <targetConfig targets="lightning__RecordPage">
          <property name="prop1" type="String" />
          <objects>
              <object>Account</object>
              <object>Opportunity</object>
              <object>Warehouse__c</object>
          </objects>
      </targetConfig>
      <targetConfig targets="lightning__AppPage, lightning__HomePage">
          <property name="prop2" type="Boolean" />
      </targetConfig>
  </targetConfigs>
</LightningComponentBundle>
```

Data Binding in a Template

# HTML Template Directives

https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.reference_directives

- `for:each={array}`, `for:item="currentItem"`, `for:index="index"`
- `iterator:iteratorName={array}`
- `if:true|false={expression}`
- `key={uniqueId}`
- `lwc:dom="manual"`

# Decorators

- `@api`
- `@track`
- `@wire`
  - `@wire(getRecord, { recordId: '$recordId', fields: [ACCOUNT_NAME_FIELD] })`
    - Note: `$` means that recordId is dynamic and will be taken from a class level property
  - https://developer.salesforce.com/docs/component-library/documentation/en/lwc/lwc.data_wire_service_about

# @Wire Syntax

```javascript
import { LightningElement, api, wire } from "lwc";
import { getRecord } from "lightning/uiRecordApi";
import ACCOUNT_NAME_FIELD from "@salesforce/schema/Account.Name";

export default class Record extends LightningElement {
  @api recordId;

  @wire(getRecord, { recordId: "$recordId", fields: [ACCOUNT_NAME_FIELD] })
  record;
}

///////////////

import { LightningElement, api, track, wire } from "lwc";
import { getRecord } from "lightning/uiRecordApi";

export default class WireFunction extends LightningElement {
  @api recordId;
  @track record;
  @track error;

  @wire(getRecord, { recordId: "$recordId", fields: ["Account.Name"] })
  wiredAccount({ error, data }) {
    if (data) {
      this.record = data;
      this.error = undefined;
    } else if (error) {
      this.error = error;
      this.record = undefined;
    }
  }
  get name() {
    return this.record.fields.Name.value;
  }
}

<!-- wireFunction.html -->
<template>
    <lightning-card title="Wire Function" icon-name="standard:contact">
        <template if:true={record}>
            <div class="slds-m-around_medium">
                <p>{name}</p>
            </div>
        </template>
        <template if:true={error}>
            <c-error-panel errors={error}></c-error-panel>
        </template>
    </lightning-card>
</template>
```

## Imports

```javascript
// To import a reference to an object, use this syntax.
// import objectName from '@salesforce/schema/object';
// import objectName from '@salesforce/schema/namespace__object';

import POSITION_OBJECT from "@salesforce/schema/Position__c";
import ACCOUNT_OBJECT from "@salesforce/schema/Account";

// To import a reference to a field, use this syntax.
// import FIELD_NAME from '@salesforce/schema/object.field';

import POSITION_LEVEL_FIELD from "@salesforce/schema/Position__c.Level__c";
import ACCOUNT_NAME_FIELD from "@salesforce/schema/Account.Name";

// To import a reference to a field via a relationship, use this syntax. You can use relationship fields to traverse to parent objects and fields. You can specify up to three relationship fields, which results in four objects and the field being referenced. For example, Opportunity.Account.CreatedBy.LastModifiedById returns 4 levels of spanning fields.
// import SPANNING_FIELD_NAME from '@salesforce/schema/object.relationship.field';

import POSITION_HIRINGMANAGER_NAME_FIELD__c from "@salesforce/schema/Position__c.HiringManager__r.Name__c";
import ACCOUNT_OWNER_NAME_FIELD from "@salesforce/schema/Account.Owner.Name";

// Call apex method
import apexMethod from '@salesforce/apex/Namespace.Classname.apexMethod';
@wire(apexMethod, { apexMethodParams })
propertyOrFunction;
```
