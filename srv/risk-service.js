const cds = require("@sap/cds");

module.exports = cds.service.impl( async function() {
                const { Risks,BusinessPartners } = this.entities;

                this.after("READ", Risks, (data) => {
                   const risks = Array.isArray(data) ? data : [data];
                   risks.forEach( (risk) => {
                    if (risk.impact >= 10)
                    {
                        risk.criticality = 1;   
                    } else 
                    {
                        risk.criticality = 2;   
                    }
                      
                   });
                });

                const BPsrv = await cds.connect.to("API_BUSINESS_PARTNER");
                this.on("READ", BusinessPartners, async (req) => {
                    req.query.where("LastName <> '' and FirstName <> '' ");
                    return await BPsrv.transaction(req).send({
                        query: req.query,
                        headers: {
                            apikey: process.env.apikey,
                        },
                    });
                });
            });