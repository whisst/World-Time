describe('World time API testing', ()=> {
    it('GET-Time zone', ()=>{
        cy.request('http://worldtimeapi.org/api/timezone/').then((response) => {
            expect(response.body).to.not.be.null
            expect(response.body).to.have.length(387)
        })
        cy.document().then((doc) =>{
            cy.request('http://worldtimeapi.org/api/timezone/Europe')
            cy.wait
        })
        })
    })
    it('Get-Synchronization', ()=>{
        const now = new Date(2018, 4, 28).getTime()
        cy.clock(now)
        cy.request('http://worldtimeapi.org/api/timezone/Europe/London.txt')
    })