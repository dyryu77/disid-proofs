// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.disid.proofs.client.config.jackson;

import com.disid.proofs.client.config.jackson.DomainModelModule;
import com.disid.proofs.client.domain.Operation;
import com.disid.proofs.client.domain.Person;
import com.disid.proofs.client.domain.Tool;
import com.disid.proofs.client.web.html.OperationJsonMixin;
import com.disid.proofs.client.web.html.PersonJsonMixin;
import com.disid.proofs.client.web.html.ToolJsonMixin;
import com.fasterxml.jackson.databind.module.SimpleModule;
import org.springframework.boot.jackson.JsonComponent;

privileged aspect DomainModelModule_Roo_DomainModelModule {
    
    declare parents: DomainModelModule extends SimpleModule;
    
    declare @type: DomainModelModule: @JsonComponent;
    
    /**
     * TODO Auto-generated constructor documentation
     * 
     */
    public DomainModelModule.new() {
        // Mixin registration
        
        setMixInAnnotation(Operation.class, OperationJsonMixin.class);
        setMixInAnnotation(Person.class, PersonJsonMixin.class);
        setMixInAnnotation(Tool.class, ToolJsonMixin.class);
    }

}