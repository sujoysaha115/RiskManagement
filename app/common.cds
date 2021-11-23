using riskmanagement  as rm from '../db/schema';

annotate rm.Risks with {
    ID @title : 'Risk';
    title @title : 'Title';
    owner @title : 'Owner';
    prio @title : 'Priority';
    descr @title : 'Description';
    miti @title : 'Mitigation';
    impact @title : 'Impact';
}
annotate rm.Mitigations with {
    ID @( 
        UI.Hidden,
        Commong : {Test : descr}
    );
    owner @title : 'Owner';    
    descr @title : 'Description';
}