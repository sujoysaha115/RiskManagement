namespace riskmanagement;
 using  from '@sap/cds/common';

entity Risks {
    key id : UUID @Core.Computed : true;
    title : String(100);
    owner : String;
    prio : String(5);
    descr : String;
    miti : Association to  Mitigations;
    impact : Integer;
    criticality : Integer;
}
entity Mitigations {
    key id : UUID @Core.Computed : true;
    descr : String;
    owner : String;
    timeline : String;
    risk : Association to many Risks on risk.miti = $self; 
}   


using { API_BUSINESS_PARTNER AS external } from '../srv/external/API_BUSINESS_PARTNER.csn';
entity BusinessPartners as projection on external.A_BusinessPartner {
    key BusinessPartner,
    LastName,
    FirstName    
}