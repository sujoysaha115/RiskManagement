using RiskService as service from '../../srv/risk-service';

//risk list report page
annotate RiskService.Risks with @ (UI : {
    HeaderInfo  : {
        $Type : 'UI.HeaderInfoType',
        TypeName : 'Risk',
        TypeNamePlural : 'Risks',
        Title : {   
                $Type : 'UI.DataField',
                Value : title   
                },
        Description : {   
                $Type : 'UI.DataField',
                Value : descr   
                }     
    },
    SelectionFields  : [prio],
    Identification  : [{Value : title}],
    LineItem  : [
                {Value : title},
                {Value : miti_id},
                {Value : owner},
                {Value : prio, Criticality : criticality},
                {Value : impact, Criticality : criticality},
                ],
});

//risk object page
annotate RiskService.Risks with @ (UI : {
    Facets  : [{
                $Type : 'UI.ReferenceFacet',
                Label : 'Main',
                Target : '@UI.FieldGroup#Main',
              }],
     FieldGroup  #Main : {Data : [
                    {Value : miti_id},
                    {Value : owner},
                    {Value : prio, Criticality : criticality},
                    {Value : impact, Criticality : criticality},
                 ]},         
});
